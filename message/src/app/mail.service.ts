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

	// Store retrieved mail here 
	mail: Observable<Msg[]>;

	private baseURL = '/rest/restapi/MessageSystem/';
	private getMessageURL = this.baseURL + 'getInbox';
	private deleteMessageURL = this.baseURL + 'deleteEmail';
	private getSentURL = this.baseURL + 'getSent';
	private getTrashURL = this.baseURL + 'getTrash';
	private readMessageURL = this.baseURL + 'readMessage';

	constructor(
		private http: HttpClient
	) { }

	resolve(routeSnapshot: ActivatedRouteSnapshot): Observable<Msg> {
		return this.mail
		.pipe(
			map((data: Msg[]) => {
	  			return data.find(msg => msg.MSGID === +routeSnapshot.params.msgID);
			}),
			catchError(this.handleError<any>('getMessage',[]))

	  	);
	}

	//Will return observable for messages in sent table 
	getSent(): Observable<Msg[]> {
		this.mail = this.http.get<Msg[]>(this.getSentURL)
		.pipe(
			catchError(this.handleError<any>('getSent', []))
		);
		return this.mail;
	}

	//Will return observable for messages in trash table 
	getTrash(): Observable<Msg[]> {
		this.mail = this.http.get<Msg[]>(this.getTrashURL)
		.pipe(
			catchError(this.handleError<any>('getSent', []))
		);

		return this.mail;
	}

	//Will return observable for messages in Inbox table 
	getMessages(): Observable<Msg[]> { 
		this.mail = this.http.get<Msg[]>(this.getMessageURL)
		.pipe(
			catchError(this.handleError<any>('getMessages',[]))
		); 
		return this.mail;
	}

	deleteMessage(msg: Msg): Observable<Msg> {
		const params = new HttpParams()
			.set("msgID", String(msg.MSGID));  

		return this.http.get<Msg>(this.deleteMessageURL, {params:params})
		.pipe(
			catchError(this.handleError<any>('deleteMessage',[]))
		);
	}

	readMessage(msg:Msg): Observable<Msg> {
		const params = new HttpParams()
			.set("msgID", String(msg.MSGID));  

		return this.http.put<Msg>(this.readMessageURL, null, {params:params})
		.pipe(
			catchError(this.handleError<any>('readMessage', []))
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