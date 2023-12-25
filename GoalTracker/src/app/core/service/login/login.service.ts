import { Injectable } from '@angular/core';
import { environment } from '../../../../environments/environment.development';
import { GlobalService } from '../global.service';
import { Observable } from 'rxjs';
import { apiConstant } from '../../constant/apiConstant';

@Injectable({
  providedIn: 'root'
})
export class LoginService {
  apiStartPoint: String = environment.apiurl;

  constructor(private globalhttp: GlobalService) { }

  login(obj:any):Observable<any>{
    return this.globalhttp.post(apiConstant.login.login,obj)

  }
}
