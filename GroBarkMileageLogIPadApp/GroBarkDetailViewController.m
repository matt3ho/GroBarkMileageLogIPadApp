//
//  GroBarkDetailViewController.m
//  GroBarkMileageLogIPadApp
//
//  Created by Matt Ho on 11-12-17.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GroBarkDetailViewController.h"

@interface GroBarkDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation GroBarkDetailViewController

@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize masterPopoverController = _masterPopoverController;
@synthesize month;
@synthesize monthLabel;

@synthesize tvCell;

- (IBAction)textFieldDoneEditing:(id)sender { 
    [sender resignFirstResponder];
}

- (IBAction)backgroundTap:(id)sender { 
//    [nameField resignFirstResponder]; 
//    [numberField resignFirstResponder];
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
//        monthLabel.text = self.detailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return 4; 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *DispatchEntryCellIdentifier = @"DispatchEntryCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: DispatchEntryCellIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DispatchEntryCell"
                                                     owner:self options:nil];
        if ([nib count] > 0) { 
            cell = self.tvCell;
        } else {
            NSLog(@"failed to load CustomCell nib file!");
        }
    }
//    NSUInteger row = [indexPath row];
//    NSDictionary *rowData = [self.computers objectAtIndex:row];
//    UILabel *colorLabel = (UILabel *)[cell viewWithTag:kNameValueTag]; colorLabel.text = [rowData objectForKey:@"Color"];
//    UILabel *nameLabel = (UILabel *)[cell viewWithTag:kColorValueTag]; nameLabel.text = [rowData objectForKey:@"Name"];
    return cell;
}

#pragma mark -
#pragma mark Table Delegate Methods
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSUInteger row = [indexPath row];
//    NSString *shortMonth = [[self.mileageWeeks objectAtIndex:row] substringWithRange:NSMakeRange(0,3)];
//    self.detailViewController.monthLabel.text = shortMonth;
//    //    self.detailViewController.detailItem = shortMonth;
//    //    President *prez = [self.list objectAtIndex:row];
//    //    PresidentDetailController *childController = [[PresidentDetailController alloc] initWithStyle:UITableViewStyleGrouped];
//    //    childController.title = prez.name; 
//    //    childController.president = prez;
//    //    [self.navigationController pushViewController:childController animated:YES];
}

@end
