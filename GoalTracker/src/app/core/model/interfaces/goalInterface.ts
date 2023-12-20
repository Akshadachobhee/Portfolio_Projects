export interface IGoal{
    goalId: number;
    userId: number;
    goalTitle: string;
    goalDescription: string;
    goalStartDate: string ;
    goalExpectedEndDate: string;
    goalCategoryId: number;
    isCompleted: boolean
    GoalMileStones: [ ]
}