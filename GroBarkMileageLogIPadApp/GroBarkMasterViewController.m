//
//  GroBarkMasterViewController.m
//  GroBarkMileageLogIPadApp
//
//  Created by Matt Ho on 11-12-17.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GroBarkMasterViewController.h"

#import "GroBarkDetailViewController.h"

#import "MileageWeekLogObject.h"

#import "DispatchEntryObject.h"

@implementation GroBarkMasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize mileageWeeks;
@synthesize mileageWeekLogObjects;

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
    
    NSInteger numDates = 12;
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
    
    MileageWeekLogObject *mwo1 = [[MileageWeekLogObject alloc] init];
    mwo1.odometerWeekStart = 12345;
    mwo1.odometerWeekEnd = 12890;
    mwo1.weekStart = [[NSDate alloc] init];
    mwo1.truckNumber = @"123";
    mwo1.trailerNumber = @"0-002";
    mwo1.name = @"Bob Marley";
    
    DispatchEntryObject *deo1 = [[DispatchEntryObject alloc] init];
    deo1.date = [[NSDate alloc] initWithTimeIntervalSince1970:1307268001];
    deo1.origin = @"Seasme St.";
    deo1.destination = @"Mars";
    deo1.product = @"Real Steel";
    deo1.quantity = @"100 kg";
    deo1.bolPickUpLoc = @"123n3id";
    deo1.bolDropOffLoc = @"532in3i";
    deo1.dailyMileageON = 11;
    deo1.dailyMileageQC = 12;
    deo1.b_h = NO;
    
    DispatchEntryObject *deo2 = [[DispatchEntryObject alloc] init];
    deo2.date = [[NSDate alloc] initWithTimeIntervalSince1970:1307268001];
    deo2.origin = @"Waterloo";
    deo2.destination = @"Jupiter";
    deo2.product = @"Magic Boomboxes";
    deo2.quantity = @"100 units";
    deo2.bolPickUpLoc = @"23939n";
    deo2.bolDropOffLoc = @"32k3n";
    deo2.dailyMileageON = 123;
    deo2.dailyMileageQC = 321;
    deo2.b_h = YES;
    
    mwo1.dispatchEntryArray = [[NSArray alloc] initWithObjects:deo1, deo2, nil];
    
    MileageWeekLogObject *mwo2 = [[MileageWeekLogObject alloc] init];
    mwo2.odometerWeekStart = 22345;
    mwo2.odometerWeekEnd = 24679;
    mwo2.weekStart = sunday_june_5_2011;
    mwo2.truckNumber = @"456";
    mwo2.trailerNumber = @"0-015";
    mwo2.name = @"John Dylan";
    
    DispatchEntryObject *deo3 = [[DispatchEntryObject alloc] init];
    deo3.date = [[NSDate alloc] initWithTimeIntervalSince1970:1307268001];
    deo3.origin = @"Dylan's House";
    deo3.destination = @"Microsoft";
    deo3.product = @"CDs";
    deo3.quantity = @"99.9 kg";
    deo3.bolPickUpLoc = @"230n30";
    deo3.bolDropOffLoc = @"239j39";
    deo3.dailyMileageON = 938;
    deo3.dailyMileageQC = 45;
    deo3.b_h = YES;
    
    DispatchEntryObject *deo4 = [[DispatchEntryObject alloc] init];
    deo4.date = [[NSDate alloc] initWithTimeIntervalSince1970:1307268001];
    deo4.origin = @"Vancouver";
    deo4.destination = @"Shanghai";
    deo4.product = @"Robots";
    deo4.quantity = @"2 units";
    deo4.bolPickUpLoc = @"23n38";
    deo4.bolDropOffLoc = @"23993n";
    deo4.dailyMileageON = 23;
    deo4.dailyMileageQC = 312;
    deo4.b_h = NO;
    
    mwo2.dispatchEntryArray = [[NSArray alloc] initWithObjects:deo3, deo4, nil];
    
    self.mileageWeekLogObjects = [[NSArray alloc] initWithObjects:mwo1, mwo2, mwo1, mwo2, mwo1, mwo2, nil];
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

#pragma mark -
#pragma mark Table Delegate Methods
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSUInteger row = [indexPath row];
//    NSString *shortMonth = [[self.mileageWeeks objectAtIndex:row] substringWithRange:NSMakeRange(0,3)];
//    self.detailViewController.monthLabel.text = shortMonth;
    
    NSUInteger row = [indexPath row];
    MileageWeekLogObject *mwlo = [self.mileageWeekLogObjects objectAtIndex:row];
    
    self.detailViewController.mileageWeekLogObject = mwlo;
    self.detailViewController.odometerWeekStartTextField.text = [NSString stringWithFormat:@"%d", mwlo.odometerWeekStart];
    self.detailViewController.odometerWeekEndTextField.text = [NSString stringWithFormat:@"%d", mwlo.odometerWeekEnd];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    self.detailViewController.monthLabel.text = [[dateFormatter stringFromDate:mwlo.weekStart] substringWithRange:NSMakeRange(0,3)];
    self.detailViewController.truckNumberLabel.text = mwlo.truckNumber;
    self.detailViewController.trailerNumberLabel.text = mwlo.trailerNumber;
    self.detailViewController.nameLabel.text = mwlo.name;
    
    [self.detailViewController.dispatchEntryTable reloadData];
    
//    self.detailViewController.detailItem = shortMonth;
//    President *prez = [self.list objectAtIndex:row];
//    PresidentDetailController *childController = [[PresidentDetailController alloc] initWithStyle:UITableViewStyleGrouped];
//    childController.title = prez.name; 
//    childController.president = prez;
//    [self.navigationController pushViewController:childController animated:YES];
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
