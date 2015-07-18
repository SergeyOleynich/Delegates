//
//  SOBadDoctor.m
//  SODelegation(lesson9)
//
//  Created by Sergey on 07.07.15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "SOBadDoctor.h"

@interface SOBadDoctor ()

@property (strong, nonatomic) NSMutableArray *report;

@end

@implementation SOBadDoctor

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
    
    NSLog(@"Bad Doctor report:");
    
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
    NSLog(@"Patient %@ drunk beer", patient.name);
}

@end
