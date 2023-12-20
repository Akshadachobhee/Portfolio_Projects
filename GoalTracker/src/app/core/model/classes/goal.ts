export class goal{
    goalId: number;
    userId: number;
    goalTitle: string;
    goalDescription: string;
    goalStartDate: string ;
    goalExpectedEndDate: string;
    goalCategoryId: number;
    isCompleted: boolean
    GoalMileStones: [ ]

    constructor(){
        this.goalId= 0;
        this.userId= 0;
        this.goalTitle= '';
        this.goalDescription= '';
        this.goalStartDate= "023-12-14T15:26:39.783Z" ;
        this.goalExpectedEndDate= "2023-12-14T15:26:39.783Z" ;
        this.goalCategoryId= 0;
        this.isCompleted= true
        this.GoalMileStones= []
    }
  }