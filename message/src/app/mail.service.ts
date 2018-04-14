import { Injectable } from '@angular/core';

import { Observable } from 'rxjs/Observable';
import { of } from 'rxjs/observable/of';
import { tap, map, catchError  } from 'rxjs/operators';

import { Msg } from './msg';
// import { MAIL } from './mock-mail';

import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http'; 
import { Resolve, ActivatedRouteSnapshot } from '@angular/router';

@Injectable()
export class MailService implements Resolve<Msg> {

	private baseURL = '/rest/restapi/MessageSystem/';
	private getMessageURL = this.baseURL + 'getInbox';
	private deleteMessageURL = this.baseURL + 'deleteEmail';
	private getSentURL = this.baseURL + 'getSent';
	private getTrashURL = this.baseURL + 'getTrash';

	constructor(
		private http: HttpClient
	) { }

	resolve(routeSnapshot: ActivatedRouteSnapshot): Observable<Msg> {
		return this.getMessages()
		.pipe(
			map((data: Msg[]) => {
	  			return data.find(msg => msg.MSGID === +routeSnapshot.params.msgID);
			}),
			catchError(this.handleError<any>('getMessage',[]))

	  	);
		// return MAIL.find(msg => msg.msgID === +routeSnapshot.params.msgID);
	}

	// getMessages(): Observable<Msg[]> { 
	// 	return of(MAIL); 
	// }	

	//Will return observable for messages in sent table 
	getSent(): Observable<Msg[]> {
		return this.http.get<Msg[]>(this.getSentURL)
		.pipe(
			tap (res => console.log('Sent response:', res)), 
			catchError(this.handleError<any>('getSent', []))
		);
	}

	//Will return observable for messages in trash table 
	getTrash(): Observable<Msg[]> {
		return this.http.get<Msg[]>(this.getTrashURL)
		.pipe(
			tap (res => console.log('Sent response:', res)), 
			catchError(this.handleError<any>('getSent', []))
		);
	}

	//Will return observable for messages in Inbox table 
	getMessages(): Observable<Msg[]> { 
		return this.http.get<Msg[]>(this.getMessageURL)
		.pipe(
			tap( res => console.log('HTTP response:', res)),
			catchError(this.handleError<any>('getMessages',[]))
		); 
	}

	deleteMessage(msg: Msg): Observable<Msg> {
		const params = new HttpParams()
			.set("msgID", String(msg.MSGID));  

		return this.http.get<Msg>(this.deleteMessageURL, {params:params})
		.pipe(
			tap( res => console.log('Delete:', res)),
			catchError(this.handleError<any>('deleteMessage',[]))
		);
	}

	 /**
   * Handle Http operation that failed.
   * Let the app continue.
   * @param operation - name of the operation that failed
   * @param result - optional value to return as the observable result
   */
	private handleError<T> (operation = 'operation', result?: T) {

		return (error: any): Observable<T> => {
	 		// TODO: send the error to remote logging infrastructure
			console.error(error); // log to console instead
	 
	 		// TODO: better job of transforming error for user consumption
			// this.log(`${operation} failed: ${error.message}`);
	 
			// Let the app keep running by returning an empty result.
			return of(result as T);
		};
	}

}