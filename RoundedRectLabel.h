//
//  RoundedRectLabel.h
//  GroBarkMileageLogIPadApp
//
//  Created by Matt Ho on 11-12-23.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoundedRectLabel : UIView {
    UILabel *label;
}

@property (strong, nonatomic) IBOutlet UILabel *label;

@end
