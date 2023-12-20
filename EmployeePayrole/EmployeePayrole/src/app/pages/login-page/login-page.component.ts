import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
 

@Component({
  selector: 'app-login-page',
  standalone: true,
  imports: [FormsModule,CommonModule],
  templateUrl: './login-page.component.html',
  styleUrl: './login-page.component.css'
})
export class LoginPageComponent {
 Login_Details = {
  username: "",
  password: ""
 };
 constructor(private router:Router){}
 enteredUsername: string = "";
 enteredPassword: string = "";
 loginError: boolean = false;


 onLogin() {
  if (this.Login_Details.username =='admin' && this.Login_Details.password == '1234') {
    this.router.navigateByUrl('/home');
    console.log("Login successful");
    this.loginError = false;

    
  } else {
    console.log("Login failed");
    this.loginError = true;
  }
}
}
