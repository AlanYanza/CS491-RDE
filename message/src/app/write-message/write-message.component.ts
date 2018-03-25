import { Component, OnInit } from '@angular/core';
import { Msg } from '../msg';

@Component({
  selector: 'app-write-message',
  templateUrl: './write-message.component.html',
  styleUrls: ['./write-message.component.css']
})
export class WriteMessageComponent implements OnInit {

	title = "Write Message";

	msg : Msg; 

  constructor() { }

  ngOnInit() {
  }

}
