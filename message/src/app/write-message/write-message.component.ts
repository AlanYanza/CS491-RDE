import { ViewChild, ElementRef, Component, OnInit } from '@angular/core';
import { Msg } from '../msg';

import { MessageService } from '../message/message.service';

import { User } from '../user';

import { FormGroup } from '@angular/forms';

@Component({
	selector: 'app-write-message',
	templateUrl: './write-message.component.html',
	styleUrls: ['./write-message.component.css']
})
export class WriteMessageComponent implements OnInit {
	@ViewChild('emailForm')
	@ViewChild('message')
	emailForm: FormGroup;
	message: ElementRef; 

	submitted: boolean; // if user clicked send button 

	title = 'New Message';
	users: User[];
	accessLevel = '';
	msg: any = {};

	constructor(private messageService: MessageService) { }

	ngOnInit() {
		this.getAccessLevel();
		this.getRecipientList();
	}

	/* GET user's access level (admin/user) */ 
	getAccessLevel() {
		this.messageService.getAccessLevel()
			.subscribe(level => this.accessLevel = level);
	}

	getRecipientList() {
		this.messageService.getRecipientList()
			.subscribe(list => this.users = list);
	}

	sendMessage() {
		this.submitted = true; 

		// Only allow sending to admin for user
		if (this.accessLevel === 'user') {
			this.msg.recipient = 'bg1@company.com';
		}

		if (this.emailForm.valid){		
			this.messageService.sendMessages(this.msg)
			.subscribe(
				data => {
					// alert 
					this.messageService.success('Your message was sent successfully!');
					this.msg = {};
				},
				err => {
					//alert 
					this.messageService.fail('Your message failed to send. Please try again later.');
					console.log(err);
				}
			);
		}

	}
}
