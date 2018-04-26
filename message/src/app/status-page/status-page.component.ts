import { Component, OnInit } from '@angular/core';

import { MessageService } from '../message/message.service';
import { Observable } from 'rxjs/observable';

import { Alert } from '../alert';

@Component({
  selector: 'app-status-page',
  templateUrl: './status-page.component.html',
  styleUrls: ['./status-page.component.css']
})
export class StatusPageComponent implements OnInit {

	title='Welcome';

	alertMessage$: Observable<Alert> = this.messageService.getAlert();

	constructor(private messageService: MessageService) {}

	ngOnInit() {}
}