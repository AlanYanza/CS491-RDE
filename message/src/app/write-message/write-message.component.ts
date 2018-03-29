import { Component, OnInit } from '@angular/core';
import { Msg } from '../msg';

import { MessageService } from '../message/message.service';

@Component({
  selector: 'app-write-message',
  templateUrl: './write-message.component.html',
  styleUrls: ['./write-message.component.css']
})
export class WriteMessageComponent implements OnInit {
  
  title = "New Message";

  msg: any = {};

  constructor(private messageService: MessageService) { }

  ngOnInit() {
  }

  sendMessage() {
  	console.log(this.msg);
  	this.messageService.sendMessages(this.msg)
  		.subscribe(console.log);
  }

}
