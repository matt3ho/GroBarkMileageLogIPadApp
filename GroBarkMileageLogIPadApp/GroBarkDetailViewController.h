//
//  GroBarkDetailViewController.h
//  GroBarkMileageLogIPadApp
//
//  Created by Matt Ho on 11-12-17.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroBarkDetailViewController : UIViewController <UISplitViewControllerDelegate, UITableViewDelegate, UITableViewDataSource> {
    NSString *month;
    
    UITableViewCell *tvCell;
}

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (strong, nonatomic) NSString *month;
@property (strong, nonatomic) IBOutlet UILabel *monthLabel;

@property (strong, nonatomic) IBOutlet UITableViewCell *tvCell;

- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)backgroundTap:(id)sender;

@end
