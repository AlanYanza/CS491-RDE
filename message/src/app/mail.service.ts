import { Injectable } from '@angular/core';

import { Observable } from 'rxjs/Observable';
import { of } from 'rxjs/observable/of';
import { tap } from 'rxjs/operators';

import { Msg } from './msg';
// import { MAIL } from './mock-mail';

import { HttpClient, HttpHeaders } from '@angular/common/http'; 
import { Resolve, ActivatedRouteSnapshot } from '@angular/router';

import { map } from 'rxjs/operators/map';

@Injectable()
export class MailService implements Resolve<Msg> {

	MAILTEST: Observable<Msg[]>;

	private messageURL = 'http://127.0.0.1:8500/rest/restTest/MessageSystem/GetEmail';

  constructor(
  	private http: HttpClient
  	) { }

 	resolve(routeSnapshot: ActivatedRouteSnapshot): Observable<Msg> {
     return this.getMessages()
      .pipe(
        map((data: Msg[]) => {
          return data.find(msg => msg.MSGID === +routeSnapshot.params.msgID);
        }
        )
      );
 		// return MAIL.find(msg => msg.msgID === +routeSnapshot.params.msgID);
 	}

  // getMessages(): Observable<Msg[]> { 
  // 	return of(MAIL); 
  // }	

  getMessages(): Observable<Msg[]> { 
  	return this.http.get<Msg[]>(this.messageURL)
  	.pipe(
  		tap( res => console.log('HTTP response:', res))
  		); 
  }

}