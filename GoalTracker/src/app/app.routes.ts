import { Routes } from '@angular/router';
import { GoalComponent} from './pages/goal/goal.component';
import { CategoryComponent} from './pages/category/category.component';
import { LoginComponent } from './pages/login/login.component';

export const routes: Routes = [
    {path: '', redirectTo: 'home', pathMatch:'full'},
    {path: 'addgoal', component: GoalComponent},
    {path: 'category', component: CategoryComponent},
    {path: 'login', component: LoginComponent},
];
