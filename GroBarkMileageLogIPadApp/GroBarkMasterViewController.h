//
//  GroBarkMasterViewController.h
//  GroBarkMileageLogIPadApp
//
//  Created by Matt Ho on 11-12-17.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GroBarkDetailViewController;

<<<<<<< HEAD
@interface GroBarkMasterViewController : UITableViewController

@property (strong, nonatomic) GroBarkDetailViewController *detailViewController;
=======
@interface GroBarkMasterViewController : UITableViewController 
<UITableViewDelegate, UITableViewDataSource> {
    NSArray *mileageWeeks;
}

@property (strong, nonatomic) GroBarkDetailViewController *detailViewController;
@property (strong, nonatomic) NSArray *mileageWeeks;
>>>>>>> parent of 12484e1... messing around with git

@end
