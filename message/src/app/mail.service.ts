import { Injectable } from '@angular/core';

import { Observable } from 'rxjs/Observable';
import { of } from 'rxjs/observable/of';
import { tap } from 'rxjs/operators';

import { Msg } from './msg';
import { MAIL } from './mock-mail';

import { HttpClient, HttpHeaders } from '@angular/common/http'; 
import { Resolve, ActivatedRouteSnapshot } from '@angular/router';

@Injectable()
export class MailService implements Resolve<Msg> {
	private mailUrl = 'https://jsonplaceholder.typicode.com/posts/1';
	private testURL = 'http://localhost:8500/CS491-RDE/rest/message.cfm?msgID=1';
  
  constructor(
  	private http: HttpClient
  	) { }

 	resolve(routeSnapshot: ActivatedRouteSnapshot): Msg {
 		return MAIL.find(msg => msg.msgID === +routeSnapshot.params.msgID);
 	}

  getMessages(): Observable<Msg[]> { 
  	return of(MAIL); 
  }	

  test(): Observable<any> {
  	return this.http.get<any>(this.testURL)
  	.pipe(
  		tap( res => console.log('HTTP response:', res))
  		);
  }

  // getMessages(): Observable<Msg[]>  {
  // 	return this.http.get<string>(this.mailUrl);
  // }

  // getMessage(msgID: number): Observable<Msg> { 
  // 	return of(MAIL.find(msg => msg.msgID === msgID)); 
  // }	

}