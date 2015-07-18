//
//  AppDelegate.m
//  SODelegation(lesson9)
//
//  Created by Sergey on 07.07.15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "AppDelegate.h"
#import "SOPatient.h"
#import "SODoctor.h"
#import "SOBadDoctor.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    SODoctor *doctor = [SODoctor new];
    doctor.name = @"Professiaonal";
    
    SOBadDoctor *badDoctor = [SOBadDoctor new];
    badDoctor.name = @"No proffesional";
    
    NSArray *doctors = @[doctor, badDoctor];
    NSArray *names = @[@"Sergey", @"Alex", @"Sacha", @"Maxim", @"Andrey", @"Misha", @"Vova", @"Ilya", @"Sveta", @"Dasha", @"Josh", @"Bred", @"Rover", @"Garry", @"Alfred"];
    NSMutableArray *patients = [[NSMutableArray alloc] init];
        
    for (int i = 0; i < names.count; i++) {
        SOPatient *patient = [SOPatient new];
        patient.name = [names objectAtIndex:i];
        patient.gender = arc4random() % 2;
        patient.temperature = (arc4random() % 6 + 36.6);
        patient.delegate = [doctors objectAtIndex:arc4random() % 2];
        patient.bodyPart = arc4random() % 4 + 1;
        [patients addObject:patient];
    }
    
    NSLog(@"Begin day 1");
    
    for (SOPatient *currentPatient in patients) {
        [currentPatient becomeWorse];
    }
    
    [doctor printDayReport];
    [badDoctor printDayReport];
    
    NSLog(@"End day 1");
    
    for (SOPatient *currentPatient in patients) {
        if ([currentPatient doctorSatisfaction] == NO) {
            if ([currentPatient.delegate isKindOfClass:[SODoctor class]]) {
                currentPatient.delegate = badDoctor;
            } else {
                currentPatient.delegate = doctor;
            }
        }
    }
    
    for (int i = 0; i < doctors.count; i ++) {
        [[doctors objectAtIndex:i] createNewDay];
    }
    
    NSLog(@"Begin day 2");
    
    for (SOPatient *currentPatient in patients) {
        [currentPatient becomeWorse];
    }
    
    [doctor printDayReport];
    [badDoctor printDayReport];
    
    NSLog(@"End day 2");
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
