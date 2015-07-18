//
//  SOBadDoctor.h
//  SODelegation(lesson9)
//
//  Created by Sergey on 07.07.15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SOPatient.h"

@interface SOBadDoctor : NSObject <SOPatientDelegate>

@property (strong, nonatomic) NSString *name;

- (void)printDayReport;
- (void)createNewDay;

@end
