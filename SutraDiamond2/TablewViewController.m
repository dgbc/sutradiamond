//
//  TablewViewController.m
//  SutraDiamond2
//
//  Created by Diego Costa on 5/27/13.
//  Copyright (c) 2013 omqal. All rights reserved.
//

#import "TablewViewController.h"

@interface TablewViewController ()

@end

//@synthesize selectedRow;

@implementation TablewViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];

    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    

    NSBundle *thisBundle = [NSBundle mainBundle];
    NSString *plistPath = [thisBundle pathForResource:@"SutraText" ofType:@"plist"];
    
    
    // read property list into memory as an NSData object
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    // convert static property liost into dictionary object
    NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
    
    if (!temp)
    {
        NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
    }
    
    NSArray* titles = [NSMutableArray arrayWithArray:[temp objectForKey:@"Title"]];
    _pageData = [titles copy];
    
    
    self.title = @"The Sutra Diamond";
    UILabel* tlabel=[[UILabel alloc] initWithFrame:CGRectMake(0,0, 200, 40)];
    tlabel.text=self.navigationItem.title;
    tlabel.textColor=[UIColor whiteColor];
    tlabel.font = [UIFont fontWithName:@"SnellRoundhand-Bold" size: 32.0];
    tlabel.backgroundColor =[UIColor clearColor];
    tlabel.adjustsFontSizeToFitWidth=YES;
    self.navigationItem.titleView=tlabel;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_pageData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //[cell.textLabel setText:[NSString stringWithFormat:@"Row %i in Section %i", [indexPath row], [indexPath section]]];
    [cell.textLabel setText:[NSString stringWithFormat:@"%i. %@", [indexPath row]+1, [_pageData objectAtIndex:indexPath.row]]];
    
    [cell setFont:[UIFont fontWithName:@"Helvetica" size:18.0]];
    //cell.textLabel.text = @"ETC";
    // Configure the cell...
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return NO;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    
    /*
    RootViewController *detailViewController = [[RootViewController alloc] init];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    
    NSLog(@"init...? ");
     */
    
    //NSLog(@"init...? ");
    //[self performSegueWithIdentifier:@"TBV1" sender:self];
    //self.selectedRow = [indexPath row];
}

- (void)scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated {
    
}


- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    for (int i=1; i<=16; i++) {
        [tempArray addObject:[NSString stringWithFormat:@"%d",i*2]];
         
    }    
    return tempArray;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //NSLog(@"SEGUE2");
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    //NSLog(@"%d",path.row);
    
    if([segue.identifier isEqualToString:@"TBV1"])
    {
        
        //NSString *message = @"Tapped on home";
        RootViewController *vc = [segue destinationViewController];
        //vc.message = message;
        vc.selected_page = path.row;
        //NSLog(@"%d",  self.selectedRow);
        
        //NSLog(@"EE");
    }
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0],
      UITextAttributeTextColor,
      [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8],
      UITextAttributeTextShadowColor,
      [NSValue valueWithUIOffset:UIOffsetMake(0, -1)],
      UITextAttributeTextShadowOffset,
      [UIFont fontWithName:@"SnellRoundhand-Bold" size:25.0],
      UITextAttributeFont,
      nil]
     
     ];
//
//    NSString* titleText = self.navigationController.navigationItem.title;
//    UIFont* titleFont = [UIFont fontWithName:@"Helvetica" size:30];
//    CGSize requestedTitleSize = [titleText sizeWithFont:titleFont];
//    CGFloat titleWidth = MIN(30, requestedTitleSize.width);
    
  
    /*List fonts*/
//    NSMutableString *str = [NSMutableString stringWithCapacity:1000];
//    for (NSString *familyName in [UIFont familyNames]) {
//        [str appendFormat:@"%@\n", familyName];
//        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
//            [str appendFormat:@"    %@\n", fontName];
//        }
//        [str appendString:@"\n"];
//    }
//    NSLog(@"%@", str);
//
//    [UIColor blackColor], UITextAttributeTextColor,
//    [UIFont fontWithName:@"Snell Roundhand Bold" size:23.0], UITextAttributeFont,nil]
//
}

@end
