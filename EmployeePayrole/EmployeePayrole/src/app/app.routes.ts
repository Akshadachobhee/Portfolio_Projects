import { Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { LoginPageComponent } from './pages/login-page/login-page.component';
import { DashboardComponent } from './pages/dashboard/dashboard.component';
import { AttendanceComponent } from './pages/attendance/attendance.component';
import { LeavesComponent } from './pages/leaves/leaves.component';
import { SalaryComponent } from './pages/salary/salary.component';


export const routes: Routes = [
     {path: '', redirectTo: 'login' , pathMatch: 'full' },
     {path: 'login', component: LoginPageComponent},
     {path:'home', component: HomeComponent},
     {path: 'dashboard', component:DashboardComponent},
     {path: 'attendance', component:AttendanceComponent},
     {path: 'salary',component: SalaryComponent},
     {path:'leaves',component:LeavesComponent }
];

