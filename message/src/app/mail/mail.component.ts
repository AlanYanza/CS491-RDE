import { Component, OnInit } from '@angular/core';
import { Msg } from '../msg';
import { MAIL } from '../mock-mail';

@Component({
  selector: 'app-mail',
  templateUrl: './mail.component.html',
  styleUrls: ['./mail.component.css']
})
export class MailComponent implements OnInit {
	mail = MAIL;
	title = "Inbox";

	selectedMsg: Msg; 

  constructor() { }

  ngOnInit() {
  }

  onSelect(msg: Msg): void {
  	this.selectedMsg = msg;
  }

}
