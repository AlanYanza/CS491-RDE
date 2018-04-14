import { Component, OnInit } from '@angular/core';
import { Msg } from '../msg';
import { MAIL } from '../mock-mail';

import { MailService } from '../mail.service';

import { ActivatedRouteSnapshot } from '@angular/router';

@Component({
  selector: 'app-mail',
  templateUrl: './mail.component.html',
  styleUrls: ['./mail.component.css']
})
export class MailComponent implements OnInit {
	title = "Inbox";
  
  mail: Msg[];

	selectedMsg: Msg; 

  constructor(private mailService : MailService) { }

  ngOnInit() {
  	this.getMessages();
  }

  getSent(): void {
    this.mailService.getSent()
      .subscribe(mail => this.mail = mail);
  }

  getTrash(): void {
    this.mailService.getTrash()
      .subscribe(mail => this.mail = mail);
  }

  getMessages(): void {
  	this.mailService.getMessages()
  		.subscribe(mail => this.mail = mail);
  }

  deleteMessage(msg: Msg): void {
    this.mail = this.mail.filter( m => msg.MSGID !== m.MSGID );
    this.mailService.deleteMessage(msg).subscribe();
  }

  onSelect(msg: Msg): void {
  	this.selectedMsg = msg;
  	msg.READSTATUS = 'T';
    this.mailService.readMessage(msg).subscribe();
  }

}
