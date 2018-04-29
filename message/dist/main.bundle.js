webpackJsonp(["main"],{

/***/ "./src/$$_lazy_route_resource lazy recursive":
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
webpackEmptyAsyncContext.id = "./src/$$_lazy_route_resource lazy recursive";

/***/ }),

/***/ "./src/app/app-routing.module.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return AppRoutingModule; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_router__ = __webpack_require__("./node_modules/@angular/router/esm5/router.js");
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
var AppRoutingModule = /** @class */ (function () {
    function AppRoutingModule() {
    }
    AppRoutingModule = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["J" /* NgModule */])({
            imports: [__WEBPACK_IMPORTED_MODULE_1__angular_router__["c" /* RouterModule */].forRoot(routes, { useHash: true })],
            exports: [__WEBPACK_IMPORTED_MODULE_1__angular_router__["c" /* RouterModule */]]
        })
    ], AppRoutingModule);
    return AppRoutingModule;
}());



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
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};

var AppComponent = /** @class */ (function () {
    function AppComponent() {
        this.title = 'Inbox';
    }
    AppComponent = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
            selector: 'app-root',
            template: __webpack_require__("./src/app/app.component.html"),
            styles: [__webpack_require__("./src/app/app.component.css")]
        })
    ], AppComponent);
    return AppComponent;
}());



/***/ }),

/***/ "./src/app/app.module.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return AppModule; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_platform_browser__ = __webpack_require__("./node_modules/@angular/platform-browser/esm5/platform-browser.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__angular_forms__ = __webpack_require__("./node_modules/@angular/forms/esm5/forms.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__app_component__ = __webpack_require__("./src/app/app.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__mail_mail_component__ = __webpack_require__("./src/app/mail/mail.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__mail_content_mail_content_component__ = __webpack_require__("./src/app/mail-content/mail-content.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_6__write_message_write_message_component__ = __webpack_require__("./src/app/write-message/write-message.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_7__app_routing_module__ = __webpack_require__("./src/app/app-routing.module.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_8__mail_service__ = __webpack_require__("./src/app/mail.service.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_9__message_message_service__ = __webpack_require__("./src/app/message/message.service.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_10__angular_common_http__ = __webpack_require__("./node_modules/@angular/common/esm5/http.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_11__angular_common__ = __webpack_require__("./node_modules/@angular/common/esm5/common.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_12__status_page_status_page_component__ = __webpack_require__("./src/app/status-page/status-page.component.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_13_ngx_pagination__ = __webpack_require__("./node_modules/ngx-pagination/dist/ngx-pagination.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_14__ng_select_ng_select__ = __webpack_require__("./node_modules/@ng-select/ng-select/esm5/ng-select.js");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};















var AppModule = /** @class */ (function () {
    function AppModule() {
    }
    AppModule = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_1__angular_core__["J" /* NgModule */])({
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
                __WEBPACK_IMPORTED_MODULE_10__angular_common_http__["b" /* HttpClientModule */],
                __WEBPACK_IMPORTED_MODULE_13_ngx_pagination__["a" /* NgxPaginationModule */],
                __WEBPACK_IMPORTED_MODULE_14__ng_select_ng_select__["a" /* NgSelectModule */]
            ],
            providers: [
                __WEBPACK_IMPORTED_MODULE_8__mail_service__["a" /* MailService */],
                __WEBPACK_IMPORTED_MODULE_9__message_message_service__["a" /* MessageService */],
                { provide: __WEBPACK_IMPORTED_MODULE_11__angular_common__["a" /* APP_BASE_HREF */], useValue: '/' }
            ],
            bootstrap: [__WEBPACK_IMPORTED_MODULE_3__app_component__["a" /* AppComponent */]]
        })
    ], AppModule);
    return AppModule;
}());



/***/ }),

/***/ "./src/app/mail-content/mail-content.component.css":
/***/ (function(module, exports) {

module.exports = ".labeled {\r\n\tborder-bottom: 0.1px solid #f0f0f0;\r\n\tpadding: 15px;\r\n\tpadding-left: 30px;\r\n}\r\n\r\n.message {\r\n\tpadding: 30px;\r\n}\r\n\r\n.nav-style {\r\n\tborder-bottom: 1px solid #f0f0f0;\r\n}\r\n\r\n.nav-style .active a {\r\n\tpadding: 5px 10px;\r\n    margin-top: 4px;\r\n    margin-right: 4px;\r\n}\r\n\r\nli.disabled > a:hover {\r\n\tcursor: default;\r\n}\r\n"

/***/ }),

/***/ "./src/app/mail-content/mail-content.component.html":
/***/ (function(module, exports) {

module.exports = "<ul class=\"nav nav-pills nav-style\">\n\t<li role=\"navigation\">\n\t\t<a [routerLink] = \"['/']\">X</a>\n\t</li>\n\t<li class=\"disabled\" role=\"presentation\">\n\t\t<a>{{ title | uppercase }}</a>\n\t</li>\n\t<li class=\"active pull-right\" role=\"navigation\">\n\t\t<a [routerLink] = \"['/write']\">Write <span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span></a>\n\n\t</li>\n</ul>\n<div *ngIf=\"msg$ | async as msg\">\n\t<div class=\"labeled\"><label for=\"subject\">Subject:</label> {{ msg.SUBJECT }}</div>\n\t<div class=\"labeled\"><label for=\"from\">From:</label> {{ msg.SENDER }}</div>\n\t<div class=\"labeled\"><label for=\"sendTo\">To:</label> {{ msg.RECIPIENT }}</div>\n\t<div class=\"message\">{{ msg.MESSAGE }}</div>\n</div>\n"

/***/ }),

/***/ "./src/app/mail-content/mail-content.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return MailContentComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_router__ = __webpack_require__("./node_modules/@angular/router/esm5/router.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__angular_common__ = __webpack_require__("./node_modules/@angular/common/esm5/common.js");
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





var MailContentComponent = /** @class */ (function () {
    function MailContentComponent(route, mailService, location) {
        this.route = route;
        this.mailService = mailService;
        this.location = location;
        this.title = "Message";
        this.msg$ = this.route.data.pipe(Object(__WEBPACK_IMPORTED_MODULE_4_rxjs_operators_map__["a" /* map */])(function (data) {
            return data.message;
        }));
    }
    MailContentComponent.prototype.ngOnInit = function () {
    };
    MailContentComponent = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
            selector: 'app-mail-content',
            template: __webpack_require__("./src/app/mail-content/mail-content.component.html"),
            styles: [__webpack_require__("./src/app/mail-content/mail-content.component.css")]
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1__angular_router__["a" /* ActivatedRoute */],
            __WEBPACK_IMPORTED_MODULE_3__mail_service__["a" /* MailService */],
            __WEBPACK_IMPORTED_MODULE_2__angular_common__["f" /* Location */]])
    ], MailContentComponent);
    return MailContentComponent;
}());



/***/ }),

/***/ "./src/app/mail.service.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return MailService; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_rxjs_observable_of__ = __webpack_require__("./node_modules/rxjs/_esm5/observable/of.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2_rxjs_operators__ = __webpack_require__("./node_modules/rxjs/_esm5/operators.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__angular_common_http__ = __webpack_require__("./node_modules/@angular/common/esm5/http.js");
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

var MailService = /** @class */ (function () {
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
        return this.mail
            .pipe(Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["d" /* map */])(function (data) {
            return data.find(function (msg) { return msg.MSGID === +routeSnapshot.params.msgID; });
        }), Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["a" /* catchError */])(this.handleError('getMessage', [])));
        // return MAIL.find(msg => msg.msgID === +routeSnapshot.params.msgID);
    };
    // getMessages(): Observable<Msg[]> { 
    // 	return of(MAIL); 
    // }	
    //Will return observable for messages in sent table 
    MailService.prototype.getSent = function () {
        this.mail = this.http.get(this.getSentURL)
            .pipe(Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["g" /* tap */])(function (res) { return console.log('Sent response:', res); }), Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["a" /* catchError */])(this.handleError('getSent', [])));
        return this.mail;
    };
    //Will return observable for messages in trash table 
    MailService.prototype.getTrash = function () {
        this.mail = this.http.get(this.getTrashURL)
            .pipe(Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["g" /* tap */])(function (res) { return console.log('Sent response:', res); }), Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["a" /* catchError */])(this.handleError('getSent', [])));
        return this.mail;
    };
    //Will return observable for messages in Inbox table 
    MailService.prototype.getMessages = function () {
        this.mail = this.http.get(this.getMessageURL)
            .pipe(Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["g" /* tap */])(function (res) { return console.log('HTTP response:', res); }), Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["a" /* catchError */])(this.handleError('getMessages', [])));
        return this.mail;
    };
    MailService.prototype.deleteMessage = function (msg) {
        var params = new __WEBPACK_IMPORTED_MODULE_3__angular_common_http__["c" /* HttpParams */]()
            .set("msgID", String(msg.MSGID));
        return this.http.get(this.deleteMessageURL, { params: params })
            .pipe(Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["g" /* tap */])(function (res) { return console.log('Delete:', res); }), Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["a" /* catchError */])(this.handleError('deleteMessage', [])));
    };
    MailService.prototype.readMessage = function (msg) {
        var params = new __WEBPACK_IMPORTED_MODULE_3__angular_common_http__["c" /* HttpParams */]()
            .set("msgID", String(msg.MSGID));
        return this.http.put(this.readMessageURL, null, { params: params })
            .pipe(Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["g" /* tap */])(function (res) { return console.log('Read:', res); }), Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["a" /* catchError */])(this.handleError('readMessage', [])));
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
    MailService = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["B" /* Injectable */])(),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_3__angular_common_http__["a" /* HttpClient */]])
    ], MailService);
    return MailService;
}());



/***/ }),

/***/ "./src/app/mail/mail.component.css":
/***/ (function(module, exports) {

module.exports = ".selected {\r\n\tbackground-color: #80b6fc !important;\r\n}\r\n\r\n.read {\r\n\tfont-weight: bold !important;\r\n}\r\n\r\n#sidebar {\r\n\t/*border: 0.1px solid gray;*/\r\n\tmin-height: 100%;\r\n\tpadding:0;\r\n\tdisplay: -webkit-box;\r\n\tdisplay: -ms-flexbox;\r\n\tdisplay: flex;\r\n\t-webkit-box-orient: vertical;\r\n\t-webkit-box-direction: normal;\r\n\t    -ms-flex-direction: column;\r\n\t        flex-direction: column;\r\n}\r\n\r\n.title {\r\n\tbackground-color: #f0f0f0;\r\n\tborder-bottom: 1px solid #ddd;\r\n}\r\n\r\n.mail {\r\n\tlist-style-type: none;\r\n\tleft:0;\r\n\twidth:100%;\r\n\tpadding: 0;\r\n\t-webkit-box-flex: 1;\r\n\t    -ms-flex: 1;\r\n\t        flex: 1;\r\n\tmin-height: -webkit-min-content;\r\n}\r\n\r\n.mail li {\r\n\t/*position: relative;*/\r\n\tleft: 0;\r\n\tbackground-color:white;\r\n\tborder: none;\r\n\tborder-bottom: 0.1px solid #f0f0f0;\r\n\tpadding: 10px;\r\n\tpadding-top: 15px;\r\n\tpadding-bottom: 15px;\r\n}\r\n\r\n.mail-scroll {\r\n\t-webkit-box-flex: 1;\r\n\t    -ms-flex: 1;\r\n\t        flex: 1;\r\n\toverflow-y: auto;\r\n}\r\n\r\n.date {\r\n\tfloat: right;\r\n\tcolor: gray;\r\n}\r\n\r\n#content {\r\n\tpadding: 0;\r\n\tpadding-left: 1px;\r\n\tborder-left: 0.1px solid gray;\r\n\theight: 100%;\r\n}\r\n\r\n.show {\r\n\tdisplay: block !important;\r\n}\r\n\r\n#trashIcon { \r\n\tfloat: right;\r\n}\r\n\r\n.nav {\r\n\tbackground-color: #136AA9; \r\n}\r\n\r\n.navbar {\r\n\tmargin-bottom: 0px;\r\n\tborder: none;\r\n\tmin-height: 20px;\r\n}\r\n\r\n.nav-link {\r\n\tcursor: pointer;\r\n\tcolor: white;\r\n}\r\n\r\n.nav-link:hover {\r\n\tbackground-color: #083759;\r\n}\r\n\r\n.navbar-toggle {\r\n\tfloat: left;\r\n\tmargin-bottom: 0px;\r\n\tmargin-left: 2px;\r\n}\r\n\r\n.navbar-collapse {\r\n\tpadding: 0px;\r\n}\r\n\r\n.pagination-styles {\r\n\tdisplay: -webkit-box;\r\n\tdisplay: -ms-flexbox;\r\n\tdisplay: flex;\r\n\t-webkit-box-pack: center;\r\n\t    -ms-flex-pack: center;\r\n\t        justify-content: center;\r\n}\r\n\r\n.pagination-styles /deep/ .ngx-pagination {\r\n\tpadding: 0px;\r\n\tmargin-bottom: 0px;\r\n}\r\n\r\n/* width */\r\n\r\n::-webkit-scrollbar {\r\n    width: 10px;\r\n}\r\n\r\n/* Track */\r\n\r\n::-webkit-scrollbar-track {\r\n    background: #f1f1f1; \r\n}\r\n\r\n/* Handle */\r\n\r\n::-webkit-scrollbar-thumb {\r\n    background: #888; \r\n}\r\n\r\n/* Handle on hover */\r\n\r\n::-webkit-scrollbar-thumb:hover {\r\n    background: #555; \r\n}"

/***/ }),

/***/ "./src/app/mail/mail.component.html":
/***/ (function(module, exports) {

module.exports = "<div class=\"container-fluid\">\n\t<div class=\"row\">\n\t\t<div class=\"col-xs-3 container-fluid\" id=\"sidebar\">\n\t\t\t<nav class=\"navbar navbar-default\">\n\t\t\t\t<div class=\"navbar-header\">\n\t\t\t      <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#mail-tabs\" aria-expanded=\"false\">\n\t\t\t        <span class=\"sr-only\">Toggle navigation</span>\n\t\t\t        <span class=\"icon-bar\"></span>\n\t\t\t        <span class=\"icon-bar\"></span>\n\t\t\t        <span class=\"icon-bar\"></span>\n\t\t\t      </button>\n\t\t\t    </div>\n\t\t\t\t<div class=\"navbar-collapse collapse\" id=\"mail-tabs\">\n\t\t\t\t\t<ul class=\"nav nav-tabs\" ng-init=\"selectedTab = 'inbox'\">\n\t\t\t\t\t\t<li role=\"navigation\" [class.active]=\"selectedTab ==='inbox'\" (click)=\"getMessages()\"><a class=\"nav-link\">Inbox <span class=\"glyphicon glyphicon-refresh\" aria-hidden=\"true\"></span></a></li>\n\t\t\t\t\t\t<li role=\"navigation\" [class.active]=\"selectedTab ==='sent'\" (click)=\"getSent()\"><a class=\"nav-link\">Sent</a></li>\n\t\t\t\t\t\t<li role=\"navigation\" [class.active]=\"selectedTab ==='trash'\" (click)=\"getTrash()\"><a class=\"nav-link\">Trash</a></li>\n\t\t\t\t\t</ul>\n\t\t\t\t</div>\n\t\t\t</nav>\n\n\t\t\t<div class=\"mail-scroll\">\n\t\t\t\t<ul class=\"mail\">\n\t\t\t\t\t<li *ngFor=\"let msg of mail | paginate: {itemsPerPage: 10, currentPage: page }; let i = index\" \n\t\t\t\t\t[class.read]=\"msg.READSTATUS === 'F'\" \n\t\t\t\t\t[class.selected]=\"msg === selectedMsg\" \n\t\t\t\t\t[routerLink] = \"['/message', msg.MSGID]\" \n\t\t\t\t\t(click)=\"onSelect(msg)\" class=\"container-fluid\"> \n\t\t\t\t\t\t<div>\n\t\t\t\t\t\t\t<span class=\"subject\">{{msg.SUBJECT}}</span>\n\t\t\t\t\t\t\t<span class=\"date\">{{msg.DATESENT}}</span>\n\t\t\t\t\t\t</div>\n\t\t\t\t\t\t<div>\n\t\t\t\t\t\t\t<span class=\"sender\">{{msg.SENDER}}</span>\n\t\t\t\t\t\t\t<button *ngIf=\"selectedTab === 'inbox'\" id=\"trashIcon\" type=\"button\" class=\"btn btn-danger btn-sm\" (click)=\"deleteMessage(msg)\"><span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span></button>\n\t\t\t\t\t\t</div>\n\t\t\t\t\t</li>\n\t\t\t\t</ul>\n\t\t\t</div>\n\t\t\t<div class=\"pagination-styles\">\n\t\t\t\t<pagination-controls\n\t\t\t\t\t(pageChange)=\"page = $event\" \n\t\t\t\t\tpreviousLabel=\"\" \n\t\t\t\t\tnextLabel=\"\" \n\t\t\t\t\tautoHide=\"true\"\n\t\t\t\t\tmaxSize=5>\t\t\t\t\t\t\n\t\t\t\t</pagination-controls>\n\t\t\t</div>\n\t\t</div>\n\t\t<div class=\"col-xs-9\" id=\"content\">\n\t\t\t<router-outlet></router-outlet>\n\t\t</div>\n\t</div>\n</div>\n"

/***/ }),

/***/ "./src/app/mail/mail.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return MailComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__mock_mail__ = __webpack_require__("./src/app/mock-mail.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__mail_service__ = __webpack_require__("./src/app/mail.service.ts");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};



var MailComponent = /** @class */ (function () {
    function MailComponent(mailService) {
        this.mailService = mailService;
        this.title = 'Inbox';
        // mail: Msg[];
        this.mail = __WEBPACK_IMPORTED_MODULE_1__mock_mail__["a" /* MAIL */];
        this.page = 1;
    }
    MailComponent.prototype.ngOnInit = function () {
        // this.getMessages();
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
        if (this.selectedTab === 'inbox') {
            msg.READSTATUS = 'T';
        }
        this.mailService.readMessage(msg).subscribe();
    };
    MailComponent = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
            selector: 'app-mail',
            template: __webpack_require__("./src/app/mail/mail.component.html"),
            styles: [__webpack_require__("./src/app/mail/mail.component.css")]
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_2__mail_service__["a" /* MailService */]])
    ], MailComponent);
    return MailComponent;
}());



/***/ }),

/***/ "./src/app/message/message.service.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return MessageService; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_common_http__ = __webpack_require__("./node_modules/@angular/common/esm5/http.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2_rxjs_operators__ = __webpack_require__("./node_modules/rxjs/_esm5/operators.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3_rxjs_observable_of__ = __webpack_require__("./node_modules/rxjs/_esm5/observable/of.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4_rxjs_observable_ErrorObservable__ = __webpack_require__("./node_modules/rxjs/_esm5/observable/ErrorObservable.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__angular_router__ = __webpack_require__("./node_modules/@angular/router/esm5/router.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_6_rxjs_BehaviorSubject__ = __webpack_require__("./node_modules/rxjs/_esm5/BehaviorSubject.js");
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};







var MessageService = /** @class */ (function () {
    function MessageService(http, router) {
        this.http = http;
        this.router = router;
        this.subject = new __WEBPACK_IMPORTED_MODULE_6_rxjs_BehaviorSubject__["a" /* BehaviorSubject */](null);
        this.baseURL = '/rest/restapi/MessageSystem/';
        this.sendMessageAPIUrl = this.baseURL + 'sendEmail';
        this.getAccessLevelURL = this.baseURL + 'getAccessLevel';
        this.getRecipientListURL = this.baseURL + 'getRecipientList';
    }
    /*GET recipient list whose name contains search term */
    MessageService.prototype.searchUsers = function (term) {
        if (!term.trim()) {
            // if no search term return an empty array of users
            return Object(__WEBPACK_IMPORTED_MODULE_3_rxjs_observable_of__["a" /* of */])([]);
        }
        return this.http.get(this.getRecipientListURL + '?name=${term}')
            .pipe(Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["g" /* tap */])(function (_) { return console.log("found user matching \"" + term + "\""); }));
    };
    MessageService.prototype.getRecipientList = function () {
        return this.http.get(this.getRecipientListURL)
            .pipe(Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["g" /* tap */])(function (res) { return console.log(res); }));
    };
    MessageService.prototype.getAccessLevel = function () {
        return this.http.get(this.getAccessLevelURL)
            .pipe(Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["g" /* tap */])(function (res) { return console.log(res); }));
    };
    MessageService.prototype.sendMessages = function (msg) {
        var params = new __WEBPACK_IMPORTED_MODULE_1__angular_common_http__["c" /* HttpParams */]()
            .set('subject', msg.subject)
            .set('recipient', msg.recipient)
            .set('message', msg.message);
        return this.http.post(this.sendMessageAPIUrl, null, {
            params: params,
            observe: 'response'
        })
            .pipe(Object(__WEBPACK_IMPORTED_MODULE_2_rxjs_operators__["a" /* catchError */])(this.handleError));
    };
    MessageService.prototype.success = function (message) {
        this.router.navigate(['/']);
        this.subject.next({ type: 'success', text: message });
    };
    MessageService.prototype.fail = function (message) {
        this.router.navigate(['/']);
        this.subject.next({ type: 'error', text: message });
    };
    MessageService.prototype.getAlert = function () {
        return this.subject.asObservable();
    };
    MessageService.prototype.handleError = function (error) {
        if (error.error instanceof ErrorEvent) {
            // A client-side or network error occurred. Handle it accordingly.
            console.error('An error occurred:', error.error.message);
        }
        else {
            // The backend returned an unsuccessful response code.
            // The response body may contain clues as to what went wrong,
            console.error("Backend returned code " + error.status + ", " +
                ("body was: " + error.error));
        }
        // return an ErrorObservable with a user-facing error message
        return new __WEBPACK_IMPORTED_MODULE_4_rxjs_observable_ErrorObservable__["a" /* ErrorObservable */]('Something bad happened; please try again later.');
    };
    MessageService = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["B" /* Injectable */])(),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1__angular_common_http__["a" /* HttpClient */], __WEBPACK_IMPORTED_MODULE_5__angular_router__["b" /* Router */]])
    ], MessageService);
    return MessageService;
}());



/***/ }),

/***/ "./src/app/mock-mail.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return MAIL; });
var MAIL = [
    { MSGID: 1, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 2, SENDER: 'Taylor', SUBJECT: 'test', RECIPIENT: 'Admin', MESSAGE: 'Bye', DATESENT: '1/2/11', READSTATUS: 'N' },
    // tslint:disable-next-line:max-line-length
    { MSGID: 3, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Alan Yanza', MESSAGE: 'This is a really long message.This is a really long message.This is a really long message.This is a really long message.This is a really long message.This is a really long message.This is a really long message.This is a really long message.', DATESENT: '1/1/11', READSTATUS: 'Y' },
    { MSGID: 4, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 5, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 6, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 7, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 8, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 9, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 9, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 10, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 11, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 12, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 4, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 5, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 6, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 7, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 8, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 9, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 9, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 10, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 11, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 12, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 4, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 5, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 6, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 7, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 8, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 9, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 9, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 10, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 11, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 12, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 10, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 11, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 12, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 4, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 5, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 6, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 7, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 8, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 9, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 9, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 10, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 11, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 10, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 11, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 12, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 4, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 5, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 6, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 7, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 8, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 9, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 9, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 10, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' },
    { MSGID: 11, SENDER: 'Admin', SUBJECT: 'test', RECIPIENT: 'Taylor Tu', MESSAGE: 'Hello', DATESENT: '1/1/11', READSTATUS: 'N' }
];


/***/ }),

/***/ "./src/app/status-page/status-page.component.css":
/***/ (function(module, exports) {

module.exports = ".panel-style {\r\n\tmargin-top: 15px;\r\n}\r\n\r\n.nav-style {\r\n\tbackground-color: #136AA9; \r\n\tborder-bottom: 1px solid gray;\r\n}\r\n\r\n.nav-style .active a {\r\n\tpadding: 5px 10px;\r\n    margin-top: 4px;\r\n    margin-right: 4px;\r\n\tbackground: none;\r\n\tcolor: white;\r\n}\r\n\r\n.nav-style .active a:hover {\r\n    background-color: #083759;\r\n}\r\n\r\nli.disabled > a {\r\n\tcolor: white;\r\n}\r\n\r\nli.disabled > a:hover {\r\n\tcursor: default;\r\n}\r\n"

/***/ }),

/***/ "./src/app/status-page/status-page.component.html":
/***/ (function(module, exports) {

module.exports = "<!-- <ul class=\"nav nav-pills\">\n\t<p class=\"navbar-text\">{{ title | uppercase }}</p>\n\t<li role=\"navigation\" class=\"pull-right\">\n\t\t<a class=\"active\" [routerLink] = \"['/write']\">Write</a>\n\t</li>\n</ul> -->\n\n<ul class=\"nav nav-pills nav-style\">\n\t<li class=\"disabled\" role=\"presentation\">\n\t\t<a>{{ title | uppercase }}</a>\n\t</li>\n\t<li role=\"navigation\" class=\"active pull-right\">\n\t\t<a [routerLink] = \"['/write']\">Write <span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span></a>\n\t</li>\n</ul>\n\n<div class=\"container-fluid\">\n\t<div class=\"col-xs-offset-1 col-xs-10\">\n\t\t<div *ngIf=\"alertMessage$ | async as alertMessage\" [ngClass]=\"{'alert': alertMessage, 'alert-danger': alertMessage.type === 'error', 'alert-success': alertMessage.type==='success'}\" class=\"alert-dismissible panel-style\">\n\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n\t\t\t{{alertMessage.text}}\n\t\t</div>\n\t\t<!-- <div class=\"alert alert-danger alert-dismissible panel-style\">\n\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n\t\t\tYour message failed to send. Please try again later. \n\t\t</div> -->\n\t\t<div class=\"panel panel-info panel-style\">\n\t\t\t<div class=\"panel-heading\">\n\t\t\t\tWelcome to your ADAP messaging system!\n\t\t\t</div>\n\t\t\t<div class=\"panel-body\">\n\t\t\t\tClick on one of your messages in your inbox to view its contents. Or click the \"Write\" button in the upper right to send a message. \n\t\t\t</div>\n\t\t</div>\n\t</div>\n</div>"

/***/ }),

/***/ "./src/app/status-page/status-page.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return StatusPageComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
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


var StatusPageComponent = /** @class */ (function () {
    function StatusPageComponent(messageService) {
        this.messageService = messageService;
        this.title = 'Welcome';
        this.alertMessage$ = this.messageService.getAlert();
    }
    StatusPageComponent.prototype.ngOnInit = function () { };
    StatusPageComponent = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
            selector: 'app-status-page',
            template: __webpack_require__("./src/app/status-page/status-page.component.html"),
            styles: [__webpack_require__("./src/app/status-page/status-page.component.css")]
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1__message_message_service__["a" /* MessageService */]])
    ], StatusPageComponent);
    return StatusPageComponent;
}());



/***/ }),

/***/ "./src/app/write-message/write-message.component.css":
/***/ (function(module, exports) {

module.exports = ".container-div {\r\n\theight: 100%;\r\n\tdisplay: -webkit-box;\r\n\tdisplay: -ms-flexbox;\r\n\tdisplay: flex;\r\n\t-webkit-box-orient: vertical;\r\n\t-webkit-box-direction: normal;\r\n\t    -ms-flex-direction: column;\r\n\t        flex-direction: column;\r\n}\r\n\r\n.email-form {\r\n\t-webkit-box-flex: 1;\r\n\t    -ms-flex: 1 0 auto;\r\n\t        flex: 1 0 auto;\r\n\tdisplay: -webkit-box;\r\n\tdisplay: -ms-flexbox;\r\n\tdisplay: flex;\r\n\t-webkit-box-orient: vertical;\r\n\t-webkit-box-direction: normal;\r\n\t    -ms-flex-direction: column;\r\n\t        flex-direction: column;\r\n\r\n}\r\n\r\n.email-form .message {\r\n\t-webkit-box-flex: 1;\r\n\t    -ms-flex: 1 0 auto;\r\n\t        flex: 1 0 auto;\r\n\tdisplay: -webkit-box;\r\n\tdisplay: -ms-flexbox;\r\n\tdisplay: flex;\r\n\t-webkit-box-orient: vertical;\r\n\t-webkit-box-direction: normal;\r\n\t    -ms-flex-direction: column;\r\n\t        flex-direction: column;\r\n\tmargin: 15px;\r\n}\r\n\r\n.email-form .message > textarea {\r\n\t-webkit-box-flex: 1;\r\n\t    -ms-flex: 1 0 auto;\r\n\t        flex: 1 0 auto;\r\n\tresize: none;\r\n\t-webkit-box-sizing: border-box;\r\n\t        box-sizing: border-box;\r\n}\r\n\r\n.email-form .labeled {\r\n\t-webkit-box-flex: 0;\r\n\t    -ms-flex: 0 0 auto;\r\n\t        flex: 0 0 auto;\r\n}\r\n\r\n.labeled {\r\n\tborder-bottom: 0.1px solid #f0f0f0;\r\n\tpadding: 15px;\r\n}\r\n\r\n.labeled .col-form-label {\r\n\tline-height: 270%;\r\n}\r\n\r\n.input { \r\n\tborder: none;\r\n}\r\n\r\n.nav-style {\r\n\tborder-bottom: 1px solid #f0f0f0;\r\n}\r\n\r\n.nav-style li.disabled > a:hover {\r\n\tcursor: default;\r\n}\r\n\r\n.nav-style .active a {\r\n\tpadding: 5px 10px;\r\n    margin-top: 4px;\r\n    margin-right: 4px;\r\n\tbackground-color: #5cb85c;\r\n\tborder-color: #4cae4c;\r\n}\r\n\r\n.nav-style .active > a:focus,\r\n.nav-style .active > a:hover {\r\n\tcursor: pointer;\r\n\tbackground-color: #449d44;\r\n\tborder-color: #398439;\r\n}\r\n\r\n\r\n\r\n\r\n\r\n"

/***/ }),

/***/ "./src/app/write-message/write-message.component.html":
/***/ (function(module, exports) {

module.exports = "<div class=\"container-div\">\n\t<ul class=\"nav nav-pills nav-style\">\n\t\t<li role=\"navigation\">\n\t\t\t<a [routerLink] = \"['/']\">X</a>\n\t\t</li>\n\t\t<li class=\"disabled\" role=\"presentation\">\n\t\t\t<a>{{ title | uppercase }}</a>\n\t\t</li>\n\t\t<li class=\"active pull-right\" role=\"navigation\">\n\t\t\t<a (click)=\"sendMessage()\">Send</a>\n\t\t</li>\n\t</ul>\n\t<div class=\"email-form form-group col-*-col*\">\n\t\t<div class=\"labeled\">\n\t\t\t<label class=\"col-form-label col-md-1\">Subject:</label>\n\t\t\t<div class=\"col-md-11\">\n\t\t\t\t<input type=\"text\" class=\"form-control\" [(ngModel)]=\"msg.subject\" placeholder=\"Write subject here\" aria-label=\"Write subject here\" aria-describedby=\"basic-addon1\">\n\t\t\t</div>\n\t\t</div>\n\n\t\t<div class=\"labeled\">\n\t\t\t<label for=\"To\" class=\"col-form-label col-xs-1\">To:</label>\n\n\t\t\t<div *ngIf=\"accessLevel === 'admin'\" class=\"col-xs-11\"> \n\t\t\t\t<ng-select [(ngModel)]=\"msg.recipient\">\n\t\t\t\t\t<ng-option *ngFor=\"let user of users\" [value]=\"user.EMAIL\">{{user.FIRSTNAME}} {{user.LASTNAME}}, {{user.EMAIL}}</ng-option> \n\t\t\t\t</ng-select>\n\t\t\t</div>\n\n\t\t\t<div *ngIf=\"accessLevel === 'user'\" class=\"col-xs-11\">\n\t\t\t\t<input type=\"text\" readonly class=\"form-control\" placeholder=\"Admin\" aria-label=\"Admin\" [(ngModel)]=\"msg.recipient\">\n\t\t\t</div>\n\t\t</div>\n\n\t\t<div class=\"message\">\n\t\t\t<textarea class=\"input form-control\" [(ngModel)]=\"msg.message\" placeholder=\"Write message here\"></textarea>\n\t\t</div>\n\t</div>\n</div>"

/***/ }),

/***/ "./src/app/write-message/write-message.component.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return WriteMessageComponent; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
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


var WriteMessageComponent = /** @class */ (function () {
    function WriteMessageComponent(messageService) {
        this.messageService = messageService;
        this.title = 'New Message';
        this.accessLevel = '';
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
        var _this = this;
        // Only allow sending to admin for user
        if (this.accessLevel === 'user') {
            this.msg.recipient = 'bg1@company.com';
        }
        this.messageService.sendMessages(this.msg)
            .subscribe(function (data) {
            _this.messageService.success('Your message was sent successfully!');
            _this.msg = {};
        }, function (err) {
            _this.messageService.fail('Your message failed to send. Please try again later.');
            console.log(err);
        });
    };
    WriteMessageComponent = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
            selector: 'app-write-message',
            template: __webpack_require__("./src/app/write-message/write-message.component.html"),
            styles: [__webpack_require__("./src/app/write-message/write-message.component.css")]
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1__message_message_service__["a" /* MessageService */]])
    ], WriteMessageComponent);
    return WriteMessageComponent;
}());



/***/ }),

/***/ "./src/environments/environment.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return environment; });
// The file contents for the current environment will overwrite these during build.
// The build system defaults to the dev environment which uses `environment.ts`, but if you do
// `ng build --env=prod` then `environment.prod.ts` will be used instead.
// The list of which env maps to which file can be found in `.angular-cli.json`.
var environment = {
    production: false
};


/***/ }),

/***/ "./src/main.ts":
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__("./node_modules/@angular/core/esm5/core.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_platform_browser_dynamic__ = __webpack_require__("./node_modules/@angular/platform-browser-dynamic/esm5/platform-browser-dynamic.js");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__app_app_module__ = __webpack_require__("./src/app/app.module.ts");
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__environments_environment__ = __webpack_require__("./src/environments/environment.ts");




if (__WEBPACK_IMPORTED_MODULE_3__environments_environment__["a" /* environment */].production) {
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["_15" /* enableProdMode */])();
}
Object(__WEBPACK_IMPORTED_MODULE_1__angular_platform_browser_dynamic__["a" /* platformBrowserDynamic */])().bootstrapModule(__WEBPACK_IMPORTED_MODULE_2__app_app_module__["a" /* AppModule */])
    .catch(function (err) { return console.log(err); });


/***/ }),

/***/ 0:
/***/ (function(module, exports, __webpack_require__) {

module.exports = __webpack_require__("./src/main.ts");


/***/ })

},[0]);
//# sourceMappingURL=main.bundle.js.map