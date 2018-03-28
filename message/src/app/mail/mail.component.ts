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
	mail : Msg[];
	title = "Inbox";

	selectedMsg: Msg; 

	num:any;

  constructor(private mailService : MailService) { }

  ngOnInit() {
  	this.getMessages();
  }

  test(): void {
  	this.mailService.test()
  		.subscribe(num => this.num = num);
  }

  getMessages(): void {
  	this.mailService.getMessages()
  		.subscribe(mail => this.mail = mail);
  }

  // onSelect(msg: Msg): void {
  // 	this.selectedMsg = msg;
  // 	msg.read = true;
  // }

}
