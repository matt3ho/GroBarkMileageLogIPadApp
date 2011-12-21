//
//  GroBarkMasterViewController.m
//  GroBarkMileageLogIPadApp
//
//  Created by Matt Ho on 11-12-17.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GroBarkMasterViewController.h"

#import "GroBarkDetailViewController.h"

@implementation GroBarkMasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize mileageWeeks;

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.detailViewController = (GroBarkDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
    
    NSInteger numDates = 50;
    NSMutableArray *initialDates = [[NSMutableArray alloc] initWithCapacity:numDates];
    NSDate *sunday_june_5_2011 = [[NSDate alloc] initWithTimeIntervalSince1970:1307268001];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    for (int i = 0; i < numDates; i++) {
        NSDateComponents *component = [[NSDateComponents alloc] init ];
        if (0 == i % 2) {
            [component setDay: i*7 ];
        }
        else {
            [component setDay: i*7-1 ];
        }
        
        [ initialDates addObject: [gregorian dateByAddingComponents:component toDate:sunday_june_5_2011 options:0] ];
    }
    
    NSMutableArray *mileageWeeksStrings = [[NSMutableArray alloc] initWithCapacity:numDates/2];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [ dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    for (int i = 0; i < numDates; i++)
    {
        if (0 == i % 2) {
            [mileageWeeksStrings addObject: [dateFormatter stringFromDate:[initialDates objectAtIndex:i]]];
        }
        else {
            NSString *weekRangeString = [mileageWeeksStrings objectAtIndex:i/2];
            [mileageWeeksStrings replaceObjectAtIndex:i/2 withObject: [[weekRangeString stringByAppendingString: @" - "] stringByAppendingString:[dateFormatter stringFromDate: [initialDates objectAtIndex:i ]]]];
        }
    }
    
    self.mileageWeeks = mileageWeeksStrings;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.mileageWeeks = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [self.mileageWeeks count]; 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
    }
    NSUInteger row = [indexPath row]; 
    cell.textLabel.text = [mileageWeeks objectAtIndex:row];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
