import { Injectable } from '@angular/core';
import { environment } from '../../../../environments/environment.development';
import { GlobalService } from '../global.service';

@Injectable({
  providedIn: 'root'
})
export class GoalsService {

  apiStartPoint: String= environment.apiurl;

  constructor(private globalhttp: GlobalService) { }
  getAllGoalById(): Observable<any> {
    return this.globalhttp.get(
        APIConstant.goalEndPoint.getGoalById
    );
  }
}
