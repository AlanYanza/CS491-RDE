import { Component, OnInit } from '@angular/core';
import { Msg } from '../msg';

import { MessageService } from '../message/message.service';

import { User } from '../user'

declare var jquery: any;
declare var $: any;

@Component({
  selector: 'app-write-message',
  templateUrl: './write-message.component.html',
  styleUrls: ['./write-message.component.css']
})
export class WriteMessageComponent implements OnInit {

  users: User[];
  
  accessLevel = "";

  title = "New Message";

  msg: any = {};

  constructor(private messageService: MessageService) { }

  ngOnInit() {
    this.getAccessLevel();
    this.getRecipientList();
  }

  getAccessLevel() {
    this.messageService.getAccessLevel()
      .subscribe(level => this.accessLevel = level);
  }

  getRecipientList() {
    this.messageService.getRecipientList()
      .subscribe(list => this.users = list);
  }

  sendMessage() {

    // Only allow sending to admin for user
    if (this.accessLevel === "user"){
      this.msg.recipient="bg1@company.com";
    } 

  	this.messageService.sendMessages(this.msg)
  		.subscribe({
        error(msg) { console.log('Error sending message:', msg)}
      })

    this.msg = {};
    
  }

}
