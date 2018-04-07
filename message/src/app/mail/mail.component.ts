import { Component, OnInit } from '@angular/core';
import { Msg } from '../msg';
import { MAIL } from '../mock-mail';

import { MailService } from '../mail.service';

import { ActivatedRouteSnapshot } from '@angular/router';
import { MessageResolverService } from '../message-resolver.service';

@Component({
  selector: 'app-mail',
  templateUrl: './mail.component.html',
  styleUrls: ['./mail.component.css']
})
export class MailComponent implements OnInit {
	mail = this.mailService.getMessages();
	title = "Inbox";

	selectedMsg: Msg; 

  constructor(private mailService : MailService) { }

  ngOnInit() {
  	// this.getMessages();
  	// this.test();
  }

  // test(): void {
  // 	this.mailService.test()
  // 		.subscribe(console.log);
  // }

  // getMessages(): void {
  // 	this.mailService.getMessages()
  // 		.subscribe(mail => this.mail = mail);
  // }

  onSelect(msg: Msg): void {
  	this.selectedMsg = msg;
  	msg.READSTATUS = 'T';
  }

}
