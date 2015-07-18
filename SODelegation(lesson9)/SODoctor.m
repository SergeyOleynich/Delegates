//
//  SODoctor.m
//  SODelegation(lesson9)
//
//  Created by Sergey on 07.07.15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "SODoctor.h"

@interface SODoctor ()

@property (strong, nonatomic) NSMutableArray *report;

@end

@implementation SODoctor

- (void)createNewDay {
    [self.report removeAllObjects];
}

-(void)printDayReport {
    
    NSArray *finishReport = [self.report sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
        if ([(SOPatient *)obj1 bodyPart] < [(SOPatient *)obj2 bodyPart]) {
            return NSOrderedAscending;
        }
        
        if ([(SOPatient *)obj1 bodyPart] > [(SOPatient *)obj2 bodyPart]) {
            return NSOrderedDescending;
        }
        
        return NSOrderedSame;
    }];
    
    NSLog(@"Good doctor report:");
    for (SOPatient *currentPatient in finishReport) {
        NSLog(@"Patient: %@, years old %lu, has doctor: %@, has temperature: %f, pressure: %lu / %lu, has problem with: %lu", currentPatient.name, (unsigned long)currentPatient.age, [currentPatient.delegate performSelector:@selector(name)], currentPatient.temperature, (unsigned long)currentPatient.minPressure, (unsigned long)currentPatient.maxPressure, (unsigned long)currentPatient.bodyPart);
    }
}

#pragma mark - getters

-(NSMutableArray *)report {
    if (!_report) {
        _report = [[NSMutableArray alloc] init];
    }
    return _report;
}

#pragma mark - SOPatientDelegate

-(void)callDoctor:(SOPatient *)patient {
    
    [self.report addObject:patient];
    
    [self takeTemperature:patient];
    [self takePressure:patient];

}

- (void)takeTemperature:(SOPatient *)patient {
    if (patient.temperature >= 37.f && patient.temperature <= 38.5f) {
        [patient takePill];
    } else if (patient.temperature > 38.5 && patient.temperature <= 39.5f) {
        [patient makeShot];
    } else if (patient.temperature > 39.5f) {
        [patient waitForAmbulance];
    } else {
        NSLog(@"Patient %@ pretends", patient.name);
    }
}

- (void)takePressure:(SOPatient *)patient {
    if (patient.age >= 16 && patient.age <= 20) {
        if (patient.gender == SOPatientGenderMale) {
            if (patient.maxPressure <= 110 && patient.minPressure <= 70) {
                [patient layPatientAndLiftHisLegs];
            }
            if (patient.maxPressure >= 130 && patient.minPressure >= 90) {
                [patient drinkDecoctionOfHerbs];
            }
        } else {
            if (patient.maxPressure <= 90 && patient.minPressure <= 60) {
                [patient layPatientAndLiftHisLegs];
            }
            if (patient.maxPressure >= 110 && patient.minPressure >= 80) {
                [patient drinkDecoctionOfHerbs];
            }
        }
    } else if (patient.age > 20 && patient.age <= 40) {
        if (patient.gender == SOPatientGenderMale) {
            if (patient.maxPressure <= 120 && patient.minPressure <= 70) {
                [patient layPatientAndLiftHisLegs];
            }
            if (patient.maxPressure >= 140 && patient.minPressure >= 80) {
                [patient drinkDecoctionOfHerbs];
            }
        } else {
            if (patient.maxPressure <= 110 && patient.minPressure <= 60) {
                [patient layPatientAndLiftHisLegs];
            }
            if (patient.maxPressure >= 130 && patient.minPressure >= 80) {
                [patient drinkDecoctionOfHerbs];
            }
        }
    } else if (patient.age > 40 && patient.age <= 60) {
        if (patient.maxPressure <= 130 && patient.minPressure <= 80) {
            [patient layPatientAndLiftHisLegs];
        }
        if (patient.maxPressure >= 150 && patient.minPressure >= 100) {
            [patient drinkDecoctionOfHerbs];
        }
    } else if (patient.age > 60) {
        if (patient.maxPressure <= 140 && patient.minPressure <= 80) {
            [patient layPatientAndLiftHisLegs];
        }
        if (patient.maxPressure >= 160 && patient.minPressure >= 100) {
            [patient drinkDecoctionOfHerbs];
        }
    }
}

@end








