"use strict";
var wrapper = document.getElementById("signature-pad");
var clearButton = wrapper.querySelector("[data-action=clear]");
var undoButton = wrapper.querySelector("[data-action=undo]");
var save = wrapper.querySelector("[data-action=save]");
var applicantCanvas = wrapper.querySelector("canvas");

var spouseWrapper = document.getElementById("spouseSignaturePad");
var spouseClearButton = spouseWrapper.querySelector("[data-action=clear]");
var spouseUndoButton = spouseWrapper.querySelector("[data-action=undo]");
var spouseSave = spouseWrapper.querySelector("[data-action=save]");
var spouseSigCanvas = spouseWrapper.querySelector("#spouseCanvas");

var applicantSigPad = new SignaturePad(applicantCanvas, {
  // It's Necessary to use an opaque color when saving image as JPEG;
  // this option can be omitted if only saving as PNG or SVG
  backgroundColor: 'rgb(255, 255, 255)'
});

var spouseSigPad = new SignaturePad(spouseSigCanvas, {
  // It's Necessary to use an opaque color when saving image as JPEG;
  // this option can be omitted if only saving as PNG or SVG
  backgroundColor: 'rgb(255, 255, 255)'
});

// Adjust canvas coordinate space taking into account pixel ratio,
// to make it look crisp on mobile devices.
// This also causes canvas to be cleared.
function resizeCanvas(sigObject, canvas) {
  // When zoomed out to less than 100%, for some very strange reason,
  // some browsers report devicePixelRatio as less than 1
  // and only part of the canvas is cleared then.
  var ratio =  Math.max(window.devicePixelRatio || 1, 1);
  
  // Returns signature image as an array of point groups
  var data = sigObject.toData();

  var tempWidth = canvas.width;
  var tempHeight = canvas.height;

  // This part causes the canvas to be cleared
  canvas.width = canvas.offsetWidth * ratio;
  canvas.height = canvas.offsetHeight * ratio;
  canvas.getContext("2d").scale(ratio, ratio);

  var xDelta = canvas.width/tempWidth;
  var yDelta = canvas.height/tempHeight;

  for (var i = 0; i < data.length; i++ ){
    for (var j = 0; j < data[i].points.length; j++ ){
        data[i].points[j].x = data[i].points[j].x * xDelta;
        data[i].points[j].y = data[i].points[j].y * yDelta;
    }
  }
  // This library does not listen for canvas changes, so after the canvas is automatically
  // cleared by the browser, SignaturePad#isEmpty might still return false, even though the
  // canvas looks empty, because the internal data of this library wasn't cleared. To make sure
  // that the state of this library is consistent with visual state of the canvas, you
  // have to clear it manually.
  sigObject.clear();
  // Draws signature image from an array of point groups
  sigObject.fromData(data);
}

function saveCanvas(sigPad, sigInput, sigPic) {
    if (sigPad.isEmpty()) {
  alert("Please provide a signature first.");
  } 
  else {
    var dataURL = sigPad.toDataURL();
    var data = sigPad.toData();
    document.getElementById(sigPic).innerHTML = "<img src='" + dataURL + "' class='img-responsive'/>";
    document.getElementById(sigInput).getAttributeNode("value").value = JSON.stringify(data);
    $('.modal.in').modal('hide');
  }
}

function clearCanvas(sigPad){
  sigPad.clear();
}

function undo(sigPad) {
  var data = sigPad.toData();

  if (data) {
    data.pop(); // remove the last dot or line
  sigPad.fromData(data);
  }
}

save.addEventListener("click", function(){saveCanvas(applicantSigPad, "signature", "signaturePic");});
spouseSave.addEventListener("click", function(){saveCanvas(spouseSigPad, "spouseSig", "spouseSignaturePic");});
clearButton.addEventListener("click", function(){clearCanvas(applicantSigPad);});
spouseClearButton.addEventListener("click", function(){clearCanvas(spouseSigPad);});
undoButton.addEventListener("click", function(){undo(applicantSigPad);});
spouseUndoButton.addEventListener("click", function(){undo(spouseSigPad);});