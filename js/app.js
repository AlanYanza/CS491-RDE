var wrapper = document.getElementById("signature-pad");
var clearButton = wrapper.querySelector("[data-action=clear]");
var undoButton = wrapper.querySelector("[data-action=undo]");
var save = wrapper.querySelector("[data-action=save]");
var canvas = wrapper.querySelector("canvas");

var signaturePad = new SignaturePad(canvas, {
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
  data = sigObject.toData();

  var tempWidth = canvas.width;
  var tempHeight = canvas.height;
	
  // This part causes the canvas to be cleared
  canvas.width = canvas.offsetWidth * ratio;
  canvas.height = canvas.offsetHeight * ratio;
  canvas.getContext("2d").scale(ratio, ratio);

  var xDelta = canvas.width/tempWidth;
  var yDelta = canvas.height/tempHeight;

  for (i = 0; i < data.length; i++ ){
    for (j = 0; j < data[i].points.length; j++ ){
        data[i].points[j].x = data[i].points[j].x * xDelta;
        data[i].points[j].y = data[i].points[j].y * yDelta;
    }
  }

  //console.log(canvas.width);
  //console.log(canvas.height);

  // This library does not listen for canvas changes, so after the canvas is automatically
  // cleared by the browser, SignaturePad#isEmpty might still return false, even though the
  // canvas looks empty, because the internal data of this library wasn't cleared. To make sure
  // that the state of this library is consistent with visual state of the canvas, you
  // have to clear it manually.
  sigObject.clear();
  // Draws signature image from an array of point groups
  sigObject.fromData(data);
}

clearButton.addEventListener("click", function (event) {
  signaturePad.clear();
});

undoButton.addEventListener("click", function (event) {
  var data = signaturePad.toData();

  if (data) {
  	data.pop(); // remove the last dot or line
	signaturePad.fromData(data);
  }
});


save.addEventListener("click", function (event) {
  if (signaturePad.isEmpty()) {
	alert("Please provide a signature first.");
  } else {
	var dataURL = signaturePad.toDataURL();
  var data = signaturePad.toData();
	document.getElementById("signaturePic").innerHTML = "<img src='" + dataURL + "' class='img-responsive'/>";
	document.getElementById("signature").getAttributeNode("value").value = JSON.stringify(data);
  //var date = new Date();
  //document.getElementById("signatureDate").getAttributeNode("value").value = date.toISOString().slice(0, 10); ;
  //console.log(date.toISOString().slice(0, 10));
	$('.modal.in').modal('hide');
  }
});