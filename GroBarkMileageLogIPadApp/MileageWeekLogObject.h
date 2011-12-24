//
//  DispatchEntryObject.h
//  GroBarkMileageLogIPadApp
//
//  Created by Matt Ho on 11-12-22.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MileageWeekLogObject : NSObject {
    NSDate *weekStart;
    NSDate *weekEnd;
    NSInteger odometerWeekStart;
    NSInteger odometerWeekEnd;
    NSString *truckNumber;
    NSString *trailerNumber;
    NSString *name;
    NSArray *dispatchEntryArray;
}

@property (strong, nonatomic) NSDate *weekStart;
@property (strong, nonatomic) NSDate *weekEnd;
@property (nonatomic) NSInteger odometerWeekStart;
@property (nonatomic) NSInteger odometerWeekEnd;
@property (strong, nonatomic) NSString *truckNumber;
@property (strong, nonatomic) NSString *trailerNumber;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray *dispatchEntryArray;

@end
