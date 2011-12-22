//
//  DispatchEntryObject.h
//  GroBarkMileageLogIPadApp
//
//  Created by Matt Ho on 11-12-22.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

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

@end
