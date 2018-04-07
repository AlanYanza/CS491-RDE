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

/***/ "./src/app/app-routing.module.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return AppRoutingModule; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/@angular/core.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_router__ = __webpack_require__("./node_modules/@angular/router/@angular/router.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__write_message_write_message_component__ = __webpack_require__("./src/app/write-message/write-message.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__mail_content_mail_content_component__ = __webpack_require__("./src/app/mail-content/mail-content.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__mail_service__ = __webpack_require__("./src/app/mail.service.ts");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};





var routes = [
    {
        path: '',
        component: __WEBPACK_IMPORTED_MODULE_2__write_message_write_message_component__["a" /* WriteMessageComponent */]
    },
    {
        path: 'message/:msgID',
        component: __WEBPACK_IMPORTED_MODULE_3__mail_content_mail_content_component__["a" /* MailContentComponent */],
        resolve: {
            message: __WEBPACK_IMPORTED_MODULE_4__mail_service__["a" /* MailService */]
        }
    }
];
var AppRoutingModule = (function () {
    function AppRoutingModule() {
    }
    return AppRoutingModule;
}());
AppRoutingModule = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["M" /* NgModule */])({
        imports: [__WEBPACK_IMPORTED_MODULE_1__angular_router__["b" /* RouterModule */].forRoot(routes)],
        exports: [__WEBPACK_IMPORTED_MODULE_1__angular_router__["b" /* RouterModule */]]
    })
], AppRoutingModule);

//# sourceMappingURL=app-routing.module.js.map

/***/ }),

/***/ "./src/app/app.component.css":
/***/ (function(module, exports) {

module.exports = "/* Application-wide Styles */\r\nh1 {\r\n  color: #369;\r\n  font-family: Arial, Helvetica, sans-serif;\r\n  font-size: 250%;\r\n}\r\nh2, h3 {\r\n  color: #444;\r\n  font-family: Arial, Helvetica, sans-serif;\r\n  font-weight: lighter;\r\n}\r\nbody {\r\n  margin: 2em;\r\n}\r\nbody, input[text], button {\r\n  color: #888;\r\n  font-family: Cambria, Georgia;\r\n}\r\n/* everywhere else */\r\n* {\r\n  font-family: Arial, Helvetica, sans-serif;\r\n}"

/***/ }),

/***/ "./src/app/app.component.html":
/***/ (function(module, exports) {

module.exports = "<!--The content below is only a placeholder and can be replaced.-->\n\n<!-- <div style=\"text-align:center\">\n  <h1>\n    Welcome to {{title}}! \n  </h1>\n</div> -->\n<app-mail></app-mail>\n\n<!-- <script src=\"https://code.jquery.com/jquery-3.1.1.min.js\" integrity=\"sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=\" crossorigin=\"anonymous\"></script> -->\n<!-- <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\" integrity=\"sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa\" crossorigin=\"anonymous\"></script> -->\n\n"

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
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["o" /* Component */])({
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
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_6__write_message_write_message_component__ = __webpack_require__("./src/app/write-message/write-message.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_7__home_home_component__ = __webpack_require__("./src/app/home/home.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_8__app_routing_module__ = __webpack_require__("./src/app/app-routing.module.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_9__mail_service__ = __webpack_require__("./src/app/mail.service.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_10__message_resolver_service__ = __webpack_require__("./src/app/message-resolver.service.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_11__angular_common_http__ = __webpack_require__("./node_modules/@angular/common/@angular/common/http.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_12__message_message_service__ = __webpack_require__("./src/app/message/message.service.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_13__angular_common__ = __webpack_require__("./node_modules/@angular/common/@angular/common.es5.js");
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
    Object(__WEBPACK_IMPORTED_MODULE_1__angular_core__["M" /* NgModule */])({
        declarations: [
            __WEBPACK_IMPORTED_MODULE_3__app_component__["a" /* AppComponent */],
            __WEBPACK_IMPORTED_MODULE_4__mail_mail_component__["a" /* MailComponent */],
            __WEBPACK_IMPORTED_MODULE_5__mail_content_mail_content_component__["a" /* MailContentComponent */],
            __WEBPACK_IMPORTED_MODULE_6__write_message_write_message_component__["a" /* WriteMessageComponent */],
            __WEBPACK_IMPORTED_MODULE_7__home_home_component__["a" /* HomeComponent */]
        ],
        imports: [
            __WEBPACK_IMPORTED_MODULE_0__angular_platform_browser__["a" /* BrowserModule */],
            __WEBPACK_IMPORTED_MODULE_2__angular_forms__["a" /* FormsModule */],
            __WEBPACK_IMPORTED_MODULE_8__app_routing_module__["a" /* AppRoutingModule */],
            __WEBPACK_IMPORTED_MODULE_11__angular_common_http__["b" /* HttpClientModule */]
        ],
        providers: [
            __WEBPACK_IMPORTED_MODULE_9__mail_service__["a" /* MailService */],
            __WEBPACK_IMPORTED_MODULE_10__message_resolver_service__["a" /* MessageResolverService */],
            __WEBPACK_IMPORTED_MODULE_12__message_message_service__["a" /* MessageService */],
            { provide: __WEBPACK_IMPORTED_MODULE_13__angular_common__["a" /* APP_BASE_HREF */], useValue: '/CS491-RDE/message.cfm' }
        ],
        bootstrap: [__WEBPACK_IMPORTED_MODULE_3__app_component__["a" /* AppComponent */]]
    })
], AppModule);

//# sourceMappingURL=app.module.js.map

/***/ }),

/***/ "./src/app/home/home.component.css":
/***/ (function(module, exports) {

module.exports = ""

/***/ }),

/***/ "./src/app/home/home.component.html":
/***/ (function(module, exports) {

module.exports = "<p>\n  home works!\n</p>\n"

/***/ }),

/***/ "./src/app/home/home.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return HomeComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/@angular/core.es5.js");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};

var HomeComponent = (function () {
    function HomeComponent() {
    }
    HomeComponent.prototype.ngOnInit = function () {
    };
    return HomeComponent;
}());
HomeComponent = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["o" /* Component */])({
        selector: 'app-home',
        template: __webpack_require__("./src/app/home/home.component.html"),
        styles: [__webpack_require__("./src/app/home/home.component.css")]
    }),
    __metadata("design:paramtypes", [])
], HomeComponent);

//# sourceMappingURL=home.component.js.map

/***/ }),

/***/ "./src/app/mail-content/mail-content.component.css":
/***/ (function(module, exports) {

module.exports = ".labeled {\r\n\tborder-bottom: 0.1px solid #f0f0f0;\r\n\tpadding: 15px;\r\n}\r\n\r\n.message {\r\n\tpadding: 30px;\r\n}\r\n"

/***/ }),

/***/ "./src/app/mail-content/mail-content.component.html":
/***/ (function(module, exports) {

module.exports = "<ul class=\"nav nav-tabs nav-mail\">\n\t<li class=\"nav-item\">\n\t\t<a class=\"nav-link\">X</a>\n\t</li>\n\t<li class=\"nav-item\">\n\t\t<a class=\"nav-link disabled\">{{ title | uppercase }}</a>\n\t</li>\n\t<li class=\"nav-item pull-right\">\n\t\t<a class=\"nav-link\" [routerLink] = \"['/']\">Write</a>\n\t</li>\n\n</ul>\n<div *ngIf=\"(msg | async)\">\n\t<div class=\"labeled\"><label for=\"subject\" class=\"col-sm-1\">Subject:</label> {{ (msg | async).SUBJECT  }}</div>\n\t<div class=\"labeled\"><label for=\"from\" class=\"col-sm-1\">From:</label> {{ (msg | async).SENDER }}</div>\n\t<div class=\"labeled\"><label for=\"sendTo\" class=\"col-sm-1\">To:</label> {{ (msg | async).RECIPIENT }}</div>\n\t<div class=\"message\">{{ (msg | async).MESSAGE }}</div>\n</div>\n"

/***/ }),

/***/ "./src/app/mail-content/mail-content.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return MailContentComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/@angular/core.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_router__ = __webpack_require__("./node_modules/@angular/router/@angular/router.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__angular_common__ = __webpack_require__("./node_modules/@angular/common/@angular/common.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__mail_service__ = __webpack_require__("./src/app/mail.service.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4_rxjs_operators_map__ = __webpack_require__("./node_modules/rxjs/_esm5/operators/map.js");
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
    function MailContentComponent(route, mailService, location) {
        this.route = route;
        this.mailService = mailService;
        this.location = location;
        this.title = "Message";
        this.msg = this.route.data.pipe(Object(__WEBPACK_IMPORTED_MODULE_4_rxjs_operators_map__["a" /* map */])(function (data) {
            return data.message;
        }));
    }
    MailContentComponent.prototype.ngOnInit = function () {
    };
    return MailContentComponent;
}());
MailContentComponent = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["o" /* Component */])({
        selector: 'app-mail-content',
        template: __webpack_require__("./src/app/mail-content/mail-content.component.html"),
        styles: [__webpack_require__("./src/app/mail-content/mail-content.component.css")]
    }),
    __metadata("design:paramtypes", [typeof (_a = typeof __WEBPACK_IMPORTED_MODULE_1__angular_router__["a" /* ActivatedRoute */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_1__angular_router__["a" /* ActivatedRoute */]) === "function" && _a || Object, typeof (_b = typeof __WEBPACK_IMPORTED_MODULE_3__mail_service__["a" /* MailService */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_3__mail_service__["a" /* MailService */]) === "function" && _b || Object, typeof (_c = typeof __WEBPACK_IMPORTED_MODULE_2__angular_common__["f" /* Location */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_2__angular_common__["f" /* Location */]) === "function" && _c || Object])
], MailContentComponent);

var _a, _b, _c;
//# sourceMappingURL=mail-content.component.js.map

/***/ }),

/***/ "./src/app/mail.service.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return MailService; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/@angular/core.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_rxjs_operators__ = __webpack_require__("./node_modules/rxjs/_esm5/operators.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__angular_common_http__ = __webpack_require__("./node_modules/@angular/common/@angular/common/http.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3_rxjs_operators_map__ = __webpack_require__("./node_modules/rxjs/_esm5/operators/map.js");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};


// import { MAIL } from './mock-mail';


var MailService = (function () {
    function MailService(http) {
        this.http = http;
        this.messageURL = 'http://localhost:8500/rest/restTest/MessageSystem/GetEmail';
    }
    MailService.prototype.resolve = function (routeSnapshot) {
        return this.getMessages()
            .pipe(Object(__WEBPACK_IMPORTED_MODULE_3_rxjs_operators_map__["a" /* map */])(function (data) {
            return data.find(function (msg) { return msg.MSGID === +routeSnapshot.params.msgID; });
        }));
        // return MAIL.find(msg => msg.msgID === +routeSnapshot.params.msgID);
    };
    // getMessages(): Observable<Msg[]> { 
    // 	return of(MAIL); 
    // }	
    MailService.prototype.getMessages = function () {
        return this.http.get(this.messageURL)
            .pipe(Object(__WEBPACK_IMPORTED_MODULE_1_rxjs_operators__["a" /* tap */])(function (res) { return console.log('HTTP response:', res); }));
    };
    return MailService;
}());
MailService = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["C" /* Injectable */])(),
    __metadata("design:paramtypes", [typeof (_a = typeof __WEBPACK_IMPORTED_MODULE_2__angular_common_http__["a" /* HttpClient */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_2__angular_common_http__["a" /* HttpClient */]) === "function" && _a || Object])
], MailService);

var _a;
//# sourceMappingURL=mail.service.js.map

/***/ }),

/***/ "./src/app/mail/mail.component.css":
/***/ (function(module, exports) {

module.exports = ".selected {\r\n\tbackground-color: #80b6fc !important;\r\n}\r\n\r\n.read {\r\n\tfont-weight: bold !important;\r\n}\r\n\r\n#sidebar {\r\n\t/*border: 0.1px solid gray;*/\r\n\tmin-height: 100vh;\r\n\tpadding: 0.5px;\r\n\tpadding-top: 0;\r\n\tpadding-bottom: 0;\r\n}\r\n\r\n.title {\r\n\tbackground-color: #f0f0f0;\r\n\tborder-bottom: 1px solid #ddd;\r\n\r\n}\r\n\r\n.mail {\r\n\tlist-style-type: none;\r\n\tleft:0;\r\n\twidth:100%;\r\n\tpadding: 0;\r\n}\r\n\r\n.mail li {\r\n\t/*position: relative;*/\r\n\tleft: 0;\r\n\tbackground-color:white;\r\n\tborder: none;\r\n\tborder-bottom: 0.1px solid #f0f0f0;\r\n\tpadding: 10px;\r\n\tpadding-top: 15px;\r\n\tpadding-bottom: 15px;\r\n}\r\n\r\n.subject { \r\n\t\r\n}\r\n\r\n.date {\r\n\tfloat: right;\r\n\tcolor: gray;\r\n\tfont-size:;\r\n}\r\n\r\n/*.nav-mail {\r\n\tbackground-color: #f0f0f0;\r\n}*/\r\n\r\n#content {\r\n\tpadding: 1px;\r\n\tborder-left: 0.1px solid gray;\r\n\theight: 100vh;\r\n}\r\n\r\n.show {\r\n\tdisplay: block !important;\r\n}\r\n"

/***/ }),

/***/ "./src/app/mail/mail.component.html":
/***/ (function(module, exports) {

module.exports = "<div class=\"container-fluid\">\n\t<div class=\"row\">\n\t\t<div class=\"col-lg-3 container-fluid\" id=\"sidebar\">\n\t\t\t<ul ng-init=\"selectedTab = 'inbox'\" class=\"nav nav-tabs nav-mail\">\n\t\t\t\t<li ng-class=\"{'active':selectedTab ==='inbox'}\" ng-click=\"selectedTab='inbox'\" class=\"nav-item\">\n\t\t\t\t\t<a class=\"nav-link active\" href=\"#\">Inbox</a>\n\t\t\t\t</li>\n\t\t\t\t<li ng-class=\"{'active':selectedTab ==='sent'}\" ng-click=\"selectedTab='sent'\" class=\"nav-item\">\n\t\t\t\t\t<a class=\"nav-link\" href=\"#\">Sent</a>\n\t\t\t\t</li>\n\t\t\t\t<li ng-class=\"{'active':selectedTab ==='trash'}\" ng-click=\"selectedTab='trash'\" class=\"nav-item\">\n\t\t\t\t\t<a class=\"nav-link\" href=\"#\">Trash</a>\n\t\t\t\t</li>\n\t\t\t</ul>\n\t\t\t<ul class=\"mail\">\n\t\t\t\t<li *ngFor=\"let msg of mail\" [class.read]=\"msg.READSTATUS === 'N'\" [class.selected]=\"msg === selectedMsg\" [routerLink] = \"['/message', msg.MSGID]\" (click)=\"onSelect(msg)\"> \n\t\t\t\t\t<div><span class=\"subject\">{{msg.SUBJECT}}</span><span class=\"date\">{{msg.DATESENT}}</span></div>\n\t\t\t\t\t<div class=\"sender\">{{msg.SENDER}}</div>\n\t\t\t\t</li>\n\t\t\t</ul>\n\t\t</div>\n\t\t<div class=\"col-lg-9 hidden-xs hidden-sm hidden-md\" id=\"content\">\n\t\t\t<router-outlet></router-outlet>\n\t\t</div>\n\t</div>\n</div>\n"

/***/ }),

/***/ "./src/app/mail/mail.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return MailComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/@angular/core.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__mail_service__ = __webpack_require__("./src/app/mail.service.ts");
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
    function MailComponent(mailService) {
        this.mailService = mailService;
        this.title = "Inbox";
    }
    MailComponent.prototype.ngOnInit = function () {
        this.getMessages();
        // this.test();
    };
    // test(): void {
    // 	this.mailService.test()
    // 		.subscribe(console.log);
    // }
    MailComponent.prototype.getMessages = function () {
        var _this = this;
        this.mailService.getMessages()
            .subscribe(function (mail) { return _this.mail = mail; });
    };
    MailComponent.prototype.onSelect = function (msg) {
        this.selectedMsg = msg;
        msg.READSTATUS = 'Y';
    };
    return MailComponent;
}());
MailComponent = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["o" /* Component */])({
        selector: 'app-mail',
        template: __webpack_require__("./src/app/mail/mail.component.html"),
        styles: [__webpack_require__("./src/app/mail/mail.component.css")]
    }),
    __metadata("design:paramtypes", [typeof (_a = typeof __WEBPACK_IMPORTED_MODULE_1__mail_service__["a" /* MailService */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_1__mail_service__["a" /* MailService */]) === "function" && _a || Object])
], MailComponent);

var _a;
//# sourceMappingURL=mail.component.js.map

/***/ }),

/***/ "./src/app/message-resolver.service.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return MessageResolverService; });
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


var MessageResolverService = (function () {
    function MessageResolverService() {
    }
    MessageResolverService.prototype.resolve = function (routeSnapshot) {
        return __WEBPACK_IMPORTED_MODULE_1__mock_mail__["a" /* MAIL */].find(function (msg) { return msg.MSGID === routeSnapshot.params.msgID; });
    };
    return MessageResolverService;
}());
MessageResolverService = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["C" /* Injectable */])(),
    __metadata("design:paramtypes", [])
], MessageResolverService);

//# sourceMappingURL=message-resolver.service.js.map

/***/ }),

/***/ "./src/app/message/message.service.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return MessageService; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/@angular/core.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_common_http__ = __webpack_require__("./node_modules/@angular/common/@angular/common/http.es5.js");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};


var MessageService = (function () {
    function MessageService(http) {
        this.http = http;
        this.sendMessageAPIUrl = "http://localhost:8500/rest/restTest/MessageSystem/sendEmail";
    }
    MessageService.prototype.sendMessages = function (msg) {
        var params = new __WEBPACK_IMPORTED_MODULE_1__angular_common_http__["c" /* HttpParams */]()
            .set("subject", msg.subject)
            .set("recipient", msg.recipient)
            .set("message", msg.message);
        return this.http.put(this.sendMessageAPIUrl, null, {
            params: params
        });
    };
    return MessageService;
}());
MessageService = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["C" /* Injectable */])(),
    __metadata("design:paramtypes", [typeof (_a = typeof __WEBPACK_IMPORTED_MODULE_1__angular_common_http__["a" /* HttpClient */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_1__angular_common_http__["a" /* HttpClient */]) === "function" && _a || Object])
], MessageService);

var _a;
//# sourceMappingURL=message.service.js.map

/***/ }),

/***/ "./src/app/mock-mail.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return MAIL; });
var MAIL = [
    { MSGID: 1, SENDER: "Admin", SUBJECT: "test", RECIPIENT: "Taylor Tu", MESSAGE: "Hello", DATESENT: "1/1/11", READSTATUS: 'N' },
    { MSGID: 2, SENDER: "Taylor", SUBJECT: "test", RECIPIENT: "Admin", MESSAGE: "Bye", DATESENT: "1/2/11", READSTATUS: 'N' },
    { MSGID: 3, SENDER: "Admin", SUBJECT: "test", RECIPIENT: "Alan Yanza", MESSAGE: "This is a really long message.This is a really long message.This is a really long message.This is a really long message.This is a really long message.This is a really long message.This is a really long message.This is a really long message.", DATESENT: "1/1/11", READSTATUS: 'Y' },
    { MSGID: 4, SENDER: "Admin", SUBJECT: "test", RECIPIENT: "Taylor Tu", MESSAGE: "Hello", DATESENT: "1/1/11", READSTATUS: 'N' },
    { MSGID: 5, SENDER: "Admin", SUBJECT: "test", RECIPIENT: "Taylor Tu", MESSAGE: "Hello", DATESENT: "1/1/11", READSTATUS: 'N' },
    { MSGID: 6, SENDER: "Admin", SUBJECT: "test", RECIPIENT: "Taylor Tu", MESSAGE: "Hello", DATESENT: "1/1/11", READSTATUS: 'N' },
    { MSGID: 7, SENDER: "Admin", SUBJECT: "test", RECIPIENT: "Taylor Tu", MESSAGE: "Hello", DATESENT: "1/1/11", READSTATUS: 'N' },
    { MSGID: 8, SENDER: "Admin", SUBJECT: "test", RECIPIENT: "Taylor Tu", MESSAGE: "Hello", DATESENT: "1/1/11", READSTATUS: 'N' },
    { MSGID: 9, SENDER: "Admin", SUBJECT: "test", RECIPIENT: "Taylor Tu", MESSAGE: "Hello", DATESENT: "1/1/11", READSTATUS: 'N' }
];
//# sourceMappingURL=mock-mail.js.map

/***/ }),

/***/ "./src/app/write-message/write-message.component.css":
/***/ (function(module, exports) {

module.exports = ".email-form {\r\n\tdisplay: -webkit-box;\r\n\tdisplay: -ms-flexbox;\r\n\tdisplay: flex;\r\n\t-webkit-box-orient: vertical;\r\n\t-webkit-box-direction: normal;\r\n\t    -ms-flex-flow: column;\r\n\t        flex-flow: column;\r\n\theight: 100%;\r\n}\r\n\r\n.email-form .message.textarea {\r\n\tpadding: 15px;\r\n\t-webkit-box-flex: 1;\r\n\t    -ms-flex: 1 1 auto;\r\n\t        flex: 1 1 auto;\r\n}\r\n\r\n.email-form .labeled {\r\n\t-webkit-box-flex: 0;\r\n\t    -ms-flex: 0 1 auto;\r\n\t        flex: 0 1 auto;\r\n}\r\n\r\n.labeled {\r\n\tborder-bottom: 0.1px solid #f0f0f0;\r\n\tpadding: 15px;\r\n}\r\n\r\n.input { \r\n\tborder: none;\r\n }\r\n\r\n.nav-link {\r\n \tcursor: pointer;\r\n }\r\n\r\n\r\n"

/***/ }),

/***/ "./src/app/write-message/write-message.component.html":
/***/ (function(module, exports) {

module.exports = "<ul class=\"nav nav-tabs nav-mail\">\n\t<li class=\"nav-item\">\n\t\t<a class=\"nav-link\">X</a>\n\t</li>\n\t<li class=\"nav-item\">\n\t\t<a class=\"nav-link disabled\">NEW MESSAGE</a>\n\t</li>\n\t<li class=\"nav-item pull-right\">\n\t\t<a class=\"nav-link\" (click)=\"sendMessage()\">Send</a>\n\t</li>\n\n</ul>\n<div class=\"email-form form-group col-*-col*\">\n\t<div class=\"labeled\">\n\t\t<label for=\"subject\" class=\"col-sm-1 col-form-label\">Subject:</label> \n\t\t<input type=\"text\" class=\"input\" [(ngModel)]=\"msg.subject\" placeholder=\"Write subject here\">\n\t</div>\n<!-- \t<div class=\"labeled\">\n\t\t<label for=\"staticFrom\" class=\"col-sm-1 col-form-label\">From:</label> \n\t\t<input type=\"text\" readonly class=\"form-control-plaintext\" id=\"staticFrom\" value=\"{user.email}\">\n\t</div> -->\n\t<div class=\"labeled\">\n\t\t<label for=\"sendTo\" class=\"col-sm-1 col-form-label\">To:</label> \n\t\t<input  class=\"input\" [(ngModel)]=\"msg.recipient\" placeholder=\"Write recipient here\">\n\t</div>\n\t<div class=\"message\">\n\t\t<textarea class=\"input form-control\" [(ngModel)]=\"msg.message\" placeholder=\"Write message here\"></textarea>\n\t</div>\n</div>"

/***/ }),

/***/ "./src/app/write-message/write-message.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return WriteMessageComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/@angular/core.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__message_message_service__ = __webpack_require__("./src/app/message/message.service.ts");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};


var WriteMessageComponent = (function () {
    function WriteMessageComponent(messageService) {
        this.messageService = messageService;
        this.title = "New Message";
        this.msg = {};
    }
    WriteMessageComponent.prototype.ngOnInit = function () {
    };
    WriteMessageComponent.prototype.sendMessage = function () {
        console.log(this.msg);
        this.messageService.sendMessages(this.msg)
            .subscribe({
            error: function (msg) { console.log('Error sending message:', msg); }
        });
        this.msg = {};
    };
    return WriteMessageComponent;
}());
WriteMessageComponent = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["o" /* Component */])({
        selector: 'app-write-message',
        template: __webpack_require__("./src/app/write-message/write-message.component.html"),
        styles: [__webpack_require__("./src/app/write-message/write-message.component.css")]
    }),
    __metadata("design:paramtypes", [typeof (_a = typeof __WEBPACK_IMPORTED_MODULE_1__message_message_service__["a" /* MessageService */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_1__message_message_service__["a" /* MessageService */]) === "function" && _a || Object])
], WriteMessageComponent);

var _a;
//# sourceMappingURL=write-message.component.js.map

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
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["_23" /* enableProdMode */])();
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