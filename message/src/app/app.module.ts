import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { MailComponent } from './mail/mail.component';
import { MailContentComponent } from './mail-content/mail-content.component';
import { WriteMessageComponent } from './write-message/write-message.component';
import { HomeComponent } from './home/home.component'; 
import { AppRoutingModule } from './app-routing.module';

import { MailService } from './mail.service';
import { MessageResolverService } from './message-resolver.service';

@NgModule({
  declarations: [
    AppComponent,
    MailComponent,
    MailContentComponent,
    WriteMessageComponent,
    HomeComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    AppRoutingModule
  ],
  providers: [
    MailService,
    MessageResolverService
    ],
  bootstrap: [AppComponent]
})
export class AppModule { }
