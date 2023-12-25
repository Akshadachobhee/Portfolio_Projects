import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [FormsModule,CommonModule],
  templateUrl: './dashboard.component.html',
  styleUrl: './dashboard.component.css'
})
export class DashboardComponent {
constructor(private router:Router){}


onClickAttendance()
{
  this.router.navigateByUrl('/attendance');
}
onClickSalary()
{
 this.router.navigateByUrl('/salary');
}
onClickLeaves()
{
  this.router.navigateByUrl('/leaves');
}
}
