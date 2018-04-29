import { Component, OnInit } from '@angular/core';

import { MessageService } from '../message/message.service';
import { Observable } from 'rxjs/Observable';

import { Alert } from '../alert';

@Component({
	selector: 'app-status-page',
	templateUrl: './status-page.component.html',
	styleUrls: ['./status-page.component.css']
})
export class StatusPageComponent implements OnInit {
	title = 'Welcome';

	// Contains the type of alert and whether or not to show
	alertMessage$: Observable<Alert> = this.messageService.getAlert();

	constructor(private messageService: MessageService) {}

	ngOnInit() {}
}
