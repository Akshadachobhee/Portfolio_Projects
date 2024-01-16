import { Component } from '@angular/core';
import { MasterService } from '../../service/master.service';
import { FormsModule } from '@angular/forms';
import { error } from 'console';

@Component({
  selector: 'app-book-appointment',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './book-appointment.component.html',
  styleUrl: './book-appointment.component.css'
})
export class BookAppointmentComponent {

  appointmentObj: any = {
    "name": "",
    "mobileNo": "",
    "city": "",
    "age": 0,
    "gender": "",
    "appointmentDate": "2024-01-03T07:36:40.934Z",
    "appointmentTime": "",
    "isFirstVisit": true,
    "naration": ""

  };

  constructor(private master: MasterService) { }


  OnSaveAppointment() {
    this.master.createNew(this.appointmentObj).subscribe((res: any) => {
      if (res.result) {
        alert("Appointment Done")

      }
    }, error => {
      alert("API Error/ Check Form")
    })
  }




}
