import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { WriteMessageComponent } from './write-message/write-message.component';
import { MailContentComponent } from './mail-content/mail-content.component';

import { MessageResolverService } from './message-resolver.service'; 

const routes: Routes = [
	{
		path: '',
		component: WriteMessageComponent
	},
	{
		path: 'message/:msgID',
		component: MailContentComponent,
		resolve: {
			message: MessageResolverService
		}
	}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
