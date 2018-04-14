import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { MailComponent } from './mail/mail.component';
import { MailContentComponent } from './mail-content/mail-content.component';
import { WriteMessageComponent } from './write-message/write-message.component';
import { AppRoutingModule } from './app-routing.module';

import { MailService } from './mail.service';
import { MessageService } from './message/message.service';

import { HttpClientModule } from '@angular/common/http';
import { APP_BASE_HREF } from '@angular/common';

@NgModule({
  declarations: [
    AppComponent,
    MailComponent,
    MailContentComponent,
    WriteMessageComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [
    MailService,
    MessageService,
    {provide: APP_BASE_HREF, useValue: '/'}
    ],
  bootstrap: [AppComponent]
})
export class AppModule { }
