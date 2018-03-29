import { Injectable } from '@angular/core';

import { Observable } from 'rxjs/Observable';
import { of } from 'rxjs/observable/of';	

import { Resolve } from '@angular/router';
import { ActivatedRouteSnapshot } from '@angular/router';

import { Msg } from './msg';
import { MAIL } from './mock-mail';

@Injectable()
export class MessageResolverService implements Resolve<Msg> {

	resolve(routeSnapshot: ActivatedRouteSnapshot): Msg {
		return MAIL.find(msg => msg.MSGID === routeSnapshot.params.msgID);
	}

  constructor() { }

}
