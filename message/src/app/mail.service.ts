import { Injectable } from '@angular/core';

import { Observable } from 'rxjs/Observable';
import { of } from 'rxjs/observable/of';
import { tap } from 'rxjs/operators';

import { Msg } from './msg';
// import { MAIL } from './mock-mail';

import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http'; 
import { Resolve, ActivatedRouteSnapshot } from '@angular/router';

import { map } from 'rxjs/operators/map';

@Injectable()
export class MailService implements Resolve<Msg> {

	private baseURL = 'rest/restTest/MessageSystem/';
	private getMessageURL = this.baseURL + 'GetEmail';
	private deleteMessageURL = this.baseURL + 'deleteEmail';


	constructor(
		private http: HttpClient
	) { }

	resolve(routeSnapshot: ActivatedRouteSnapshot): Observable<Msg> {
		return this.getMessages()
			.pipe(
				map((data: Msg[]) => {
		  			return data.find(msg => msg.MSGID === +routeSnapshot.params.msgID);
			})
	  	);
		// return MAIL.find(msg => msg.msgID === +routeSnapshot.params.msgID);
	}

	// getMessages(): Observable<Msg[]> { 
	// 	return of(MAIL); 
	// }	

	getMessages(): Observable<Msg[]> { 
		return this.http.get<Msg[]>(this.getMessageURL)
		.pipe(
			tap( res => console.log('HTTP response:', res))
		); 
	}

	deleteMessage(msg: Msg): Observable<Msg> {
		const params = new HttpParams()
			.set("msgID", String(msg.MSGID));  

		return this.http.get<Msg>(this.deleteMessageURL, {params:params})
			.pipe(
				tap( res => console.log('Delete:', res))
			);
	}

}