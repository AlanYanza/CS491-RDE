import { Injectable } from '@angular/core';

import { Observable } from 'rxjs/Observable';
import { of } from 'rxjs/observable/of';

import { Msg } from './msg';
import { MAIL } from './mock-mail';

@Injectable()
export class MailService {

  constructor() { }

  getMessages(): Observable<Msg[]> { 
  	return of(MAIL); 
  }	

  getMessage(msgID: number): Observable<Msg> { 
  	return of(MAIL.find(msg => msg.msgID === msgID)); 
  }	

}
