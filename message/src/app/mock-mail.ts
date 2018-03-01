import { Msg } from './msg';

export const MAIL: Msg[] = [
	{ msgID: 1, sender: "Admin", subject: "test", recipient: "Taylor Tu", message: "Hello", DateSent: "1/1/11", read: false }, 
	{ msgID: 2, sender: "Taylor", subject: "test", recipient: "Admin", message: "Bye", DateSent: "1/2/11", read: false }, 
	{ msgID: 3, sender: "Admin", subject: "test", recipient: "Alan Yanza", message: "Hello", DateSent: "1/1/11", read: true }, 
	{ msgID: 4, sender: "Admin", subject: "test", recipient: "Taylor Tu", message: "Hello", DateSent: "1/1/11", read: true }, 
	{ msgID: 5, sender: "Admin", subject: "test", recipient: "Taylor Tu", message: "Hello", DateSent: "1/1/11", read: true }, 
	{ msgID: 6, sender: "Admin", subject: "test", recipient: "Taylor Tu", message: "Hello", DateSent: "1/1/11", read: true }
];