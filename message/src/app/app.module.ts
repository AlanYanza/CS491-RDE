import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { MailComponent } from './mail/mail.component';
import { MailContentComponent } from './mail-content/mail-content.component'; 


@NgModule({
  declarations: [
    AppComponent,
    MailComponent,
    MailContentComponent
  ],
  imports: [
    BrowserModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
