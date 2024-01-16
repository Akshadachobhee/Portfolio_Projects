import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { error } from 'console';
import { Observable, catchError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class MasterService {
  constructor(private http: HttpClient){}

apiEndPoint: string ="https://freeapi.miniprojectideas.com/api/HospitalAppointment/AddNewAppointment"

  createNew(obj:any): Observable<any>
  {
    return this.http.post(this.apiEndPoint + "AddNewAppointment",obj)
  }

}