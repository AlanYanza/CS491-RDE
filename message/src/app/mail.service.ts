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

	MAILTEST: Observable<Msg[]>;

	private messageURL = 'http://localhost:8500/CS491-RDE/rest/message.cfm';

  constructor(
  	private http: HttpClient
  	) { }

 	resolve(routeSnapshot: ActivatedRouteSnapshot): Msg {
 		return MAIL.find(msg => msg.msgID === +routeSnapshot.params.msgID);
 	}

  // getMessages(): Observable<Msg[]> { 
  // 	return of(MAIL); 
  // }	

  getMessages(): Observable<Msg[]> { 
  	this.MAILTEST = this.http.get<any>(this.messageURL)
  	.pipe(
  		tap( res => console.log('HTTP response:', res))
  		);
  	return this.MAILTEST; 
  }

}