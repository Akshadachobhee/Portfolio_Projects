import { Routes } from '@angular/router';
import { DashboardComponent } from './pages/dashboard/dashboard.component';
import { AllAppointementComponent } from './pages/all-appointement/all-appointement.component';
import { BookAppointmentComponent } from './pages/book-appointment/book-appointment.component';
import { PageNotFoundComponent } from './pages/page-not-found/page-not-found.component';

export const routes: Routes = [
    
    {path:'dashboard', component:DashboardComponent},
    {path:'', redirectTo:"/dashboard",pathMatch:'full'},
    {path:'allappointment', component:AllAppointementComponent},
    {path:'newappointement', component:BookAppointmentComponent},
    
    {path:'**', component:PageNotFoundComponent},
];
