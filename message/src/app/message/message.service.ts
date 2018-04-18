import { Injectable } from '@angular/core';

import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http'; 

import { Observable } from 'rxjs/observable';

import { catchError, tap } from 'rxjs/operators';
import { of } from 'rxjs/observable/of';

import { Msg } from '../msg';
import { User } from '../user';

@Injectable()
export class MessageService {

  private baseURL = "/rest/restapi/MessageSystem/";
	private sendMessageAPIUrl = this.baseURL + "sendEmail";
  private getAccessLevelURL = this.baseURL + "getAccessLevel";
  private getRecipientListURL = this.baseURL + "getRecipientList";

  constructor(private http: HttpClient) { }

  /*GET recipient list whose name contains search term */
  searchUsers(term: string): Observable<any> {
    if(!term.trim()) {
      //if no search term return an empty array of users 
      return of([]);
    }

    return this.http.get<any>(this.getRecipientListURL + "?name=${term}").pipe(
      tap(_ => console.log(`found user matching "${term}"`)));

  }

  getRecipientList(): Observable<User[]> {
    return this.http.get<User[]>(this.getRecipientListURL).pipe(
      tap(res => console.log(res)));
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
  		  params: params
  	  })
    .pipe();
  }

}
