import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { UsersService } from '../../core/service/users/users.service';
import { FormsModule } from '@angular/forms';
import { login } from '../../core/model/classes/login';
import { Route } from '@angular/router';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule,FormsModule],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent {
  isActiveLogin = false;
  isActiveSignUp = false;

  createUserObj:user=new user;

  loginObj:login=new login;


  constructor(private useservice:UsersService,loginSrv:LoginService,private router:Route){}

  ngOnInit() {}

  cambiar_login() {
    this.isActiveLogin = true;
    this.isActiveSignUp = false;

    setTimeout(() => {
      (<HTMLElement> document.querySelector('.cont_forms')).className = 'cont_forms cont_forms_active_login';
       
      // document.querySelector('.cont_form_login')?.computedStyleMap.display = 'block';
      // document.querySelector('.cont_form_sign_up').style.opacity = '0';
      (<HTMLElement>document.querySelector('.cont_form_login')).style.display = 'block';
      (<HTMLElement>document.querySelector('.cont_form_sign_up')).style.opacity = '0';
      
    }, 0);

    setTimeout(() => {
      (<HTMLElement>document.querySelector('.cont_form_login')).style.opacity = '1';
    }, 400);

    setTimeout(() => {
      (<HTMLElement>document.querySelector('.cont_form_sign_up')).style.display = 'none';
    }, 200);
  }

  cambiar_sign_up() {
    this.isActiveLogin = false;
    this.isActiveSignUp = true;

    setTimeout(() => {
      (<HTMLElement>document.querySelector('.cont_forms')).className =
        'cont_forms cont_forms_active_sign_up';
        (<HTMLElement>document.querySelector('.cont_form_sign_up')).style.display = 'block';
        (<HTMLElement>document.querySelector('.cont_form_login')).style.opacity = '0';
    }, 0);

    setTimeout(() => {
      (<HTMLElement>document.querySelector('.cont_form_sign_up')).style.opacity = '1';
    }, 100);

    setTimeout(() => {
      (<HTMLElement>document.querySelector('.cont_form_login')).style.display = 'none';
    }, 400);

    
  }



  ocultar_login_sign_up() {
    this.isActiveLogin = false;
    this.isActiveSignUp = false;

    setTimeout(() => {
      (<HTMLElement>document.querySelector('.cont_forms')).className = 'cont_forms';
      (<HTMLElement>document.querySelector('.cont_form_sign_up')).style.opacity = '0';
      (<HTMLElement>document.querySelector('.cont_form_login')).style.opacity = '0';
    }, 0);

    setTimeout(() => {
      (<HTMLElement>document.querySelector('.cont_form_sign_up')).style.display = 'none';
      (<HTMLElement>document.querySelector('.cont_form_login')).style.display = 'none';
    }, 500);
  }


}
