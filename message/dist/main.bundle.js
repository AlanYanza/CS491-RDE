webpackJsonp(["main"],{

/***/ "./src/$$_gendir lazy recursive":
/***/ (function(module, exports) {

function webpackEmptyAsyncContext(req) {
	// Here Promise.resolve().then() is used instead of new Promise() to prevent
	// uncatched exception popping up in devtools
	return Promise.resolve().then(function() {
		throw new Error("Cannot find module '" + req + "'.");
	});
}
webpackEmptyAsyncContext.keys = function() { return []; };
webpackEmptyAsyncContext.resolve = webpackEmptyAsyncContext;
module.exports = webpackEmptyAsyncContext;
webpackEmptyAsyncContext.id = "./src/$$_gendir lazy recursive";

/***/ }),

/***/ "./src/app/app.component.css":
/***/ (function(module, exports) {

module.exports = "/* Application-wide Styles */\r\nh1 {\r\n  color: #369;\r\n  font-family: Arial, Helvetica, sans-serif;\r\n  font-size: 250%;\r\n}\r\nh2, h3 {\r\n  color: #444;\r\n  font-family: Arial, Helvetica, sans-serif;\r\n  font-weight: lighter;\r\n}\r\nbody {\r\n  margin: 2em;\r\n}\r\nbody, input[text], button {\r\n  color: #888;\r\n  font-family: Cambria, Georgia;\r\n}\r\n/* everywhere else */\r\n* {\r\n  font-family: Arial, Helvetica, sans-serif;\r\n}"

/***/ }),

/***/ "./src/app/app.component.html":
/***/ (function(module, exports) {

module.exports = "<!--The content below is only a placeholder and can be replaced.-->\n<head>\n  <meta charset=\"utf-8\">\n  <title>Message Center</title>\n  <base href=\"/\">\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n  <link rel=\"icon\" type=\"image/x-icon\" href=\"favicon.ico\">\n  <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\" crossorigin=\"anonymous\">\n</head>\n<!-- <div style=\"text-align:center\">\n  <h1>\n    Welcome to {{title}}! \n  </h1>\n</div> -->\n<app-mail></app-mail>\n\n<script src=\"https://code.jquery.com/jquery-3.1.1.min.js\" integrity=\"sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=\" crossorigin=\"anonymous\"></script>\n<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\" integrity=\"sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa\" crossorigin=\"anonymous\"></script>\n\n\n"

/***/ }),

/***/ "./src/app/app.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return AppComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/@angular/core.es5.js");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};

var AppComponent = (function () {
    function AppComponent() {
        this.title = 'Inbox';
    }
    return AppComponent;
}());
AppComponent = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
        selector: 'app-root',
        template: __webpack_require__("./src/app/app.component.html"),
        styles: [__webpack_require__("./src/app/app.component.css")]
    })
], AppComponent);

//# sourceMappingURL=app.component.js.map

/***/ }),

/***/ "./src/app/app.module.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return AppModule; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_platform_browser__ = __webpack_require__("./node_modules/@angular/platform-browser/@angular/platform-browser.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_core__ = __webpack_require__("./node_modules/@angular/core/@angular/core.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__angular_forms__ = __webpack_require__("./node_modules/@angular/forms/@angular/forms.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__app_component__ = __webpack_require__("./src/app/app.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__mail_mail_component__ = __webpack_require__("./src/app/mail/mail.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__mail_content_mail_content_component__ = __webpack_require__("./src/app/mail-content/mail-content.component.ts");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};






var AppModule = (function () {
    function AppModule() {
    }
    return AppModule;
}());
AppModule = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_1__angular_core__["L" /* NgModule */])({
        declarations: [
            __WEBPACK_IMPORTED_MODULE_3__app_component__["a" /* AppComponent */],
            __WEBPACK_IMPORTED_MODULE_4__mail_mail_component__["a" /* MailComponent */],
            __WEBPACK_IMPORTED_MODULE_5__mail_content_mail_content_component__["a" /* MailContentComponent */]
        ],
        imports: [
            __WEBPACK_IMPORTED_MODULE_0__angular_platform_browser__["a" /* BrowserModule */],
            __WEBPACK_IMPORTED_MODULE_2__angular_forms__["a" /* FormsModule */]
        ],
        providers: [],
        bootstrap: [__WEBPACK_IMPORTED_MODULE_3__app_component__["a" /* AppComponent */]]
    })
], AppModule);

//# sourceMappingURL=app.module.js.map

/***/ }),

/***/ "./src/app/mail-content/mail-content.component.css":
/***/ (function(module, exports) {

module.exports = ".labeled {\r\n\tborder-bottom: 0.1px solid #f0f0f0;\r\n\tpadding: 15px;\r\n}\r\n\r\n.message {\r\n\tpadding: 15px;\r\n}\r\n"

/***/ }),

/***/ "./src/app/mail-content/mail-content.component.html":
/***/ (function(module, exports) {

module.exports = "<ul class=\"nav nav-tabs nav-mail\">\n\t<li class=\"nav-item\">\n\t\t<a class=\"nav-link disabled\">{{title}}</a>\n\t</li>\n\t<li class=\"nav-item\">\n\t\t<a class=\"nav-link\">Write</a>\n\t</li>\n\n</ul>\n<div *ngIf=\"msg\">\n\t<div class=\"labeled\"><label>Subject:</label> {{msg.subject}} Details</div>\n<!-- \t\t\t  \t<div><span>id: </span>{{selectedMsg.msgID}}</div>\n-->\t\t\t  \t<div class=\"labeled\"><label>From:</label> {{msg.sender}}</div>\n\t<div class=\"labeled\"><label>To:</label> {{msg.recipient}}</div>\n\t<div class=\"message\">{{msg.message}}</div>\n</div>"

/***/ }),

/***/ "./src/app/mail-content/mail-content.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return MailContentComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/@angular/core.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__msg__ = __webpack_require__("./src/app/msg.ts");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};


var MailContentComponent = (function () {
    function MailContentComponent() {
        this.title = "Message";
    }
    MailContentComponent.prototype.ngOnInit = function () {
    };
    return MailContentComponent;
}());
__decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["E" /* Input */])(),
    __metadata("design:type", typeof (_a = typeof __WEBPACK_IMPORTED_MODULE_1__msg__["a" /* Msg */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_1__msg__["a" /* Msg */]) === "function" && _a || Object)
], MailContentComponent.prototype, "msg", void 0);
MailContentComponent = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
        selector: 'app-mail-content',
        template: __webpack_require__("./src/app/mail-content/mail-content.component.html"),
        styles: [__webpack_require__("./src/app/mail-content/mail-content.component.css")]
    }),
    __metadata("design:paramtypes", [])
], MailContentComponent);

var _a;
//# sourceMappingURL=mail-content.component.js.map

/***/ }),

/***/ "./src/app/mail/mail.component.css":
/***/ (function(module, exports) {

module.exports = ".selected {\r\n\tbackground-color: #80b6fc !important;\r\n}\r\n\r\n.read {\r\n\tfont-weight: bold !important;\r\n}\r\n\r\n#sidebar {\r\n\tborder: 0.1px solid gray;\r\n\tmin-height: 100vh;\r\n\tpadding: 0;\r\n}\r\n\r\n.title {\r\n\tbackground-color: #f0f0f0;\r\n\tborder-bottom: 1px solid #ddd;\r\n\r\n}\r\n\r\n.mail {\r\n\tlist-style-type: none;\r\n\tleft:0;\r\n\twidth:100%;\r\n\tpadding: 0;\r\n}\r\n\r\n.mail li {\r\n\t/*position: relative;*/\r\n\tleft: 0;\r\n\tbackground-color:white;\r\n\tborder-bottom: 0.1px solid #f0f0f0;\r\n\tpadding: 10px;\r\n\tpadding-top: 15px;\r\n\tpadding-bottom: 15px;\r\n}\r\n\r\n.nav-mail {\r\n\tbackground-color: #f0f0f0;\r\n}\r\n\r\n#content {\r\n\tpadding: 0;\r\n}"

/***/ }),

/***/ "./src/app/mail/mail.component.html":
/***/ (function(module, exports) {

module.exports = "<div class=\"container-fluid\">\n\t<div class=\"row\">\n\t\t<div class=\"col-lg-3 container-fluid\" id=\"sidebar\">\n\t\t\t<ul class=\"nav nav-tabs nav-mail\">\n\t\t\t\t<li class=\"nav-item\">\n\t\t\t\t\t<a class=\"nav-link active\" href=\"#\">Inbox</a>\n\t\t\t\t</li>\n\t\t\t\t<li class=\"nav-item\">\n\t\t\t\t\t<a class=\"nav-link\" href=\"#\">Sent</a>\n\t\t\t\t</li>\n\t\t\t\t<li class=\"nav-item\">\n\t\t\t\t\t<a class=\"nav-link\" href=\"#\">\n\t\t\t\t\tTrash</a>\n\t\t\t\t</li>\n\t\t\t</ul>\n\t\t\t<ul class=\"mail\">\n\t\t\t\t<li *ngFor=\"let msg of mail\" [class.selected]=\"msg === selectedMsg\" [class.read]=\"!msg.read\" (click)=\"onSelect(msg)\"> \n\t\t\t\t\t<!-- <span class=\"badge\">{{msg.msgID}}</span>  -->\n\t\t\t\t\t<div class=\"subject\">{{msg.subject}} {{msg.DateSent}}</div>\n\t\t\t\t\t<div class=\"sender\">{{msg.sender}}</div>\n\t\t\t\t</li>\n\t\t\t</ul>\n\t\t</div>\n\t\t<div class=\"col-lg-9 hidden-xs hidden-sm hidden-md\" id=\"content\">\n\t\t\t<app-mail-content [msg]=\"selectedMsg\"></app-mail-content>\n\t\t</div>\n\t</div>\n</div>\n"

/***/ }),

/***/ "./src/app/mail/mail.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return MailComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/@angular/core.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__mock_mail__ = __webpack_require__("./src/app/mock-mail.ts");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};


var MailComponent = (function () {
    function MailComponent() {
        this.mail = __WEBPACK_IMPORTED_MODULE_1__mock_mail__["a" /* MAIL */];
        this.title = "Inbox";
    }
    MailComponent.prototype.ngOnInit = function () {
    };
    MailComponent.prototype.onSelect = function (msg) {
        this.selectedMsg = msg;
    };
    return MailComponent;
}());
MailComponent = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
        selector: 'app-mail',
        template: __webpack_require__("./src/app/mail/mail.component.html"),
        styles: [__webpack_require__("./src/app/mail/mail.component.css")]
    }),
    __metadata("design:paramtypes", [])
], MailComponent);

//# sourceMappingURL=mail.component.js.map

/***/ }),

/***/ "./src/app/mock-mail.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return MAIL; });
var MAIL = [
    { msgID: 1, sender: "Admin", subject: "test", recipient: "Taylor Tu", message: "Hello", DateSent: "1/1/11", read: false },
    { msgID: 2, sender: "Taylor", subject: "test", recipient: "Admin", message: "Bye", DateSent: "1/2/11", read: false },
    { msgID: 3, sender: "Admin", subject: "test", recipient: "Alan Yanza", message: "Hello", DateSent: "1/1/11", read: true },
    { msgID: 4, sender: "Admin", subject: "test", recipient: "Taylor Tu", message: "Hello", DateSent: "1/1/11", read: true },
    { msgID: 5, sender: "Admin", subject: "test", recipient: "Taylor Tu", message: "Hello", DateSent: "1/1/11", read: true },
    { msgID: 6, sender: "Admin", subject: "test", recipient: "Taylor Tu", message: "Hello", DateSent: "1/1/11", read: true }
];
//# sourceMappingURL=mock-mail.js.map

/***/ }),

/***/ "./src/app/msg.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return Msg; });
var Msg = (function () {
    function Msg() {
    }
    return Msg;
}());

//# sourceMappingURL=msg.js.map

/***/ }),

/***/ "./src/environments/environment.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return environment; });
// The file contents for the current environment will overwrite these during build.
// The build system defaults to the dev environment which uses `environment.ts`, but if you do
// `ng build --env=prod` then `environment.prod.ts` will be used instead.
// The list of which env maps to which file can be found in `.angular-cli.json`.
// The file contents for the current environment will overwrite these during build.
var environment = {
    production: false
};
//# sourceMappingURL=environment.js.map

/***/ }),

/***/ "./src/main.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/@angular/core.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_platform_browser_dynamic__ = __webpack_require__("./node_modules/@angular/platform-browser-dynamic/@angular/platform-browser-dynamic.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__app_app_module__ = __webpack_require__("./src/app/app.module.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__environments_environment__ = __webpack_require__("./src/environments/environment.ts");




if (__WEBPACK_IMPORTED_MODULE_3__environments_environment__["a" /* environment */].production) {
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["_20" /* enableProdMode */])();
}
Object(__WEBPACK_IMPORTED_MODULE_1__angular_platform_browser_dynamic__["a" /* platformBrowserDynamic */])().bootstrapModule(__WEBPACK_IMPORTED_MODULE_2__app_app_module__["a" /* AppModule */])
    .catch(function (err) { return console.log(err); });
//# sourceMappingURL=main.js.map

/***/ }),

/***/ 0:
/***/ (function(module, exports, __webpack_require__) {

module.exports = __webpack_require__("./src/main.ts");


/***/ })

},[0]);
//# sourceMappingURL=main.bundle.js.map