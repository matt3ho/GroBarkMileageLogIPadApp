//
//  RoundedRectLabel.m
//  GroBarkMileageLogIPadApp
//
//  Created by Matt Ho on 11-12-23.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "RoundedRectLabel.h"

#import <QuartzCore/QuartzCore.h>

@implementation RoundedRectLabel

@synthesize label;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//}

@end
