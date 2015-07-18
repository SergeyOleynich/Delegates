//
//  SOPatient.m
//  SODelegation(lesson9)
//
//  Created by Sergey on 07.07.15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "SOPatient.h"

@implementation SOPatient

-(void)becomeWorse {
    if (self.delegate && [self.delegate respondsToSelector:@selector(callDoctor:)]) {
        self.doctorSatisfaction = arc4random() % 2;
        [self.delegate callDoctor:self];
    }
}

- (void)takePill {
    NSLog(@"Patient %@ takes pill", self.name);
}

- (void)makeShot {
    NSLog(@"Patient %@ makes shot", self.name);
}

- (void)waitForAmbulance {
    NSLog(@"Patient %@ wait for ambulance", self.name);
}

- (void)layPatientAndLiftHisLegs {
    NSLog(@"Patient %@ lays and lifts his legs", self.name);
}

- (void)drinkDecoctionOfHerbs {
    NSLog(@"Patient %@ drinks decoction of herbs", self.name);
}

@end
