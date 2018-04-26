import { Injectable } from '@angular/core';

import { HttpClient, HttpHeaders, HttpParams, HttpErrorResponse } from '@angular/common/http'; 

import { Observable } from 'rxjs/observable';

import { catchError, tap } from 'rxjs/operators';
import { of } from 'rxjs/observable/of';
import { ErrorObservable } from 'rxjs/observable/ErrorObservable';

import { Router } from '@angular/router';

import { Msg } from '../msg';
import { User } from '../user';
import { BehaviorSubject } from 'rxjs/BehaviorSubject';
import { Alert } from '../alert';

@Injectable()
export class MessageService {

	private subject = new BehaviorSubject<Alert>(null);

	private baseURL = "/rest/restapi/MessageSystem/";
	private sendMessageAPIUrl = this.baseURL + "sendEmail";
	private getAccessLevelURL = this.baseURL + "getAccessLevel";
	private getRecipientListURL = this.baseURL + "getRecipientList";

	constructor(private http: HttpClient, private router: Router) { }

	/*GET recipient list whose name contains search term */
	searchUsers(term: string): Observable<any> {
	    if(!term.trim()) {
			//if no search term return an empty array of users 
			return of([]);
	    }

		return this.http.get<any>(this.getRecipientListURL + "?name=${term}")
		.pipe(
			tap(_ => console.log(`found user matching "${term}"`))
		);
	}

	getRecipientList(): Observable<User[]> {
		return this.http.get<User[]>(this.getRecipientListURL)
		.pipe(
			tap(res => console.log(res))
		);
	}

	getAccessLevel(): Observable<string> {
		return this.http.get<string>(this.getAccessLevelURL)
		.pipe(
			tap(res => console.log(res))
		);
	}

	sendMessages(msg): Observable<any> {
  		const params = new HttpParams()
	  		.set("subject", msg.subject)
	  		.set("recipient", msg.recipient)
	  		.set("message", msg.message);

  		return this.http.post(this.sendMessageAPIUrl, null, {
	  		params: params,
	        observe: 'response'
  	  	})
  	  	.pipe(
      		catchError(this.handleError));
  	}

  	success(message:string){
  		this.router.navigate(['/']);
  		this.subject.next({ type: 'success', text: message});
  	}

  	fail(message:string){
  		this.router.navigate(['/']); 
  		this.subject.next({ type: 'error', text: message});
  	}

  	getAlert(): Observable<Alert>{
  		return this.subject.asObservable();
  	}

  	private handleError(error: HttpErrorResponse) {
    	if (error.error instanceof ErrorEvent) {
			// A client-side or network error occurred. Handle it accordingly.
			console.error('An error occurred:', error.error.message);
    	} else {
     	// The backend returned an unsuccessful response code.
     	// The response body may contain clues as to what went wrong,
      	console.error(
	        `Backend returned code ${error.status}, ` +
	        `body was: ${error.error}`);
    	}
	    // return an ErrorObservable with a user-facing error message
	    return new ErrorObservable(
      		'Something bad happened; please try again later.');
  	};
}