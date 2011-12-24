//
//  DispatchEntryObject.h
//  GroBarkMileageLogIPadApp
//
//  Created by Matt Ho on 11-12-22.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDateTag 1
#define kOriginTag 2
#define kDestinationTag 3
#define kProductTag 4
#define kQuantityTag 5
#define kBolPickUpTag 6
#define kBolDropOffTag 7
#define kDailyMileageONTag 8
#define kDailyMileageQBTag 9
#define kB_HTag 10

@interface DispatchEntryObject : NSObject {
    NSDate *date;
    NSString *origin;
    NSString *destination;
    NSString *product;
    NSString *quantity;
    NSString *bolPickUpLoc;
    NSString *bolDropOffLoc;
    NSInteger dailyMileageON;
    NSInteger dailyMileageQC;
    Boolean b_h;
}

@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSString *origin;
@property (strong, nonatomic) NSString *destination;
@property (strong, nonatomic) NSString *product;
@property (strong, nonatomic) NSString *quantity;
@property (strong, nonatomic) NSString *bolPickUpLoc;
@property (strong, nonatomic) NSString *bolDropOffLoc;
@property (nonatomic) NSInteger dailyMileageON;
@property (nonatomic) NSInteger dailyMileageQC;
@property (nonatomic) Boolean b_h;

@end
