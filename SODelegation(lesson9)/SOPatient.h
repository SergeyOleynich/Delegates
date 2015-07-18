//
//  SOPatient.h
//  SODelegation(lesson9)
//
//  Created by Sergey on 07.07.15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SOPatientGender) {
    SOPatientGenderMale = 1,
    SOPatientGenderFemale = 2
};

@protocol SOPatientDelegate;

@interface SOPatient : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) SOPatientGender gender;
@property (assign, nonatomic) NSUInteger age;
@property (assign, nonatomic) CGFloat temperature;
@property (assign, nonatomic) NSUInteger minPressure;
@property (assign, nonatomic) NSUInteger maxPressure;
@property (assign, nonatomic) NSUInteger pulse;
@property (assign, nonatomic) BOOL nausea;//тошнота
@property (weak, nonatomic) id <SOPatientDelegate> delegate;
@property (assign, nonatomic) NSUInteger bodyPart;
@property (assign, nonatomic) BOOL doctorSatisfaction;

- (void)becomeWorse;
- (void)takePill;
- (void)makeShot;
- (void)waitForAmbulance;
- (void)layPatientAndLiftHisLegs;
- (void)drinkDecoctionOfHerbs;

@end

@protocol SOPatientDelegate <NSObject>

typedef NS_ENUM(NSUInteger, SOPatientBodyPart) {
    SOPatientBodyPartHead = 1,
    SOPatientBodyPartArm = 2,
    SOPatientBodyPartLeg = 3,
    SOPatientBodyPartHeart = 4
};

- (void)callDoctor:(SOPatient *)patient;

@end
