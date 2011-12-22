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

@end
