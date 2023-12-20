import { Injectable } from '@angular/core';
import { environment } from '../../../../environments/environment.development';
import { GlobalService } from '../global.service';
import { Observable } from 'rxjs';
import { apiConstant } from '../../constant/apiConstant';
@Injectable({
  providedIn: 'root'
})
export class CategoriesService {

  apiStartPoint: String = environment.apiurl;

  constructor(private globalhttp:GlobalService) { }
  
  getAllCategory(): Observable<any> {
    return this.globalhttp.get( apiConstant.categoriesEndPoint.GetAllCategories);
  }

  addBulkCategory(obj:any): Observable<any> {
    return this.globalhttp.post( apiConstant.categoriesEndPoint.AddBulkCategories,obj);
  }

  deleteCategoryById(): Observable<any> {
    return this.globalhttp.get( apiConstant.categoriesEndPoint.DeleteCategoryById);
  }
}
