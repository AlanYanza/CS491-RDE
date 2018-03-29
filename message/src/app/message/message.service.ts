import { Injectable } from '@angular/core';

import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http'; 

@Injectable()
export class MessageService {

	sendMessageAPIUrl = "http://localhost:8500/CS491-RDE/rest/message.cfm";

  constructor(private http: HttpClient) { }

  sendMessages(msg) {
  	const params = new HttpParams()
  		.set("subject", msg.subject)
  		.set("recipient", msg.recipient)
  		.set("message", msg.message);  		;
  	return this.http.post(this.sendMessageAPIUrl, null, {
  		params: params
  	});
  }

}
