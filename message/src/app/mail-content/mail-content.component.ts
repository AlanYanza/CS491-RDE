import { Component, OnInit, Input } from '@angular/core';

import { Msg } from '../msg';

import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

import { MailService } from '../mail.service';


@Component({
  selector: 'app-mail-content',
  templateUrl: './mail-content.component.html',
  styleUrls: ['./mail-content.component.css']
})
export class MailContentComponent implements OnInit {
  title = "Message";
  @Input() msg: Msg; 
  
  constructor(
  	private route: ActivatedRoute,
  	private mailService: MailService,
  	private location: Location
  	) { }

  ngOnInit(): void {
  	this.getMessage();
  }

  getMessage(): void {
  	const msgID = +this.route.snapshot.paramMap.get('msgID');
  	this.mailService.getMessage(msgID)
  		.subscribe(msg => this.msg = msg);
  }

}
