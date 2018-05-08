# CS491-RDE
RDE-Medication Assistance Online Application

Database Scripts are found in Database Script Folder<br>
<b>To Set-up Database</b><br>
1) Access and enter desired mssql(microsoft sql) database<br>
2) Run RDEDatabase.sql to set-up Base Tables<br>
3) Run any additional form.sql files to add Forms to database<br>
  a)ex. Run NJForm.sql to add NJForm to database<br>

<b>To install password valdiation stored procedure:</b> run loginProcedure.sql<br>

<b>To Remove Application Tables:RemoveApplicationTable.sql</b><br>
Note:Remove all State Form Table before running sql file<br>

<b>To Remove Form Tables:run relevant .sql files</b><br>
ex.NJForm -> RemoveNJForm.sql<br>

# Message

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 1.4.9.

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `-prod` flag for a production build.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI README](https://github.com/angular/angular-cli/blob/master/README.md).

