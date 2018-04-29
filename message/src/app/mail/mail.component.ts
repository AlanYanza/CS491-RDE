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
	title = 'Inbox';

	mail: Msg[];

	selectedMsg: Msg;
	selectedTab: string;
	page = 1;

	constructor(private mailService: MailService) { }

	ngOnInit() {
		this.getMessages();
	}

	// Retrieves messages from sent box
	getSent(): void {
		this.mailService.getSent()
			.subscribe(mail => this.mail = mail);
		this.selectedTab = 'sent';
	}

	// Retrieves messages in Trash
	getTrash(): void {
		this.mailService.getTrash()
			.subscribe(mail => this.mail = mail);
		this.selectedTab = 'trash';
	}

	// Retrieves messages from Inbox
	getMessages(): void {
		this.mailService.getMessages()
			.subscribe(mail => this.mail = mail);

		this.selectedTab = 'inbox';
	}

	// Remove message from mailbox automatically and update server 
	deleteMessage(msg: Msg): void {
		this.mail = this.mail.filter( m => msg.MSGID !== m.MSGID );
		this.mailService.deleteMessage(msg).subscribe();
	}

	// Called when message is selected in mailbox
	onSelect(msg: Msg): void {
		this.selectedMsg = msg;
		if (this.selectedTab === 'inbox') {
			msg.READSTATUS = 'T';
		}
		this.mailService.readMessage(msg).subscribe();
	}

}
