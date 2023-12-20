import { Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { LoginPageComponent } from './pages/login-page/login-page.component';

export const routes: Routes = [
     {path: '', redirectTo: 'login' , pathMatch: 'full' },
     {path: 'login', component: LoginPageComponent},
     {path:'home', component: HomeComponent},
];
