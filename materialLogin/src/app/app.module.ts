import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { CdkTableModule } from '@angular/cdk';
import { FormsModule, ReactiveFormsModule} from '@angular/forms';
import { HttpModule } from '@angular/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {
  MdCardModule,
  MdIconModule,
  MdToolbarModule,
  MdInputModule,
  MdButtonModule,
  MdRadioModule,
  MdProgressSpinnerModule,
  MdGridListModule,
  MdTabsModule,
  MdTableModule
} from '@angular/material';
import { ChartsModule } from 'ng2-charts';
import { ChartModule } from 'angular2-chartjs';

// Component Imports
import { AppComponent } from './app.component';

// Services Imports
import { UserLoginService } from './user-login.service';
import { HeaderComponent } from './header/header.component';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent
  ],
  imports: [
    BrowserModule,
    CdkTableModule,
    FormsModule,
    ReactiveFormsModule,
    HttpModule,
    BrowserAnimationsModule,
    MdCardModule,
    MdIconModule,
    MdToolbarModule,
    MdInputModule,
    MdButtonModule,
    MdRadioModule,
    MdProgressSpinnerModule,
    MdGridListModule,
    ChartsModule,
    MdTabsModule,
    MdTableModule,
    ChartModule
  ],
  providers: [UserLoginService],
  bootstrap: [AppComponent]
})
export class AppModule { }
