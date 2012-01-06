//
//  GroBarkDetailViewController.h
//  GroBarkMileageLogIPadApp
//
//  Created by Matt Ho on 11-12-17.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MileageWeekLogObject.h"

@interface GroBarkDetailViewController : UIViewController <UISplitViewControllerDelegate, UITableViewDelegate, UITableViewDataSource> {
    
    UITableView *dispatchEntryTable;
    UITableViewCell *dispatchEntryCell;
    MileageWeekLogObject *mileageWeekLogObject;
}

//@property (strong, nonatomic) id detailItem;
//@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
//@property (strong, nonatomic) NSString *month;
//@property (strong, nonatomic) IBOutlet UILabel *monthLabel;
//@property (strong, nonatomic) IBOutlet UIView *testLabel;

@property (strong, nonatomic) IBOutlet UITableView *dispatchEntryTable;
@property (strong, nonatomic) IBOutlet UITableViewCell *dispatchEntryCell;
@property (strong, nonatomic) MileageWeekLogObject *mileageWeekLogObject;

@property (strong, nonatomic) IBOutlet UITextField *odometerWeekStartTextField;
@property (strong, nonatomic) IBOutlet UITextField *odometerWeekEndTextField;
@property (strong, nonatomic) IBOutlet UILabel *monthLabel;
@property (strong, nonatomic) IBOutlet UILabel *truckNumberLabel;
@property (strong, nonatomic) IBOutlet UILabel *trailerNumberLabel;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)backgroundTap:(id)sender;

@end
