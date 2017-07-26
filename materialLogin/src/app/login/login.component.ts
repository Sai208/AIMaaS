import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';

import { User } from '../models/User';

import { UserLoginService } from '../user-login.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  userId: String;
  password: String;


  constructor() { }

  ngOnInit() {
  }

  authenticate(): void {
    console.log(this.userId);
    console.log(this.password);
    // this.router.navigate(['/detail']);
  }

}
