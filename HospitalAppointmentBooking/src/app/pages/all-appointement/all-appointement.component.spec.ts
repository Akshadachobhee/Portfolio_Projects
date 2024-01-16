import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AllAppointementComponent } from './all-appointement.component';

describe('AllAppointementComponent', () => {
  let component: AllAppointementComponent;
  let fixture: ComponentFixture<AllAppointementComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AllAppointementComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(AllAppointementComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
