import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment.development';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class GlobalService {

  apiStartPoint: String = environment.apiurl;
  constructor(private http: HttpClient) { }

  get(method: string): Observable<any>{
    return this.http.get(this.apiStartPoint + method);
  }

  post(method: string, obj:any): Observable<any>{
    return this.http.post(this.apiStartPoint + method, obj);
  }

  put(method: string, obj: any): Observable<any> {
    return this.http.put(this.apiStartPoint + method, obj);
  }

  delete(method: string): Observable<any> {
    return this.http.delete(this.apiStartPoint + method);
  }
}
