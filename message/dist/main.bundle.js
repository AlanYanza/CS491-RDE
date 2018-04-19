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
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__status_page_status_page_component__ = __webpack_require__("./src/app/status-page/status-page.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__mail_service__ = __webpack_require__("./src/app/mail.service.ts");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};






var routes = [
    {
        path: '',
        component: __WEBPACK_IMPORTED_MODULE_4__status_page_status_page_component__["a" /* StatusPageComponent */]
    },
    {
        path: 'write',
        component: __WEBPACK_IMPORTED_MODULE_2__write_message_write_message_component__["a" /* WriteMessageComponent */]
    },
    {
        path: 'message/:msgID',
        component: __WEBPACK_IMPORTED_MODULE_3__mail_content_mail_content_component__["a" /* MailContentComponent */],
        resolve: {
            message: __WEBPACK_IMPORTED_MODULE_5__mail_service__["a" /* MailService */]
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
        imports: [__WEBPACK_IMPORTED_MODULE_1__angular_router__["b" /* RouterModule */].forRoot(routes, { useHash: true })],
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

module.exports = "<app-mail></app-mail>"

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
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_7__app_routing_module__ = __webpack_require__("./src/app/app-routing.module.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_8__mail_service__ = __webpack_require__("./src/app/mail.service.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_9__message_message_service__ = __webpack_require__("./src/app/message/message.service.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_10__angular_common_http__ = __webpack_require__("./node_modules/@angular/common/@angular/common/http.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_11__angular_common__ = __webpack_require__("./node_modules/@angular/common/@angular/common.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_12__status_page_status_page_component__ = __webpack_require__("./src/app/status-page/status-page.component.ts");
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
            __WEBPACK_IMPORTED_MODULE_12__status_page_status_page_component__["a" /* StatusPageComponent */]
        ],
        imports: [
            __WEBPACK_IMPORTED_MODULE_0__angular_platform_browser__["a" /* BrowserModule */],
            __WEBPACK_IMPORTED_MODULE_2__angular_forms__["a" /* FormsModule */],
            __WEBPACK_IMPORTED_MODULE_7__app_routing_module__["a" /* AppRoutingModule */],
            __WEBPACK_IMPORTED_MODULE_10__angular_common_http__["b" /* HttpClientModule */]
        ],
        providers: [
            __WEBPACK_IMPORTED_MODULE_8__mail_service__["a" /* MailService */],
            __WEBPACK_IMPORTED_MODULE_9__message_message_service__["a" /* MessageService */],
            { provide: __WEBPACK_IMPORTED_MODULE_11__angular_common__["a" /* APP_BASE_HREF */], useValue: '/' }
        ],
        bootstrap: [__WEBPACK_IMPORTED_MODULE_3__app_component__["a" /* AppComponent */]]
    })
], AppModule);

//# sourceMappingURL=app.module.js.map

/***/ }),

/***/ "./src/app/mail-content/mail-content.component.css":
/***/ (function(module, exports) {

module.exports = ".labeled {\r\n\tborder-bottom: 0.1px solid #f0f0f0;\r\n\tpadding: 15px;\r\n}\r\n\r\n.message {\r\n\tpadding: 30px;\r\n}\r\n\r\n.nav-style {\r\n\tborder-bottom: 0.1px solid #f0f0f0;\r\n}\r\n\r\nli.disabled > a:hover {\r\n\tcursor: default;\r\n}\r\n"

/***/ }),

/***/ "./src/app/mail-content/mail-content.component.html":
/***/ (function(module, exports) {

module.exports = "<ul class=\"nav nav-pills nav-style\">\n\t<li role=\"navigation\">\n\t\t<a [routerLink] = \"['/']\">X</a>\n\t</li>\n\t<li class=\"disabled\" role=\"presentation\">\n\t\t<a>{{ title | uppercase }}</a>\n\t</li>\n\t<li class=\"active pull-right\" role=\"navigation\">\n\t\t<a [routerLink] = \"['/write']\">Write</a>\n\t</li>\n</ul>\n<div *ngIf=\"(msg | async)\">\n\t<div class=\"labeled\"><label for=\"subject\">Subject:</label> {{ (msg | async).SUBJECT  }}</div>\n\t<div class=\"labeled\"><label for=\"from\">From:</label> {{ (msg | async).SENDER }}</div>\n\t<div class=\"labeled\"><label for=\"sendTo\">To:</label> {{ (msg | async).RECIPIENT }}</div>\n\t<div class=\"message\">{{ (msg | async).MESSAGE }}</div>\n</div>\n"

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
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_rxjs_observable_of__ = __webpack_require__("./node_modules/rxjs/_esm5/observable/of.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2_rxjs_operators__ = __webpack_require__("./node_modules/rxjs/_esm5/operators.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__angular_common_http__ = __webpack_require__("./node_modules/@angular/common/@angular/common/http.es5.js");
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
        this.baseURL = '/rest/restapi/MessageSystem/';
        this.getMessageURL = this.baseURL + 'getInbox';
        this.deleteMessageURL = this.baseURL + 'deleteEmail';
        this.getSentURL = this.baseURL + 'getSent';
        this.getTrashURL = this.baseURL + 'getTrash';
        this.readMessageURL = this.baseURL + 'readMessage';
    }
    MailService.prototype.resolve = function (routeSnapshot) {
        return this.getMessages()
            .pipe(Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["b" /* map */])(function (data) {
            return data.find(function (msg) { return msg.MSGID === +routeSnapshot.params.msgID; });
        }), Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["a" /* catchError */])(this.handleError('getMessage', [])));
        // return MAIL.find(msg => msg.msgID === +routeSnapshot.params.msgID);
    };
    // getMessages(): Observable<Msg[]> { 
    // 	return of(MAIL); 
    // }	
    //Will return observable for messages in sent table 
    MailService.prototype.getSent = function () {
        return this.http.get(this.getSentURL)
            .pipe(Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["c" /* tap */])(function (res) { return console.log('Sent response:', res); }), Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["a" /* catchError */])(this.handleError('getSent', [])));
    };
    //Will return observable for messages in trash table 
    MailService.prototype.getTrash = function () {
        return this.http.get(this.getTrashURL)
            .pipe(Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["c" /* tap */])(function (res) { return console.log('Sent response:', res); }), Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["a" /* catchError */])(this.handleError('getSent', [])));
    };
    //Will return observable for messages in Inbox table 
    MailService.prototype.getMessages = function () {
        return this.http.get(this.getMessageURL)
            .pipe(Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["c" /* tap */])(function (res) { return console.log('HTTP response:', res); }), Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["a" /* catchError */])(this.handleError('getMessages', [])));
    };
    MailService.prototype.deleteMessage = function (msg) {
        var params = new __WEBPACK_IMPORTED_MODULE_3__angular_common_http__["c" /* HttpParams */]()
            .set("msgID", String(msg.MSGID));
        return this.http.get(this.deleteMessageURL, { params: params })
            .pipe(Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["c" /* tap */])(function (res) { return console.log('Delete:', res); }), Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["a" /* catchError */])(this.handleError('deleteMessage', [])));
    };
    MailService.prototype.readMessage = function (msg) {
        var params = new __WEBPACK_IMPORTED_MODULE_3__angular_common_http__["c" /* HttpParams */]()
            .set("msgID", String(msg.MSGID));
        return this.http.put(this.readMessageURL, null, { params: params })
            .pipe(Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["c" /* tap */])(function (res) { return console.log('Read:', res); }), Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["a" /* catchError */])(this.handleError('readMessage', [])));
    };
    /**
  * Handle Http operation that failed.
  * Let the app continue.
  * @param operation - name of the operation that failed
  * @param result - optional value to return as the observable result
  */
    MailService.prototype.handleError = function (operation, result) {
        if (operation === void 0) { operation = 'operation'; }
        return function (error) {
            // TODO: send the error to remote logging infrastructure
            console.error(error); // log to console instead
            // TODO: better job of transforming error for user consumption
            // this.log(`${operation} failed: ${error.message}`);
            // Let the app keep running by returning an empty result.
            return Object(__WEBPACK_IMPORTED_MODULE_1_rxjs_observable_of__["a" /* of */])(result);
        };
    };
    return MailService;
}());
MailService = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["C" /* Injectable */])(),
    __metadata("design:paramtypes", [typeof (_a = typeof __WEBPACK_IMPORTED_MODULE_3__angular_common_http__["a" /* HttpClient */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_3__angular_common_http__["a" /* HttpClient */]) === "function" && _a || Object])
], MailService);

var _a;
//# sourceMappingURL=mail.service.js.map

/***/ }),

/***/ "./src/app/mail/mail.component.css":
/***/ (function(module, exports) {

module.exports = ".selected {\r\n\tbackground-color: #80b6fc !important;\r\n}\r\n\r\n.read {\r\n\tfont-weight: bold !important;\r\n}\r\n\r\n#sidebar {\r\n\t/*border: 0.1px solid gray;*/\r\n\tmin-height: 100vh;\r\n\tpadding: 0.5px;\r\n\tpadding-top: 0;\r\n\tpadding-bottom: 0;\r\n}\r\n\r\n.title {\r\n\tbackground-color: #f0f0f0;\r\n\tborder-bottom: 1px solid #ddd;\r\n\r\n}\r\n\r\n.mail {\r\n\tlist-style-type: none;\r\n\tleft:0;\r\n\twidth:100%;\r\n\tpadding: 0;\r\n}\r\n\r\n.mail li {\r\n\t/*position: relative;*/\r\n\tleft: 0;\r\n\tbackground-color:white;\r\n\tborder: none;\r\n\tborder-bottom: 0.1px solid #f0f0f0;\r\n\tpadding: 10px;\r\n\tpadding-top: 15px;\r\n\tpadding-bottom: 15px;\r\n}\r\n\r\n.subject { \r\n\t\r\n}\r\n\r\n.date {\r\n\tfloat: right;\r\n\tcolor: gray;\r\n\tfont-size:;\r\n}\r\n\r\n/*.nav-mail {\r\n\tbackground-color: #f0f0f0;\r\n}*/\r\n\r\n#content {\r\n\tpadding: 1px;\r\n\tborder-left: 0.1px solid gray;\r\n\theight: 100vh;\r\n}\r\n\r\n.show {\r\n\tdisplay: block !important;\r\n}\r\n\r\n#trashIcon { \r\n\tfloat: right;\r\n\r\n}\r\n\r\n.nav {\r\n\tbackground-color: #136AA9; \r\n}\r\n\r\n.nav-link {\r\n\tcursor: pointer;\r\n\tcolor: white;\r\n}\r\n\r\n.nav-link:hover {\r\n\tbackground-color: #083759;\r\n}"

/***/ }),

/***/ "./src/app/mail/mail.component.html":
/***/ (function(module, exports) {

module.exports = "<div class=\"container-fluid\">\n\t<div class=\"row\">\n\t\t<div class=\"col-xs-3 container-fluid\" id=\"sidebar\">\n\t\t\t<!-- <nav class=\"navbar navbar-default\">\n\t\t\t\t<div class=\"navbar-header\">\n\t\t\t      <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#mail-tabs\" aria-expanded=\"false\">\n\t\t\t        <span class=\"sr-only\">Toggle navigation</span>\n\t\t\t        <span class=\"icon-bar\"></span>\n\t\t\t        <span class=\"icon-bar\"></span>\n\t\t\t        <span class=\"icon-bar\"></span>\n\t\t\t      </button>\n\t\t\t    </div>\n\t\t\t\t<div class=\"navbar-collapse collapse\" id=\"mail-tabs\"> -->\n\t\t\t\t\t<ul class=\"nav nav-tabs\" ng-init=\"selectedTab = 'inbox'\">\n\t\t\t\t\t\t<li role=\"navigation\" [class.active]=\"selectedTab ==='inbox'\" (click)=\"getMessages()\"><a class=\"nav-link\">Inbox</a></li>\n\t\t\t\t\t\t<li role=\"navigation\" [class.active]=\"selectedTab ==='sent'\" (click)=\"getSent()\"><a class=\"nav-link\">Sent</a></li>\n\t\t\t\t\t\t<li role=\"navigation\" [class.active]=\"selectedTab ==='trash'\" (click)=\"getTrash()\"><a class=\"nav-link\">Trash</a></li>\n\t\t\t\t\t</ul>\n\t\t\t\t<!-- </div>\n\t\t\t</nav> -->\n\t\t\t<ul class=\"mail\">\n\t\t\t\t<li *ngFor=\"let msg of mail\" [class.read]=\"msg.READSTATUS === 'F'\" [class.selected]=\"msg === selectedMsg\" [routerLink] = \"['/message', msg.MSGID]\" (click)=\"onSelect(msg)\"> \n\t\t\t\t\t<div><span class=\"subject\">{{msg.SUBJECT}}</span><span class=\"date\">{{msg.DATESENT}}</span></div>\n\t\t\t\t\t<div>\n\t\t\t\t\t\t<span class=\"sender\">{{msg.SENDER}}</span>\n\t\t\t\t\t\t<button *ngIf=\"selectedTab === 'inbox'\" id=\"trashIcon\" type=\"button\" class=\"btn btn-info btn-sm\" (click)=\"deleteMessage(msg)\">Delete <span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span></button>\n\t\t\t\t\t</div>\n\t\t\t\t</li>\n\t\t\t</ul>\n\t\t</div>\n\t\t<div class=\"col-xs-9\" id=\"content\">\n\t\t\t<router-outlet></router-outlet>\n\t\t</div>\n\t</div>\n</div>\n"

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
    };
    MailComponent.prototype.getSent = function () {
        var _this = this;
        this.mailService.getSent()
            .subscribe(function (mail) { return _this.mail = mail; });
        this.selectedTab = 'sent';
    };
    MailComponent.prototype.getTrash = function () {
        var _this = this;
        this.mailService.getTrash()
            .subscribe(function (mail) { return _this.mail = mail; });
        this.selectedTab = 'trash';
    };
    MailComponent.prototype.getMessages = function () {
        var _this = this;
        this.mailService.getMessages()
            .subscribe(function (mail) { return _this.mail = mail; });
        this.selectedTab = 'inbox';
    };
    MailComponent.prototype.deleteMessage = function (msg) {
        this.mail = this.mail.filter(function (m) { return msg.MSGID !== m.MSGID; });
        this.mailService.deleteMessage(msg).subscribe();
    };
    MailComponent.prototype.onSelect = function (msg) {
        this.selectedMsg = msg;
        msg.READSTATUS = 'T';
        this.mailService.readMessage(msg).subscribe();
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

/***/ "./src/app/message/message.service.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return MessageService; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/@angular/core.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_common_http__ = __webpack_require__("./node_modules/@angular/common/@angular/common/http.es5.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2_rxjs_operators__ = __webpack_require__("./node_modules/rxjs/_esm5/operators.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3_rxjs_observable_of__ = __webpack_require__("./node_modules/rxjs/_esm5/observable/of.js");
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
        this.baseURL = "/rest/restapi/MessageSystem/";
        this.sendMessageAPIUrl = this.baseURL + "sendEmail";
        this.getAccessLevelURL = this.baseURL + "getAccessLevel";
        this.getRecipientListURL = this.baseURL + "getRecipientList";
    }
    /*GET recipient list whose name contains search term */
    MessageService.prototype.searchUsers = function (term) {
        if (!term.trim()) {
            //if no search term return an empty array of users 
            return Object(__WEBPACK_IMPORTED_MODULE_3_rxjs_observable_of__["a" /* of */])([]);
        }
        return this.http.get(this.getRecipientListURL + "?name=${term}").pipe(Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["c" /* tap */])(function (_) { return console.log("found user matching \"" + term + "\""); }));
    };
    MessageService.prototype.getRecipientList = function () {
        return this.http.get(this.getRecipientListURL).pipe(Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["c" /* tap */])(function (res) { return console.log(res); }));
    };
    MessageService.prototype.getAccessLevel = function () {
        return this.http.get(this.getAccessLevelURL)
            .pipe(Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["c" /* tap */])(function (res) { return console.log(res); }));
    };
    MessageService.prototype.sendMessages = function (msg) {
        var params = new __WEBPACK_IMPORTED_MODULE_1__angular_common_http__["c" /* HttpParams */]()
            .set("subject", msg.subject)
            .set("recipient", msg.recipient)
            .set("message", msg.message);
        return this.http.post(this.sendMessageAPIUrl, null, {
            params: params
        })
            .pipe();
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

/***/ "./src/app/status-page/status-page.component.css":
/***/ (function(module, exports) {

module.exports = ".panel-style {\r\n\tmargin-top: 15px;\r\n}\r\n\r\n.nav-style {\r\n\tbackground-color: #136AA9; \r\n}\r\n\r\n.nav-style .active a {\r\n\tbackground: none;\r\n\tcolor: white;\r\n}\r\n\r\n.nav-style .active a:hover {\r\n    background-color: #083759;\r\n}"

/***/ }),

/***/ "./src/app/status-page/status-page.component.html":
/***/ (function(module, exports) {

module.exports = "<!-- <ul class=\"nav nav-pills\">\n\t<p class=\"navbar-text\">{{ title | uppercase }}</p>\n\t<li role=\"navigation\" class=\"pull-right\">\n\t\t<a class=\"active\" [routerLink] = \"['/write']\">Write</a>\n\t</li>\n</ul> -->\n\n<ul class=\"nav nav-pills nav-style\">\n\t<!-- <p>{{ title | uppercase }}</p> -->\n\t<li role=\"navigation\" class=\"active pull-right\">\n\t\t<a [routerLink] = \"['/write']\">Write</a>\n\t</li>\n</ul>\n\n<div class=\"container-fluid\">\n\t<div class=\"col-xs-offset-1 col-xs-10\">\n\t\t<div class=\"panel panel-success panel-style\">\n\t\t\t<div class=\"panel-heading\">\n\t\t\t\tYour message was sent successfully!\n\t\t\t</div>\n\t\t</div>\n\t\t<div class=\"panel panel-danger panel-style\">\n\t\t\t<div class=\"panel-heading\">\n\t\t\t\tYour message failed to send. Please try again later. \n\t\t\t</div>\n\t\t</div>\n\t\t<div class=\"panel panel-info panel-style\">\n\t\t\t<div class=\"panel-heading\">\n\t\t\t\tWelcome to your ADAP messaging system!\n\t\t\t</div>\n\t\t\t<div class=\"panel-body\">\n\t\t\t\tClick on one of your messages in your inbox to view its contents. \n\t\t\t</div>\n\t\t</div>\n\t</div>\n</div>"

/***/ }),

/***/ "./src/app/status-page/status-page.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return StatusPageComponent; });
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

var StatusPageComponent = (function () {
    function StatusPageComponent() {
        this.title = 'Welcome';
    }
    StatusPageComponent.prototype.ngOnInit = function () {
    };
    return StatusPageComponent;
}());
StatusPageComponent = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["o" /* Component */])({
        selector: 'app-status-page',
        template: __webpack_require__("./src/app/status-page/status-page.component.html"),
        styles: [__webpack_require__("./src/app/status-page/status-page.component.css")]
    }),
    __metadata("design:paramtypes", [])
], StatusPageComponent);

//# sourceMappingURL=status-page.component.js.map

/***/ }),

/***/ "./src/app/write-message/write-message.component.css":
/***/ (function(module, exports) {

module.exports = ".email-form {\r\n\tdisplay: -webkit-box;\r\n\tdisplay: -ms-flexbox;\r\n\tdisplay: flex;\r\n\t-webkit-box-orient: vertical;\r\n\t-webkit-box-direction: normal;\r\n\t    -ms-flex-flow: column;\r\n\t        flex-flow: column;\r\n\theight: 100%;\r\n}\r\n.email-form .message.textarea {\r\n\tpadding: 15px;\r\n\t-webkit-box-flex: 1;\r\n\t    -ms-flex: 1 1 auto;\r\n\t        flex: 1 1 auto;\r\n}\r\n.email-form .labeled {\r\n\t-webkit-box-flex: 0;\r\n\t    -ms-flex: 0 1 auto;\r\n\t        flex: 0 1 auto;\r\n}\r\n.labeled {\r\n\tborder-bottom: 0.1px solid #f0f0f0;\r\n\tpadding: 15px;\r\n}\r\n.input { \r\n\tborder: none;\r\n}\r\n.nav-style {\r\n\tborder-bottom: 0.1px solid #f0f0f0;\r\n}\r\n.nav-style li.disabled > a:hover {\r\n\tcursor: default;\r\n}\r\n.nav-style .active a {\r\n\tbackground-color: #5cb85c;\r\n\tborder-color: #4cae4c;\r\n}\r\n.nav-style .active > a:focus,\r\n.nav-style .active > a:hover {\r\n\tcursor: pointer;\r\n\tbackground-color: #449d44;\r\n\tborder-color: #398439;\r\n}\r\n\r\n\r\n\r\n\r\n"

/***/ }),

/***/ "./src/app/write-message/write-message.component.html":
/***/ (function(module, exports) {

module.exports = "<ul class=\"nav nav-pills nav-style\">\n\t<li role=\"navigation\">\n\t\t<a [routerLink] = \"['/']\">X</a>\n\t</li>\n\t<li class=\"disabled\" role=\"presentation\">\n\t\t<a>{{ title | uppercase }}</a>\n\t</li>\n\t<li class=\"active pull-right\" role=\"navigation\">\n\t\t<a (click)=\"sendMessage()\">Send</a>\n\t</li>\n</ul>\n<div class=\"email-form form-group col-*-col*\">\n\t<div class=\"labeled\">\n\t\t<label class=\"col-form-label col-md-1\">Subject:</label>\n\t\t<div class=\"col-md-11\">\n\t\t\t<input type=\"text\" class=\"form-control\" [(ngModel)]=\"msg.subject\" placeholder=\"Write subject here\" aria-label=\"Write subject here\" aria-describedby=\"basic-addon1\">\n\t\t</div>\n\t</div>\n\n\t<div class=\"labeled\">\n\t\t<label for=\"To\" class=\"col-form-label col-xs-1\">To:</label>\n\n\t\t<div *ngIf=\"accessLevel === 'admin'\" class=\"col-xs-11\">\n\t\t\t<select class=\"selectpicker\" data-live-search=\"true\" title=\"Select a recipient\" data-size=\"5\" [(ngModel)]=\"msg.recipient\">\n\t\t \t\t<option *ngFor=\"let user of users\">{{user.EMAIL}}</option>\n\t\t\t</select>\n\t\t</div>\n\n\t\t<div *ngIf=\"accessLevel === 'user'\" class=\"col-xs-11\">\n\t\t\t<input type=\"text\" readonly class=\"form-control\" placeholder=\"Admin\" aria-label=\"Admin\" value=\"bg1@company.com\" [(ngModel)]=\"msg.recipient\">\n\t\t</div>\n\t</div>\n\n\t<div class=\"message\">\n\t\t<textarea class=\"input form-control\" [(ngModel)]=\"msg.message\" placeholder=\"Write message here\"></textarea>\n\t</div>\n</div>"

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
        this.accessLevel = "";
        this.title = 'New Message';
        this.msg = {};
    }
    WriteMessageComponent.prototype.ngOnInit = function () {
        this.getAccessLevel();
        this.getRecipientList();
    };
    WriteMessageComponent.prototype.getAccessLevel = function () {
        var _this = this;
        this.messageService.getAccessLevel()
            .subscribe(function (level) { return _this.accessLevel = level; });
    };
    WriteMessageComponent.prototype.getRecipientList = function () {
        var _this = this;
        this.messageService.getRecipientList()
            .subscribe(function (list) { return _this.users = list; });
    };
    WriteMessageComponent.prototype.sendMessage = function () {
        // Only allow sending to admin for user
        if (this.accessLevel === "user") {
            this.msg.recipient = "bg1@company.com";
        }
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