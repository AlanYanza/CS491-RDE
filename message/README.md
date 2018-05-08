# Message

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 1.4.9. This project can also be built with yarn (you can use `yarn` instead of `ng` for following commands). 

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Before building code, comment out code in index.html (everything but <app-root>)

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `-prod` flag for a production build.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI README](https://github.com/angular/angular-cli/blob/master/README.md).

## Proxy address 

Run `npm start` to proxy address from localhost:4200 --> localhost:8500 which is the assumed address for the Coldfusion server. This is to avoid CORS issue pulling data from restapi. 
