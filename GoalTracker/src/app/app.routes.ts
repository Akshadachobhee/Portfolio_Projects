import { Routes } from '@angular/router';
import { GoalComponent} from './pages/goal/goal.component';
import { CategoryComponent} from './pages/category/category.component';
export const routes: Routes = [
    {path: ''},
    {path: 'addgoal', component: GoalComponent},
    {path: 'category', component: GoalComponent},
];
