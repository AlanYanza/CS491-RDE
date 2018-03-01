import { Component, OnInit, Input } from '@angular/core';

import { Msg } from '../msg';


@Component({
  selector: 'app-mail-content',
  templateUrl: './mail-content.component.html',
  styleUrls: ['./mail-content.component.css']
})
export class MailContentComponent implements OnInit {
  title = "Message";
  @Input() msg: Msg; 
  
  constructor() { }

  ngOnInit() {
  }

}
