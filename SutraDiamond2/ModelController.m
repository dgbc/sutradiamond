//
//  ModelController.m
//  SutraDiamond2
//
//  Created by Diego Costa on 5/23/13.
//  Copyright (c) 2013 omqal. All rights reserved.
//

#import "ModelController.h"

#import "DataViewController.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

@interface ModelController()
@property (readonly, strong, nonatomic) NSArray *pageData;
@property (readonly, strong, nonatomic) NSArray *pageDataContent;
@end

@implementation ModelController

- (void)dealloc
{
    [_pageData release];
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        // Create the data model.
        //NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
        //_pageData = [[dateFormatter monthSymbols] copy];
        //NSLog(@"%@", _pageData);
        
        
         // OLD DATA
        /*
        NSString *strings[3];
        strings[0] = @"First";
        strings[1] = @"Second";
        strings[2] = @"Third";
        
        NSArray* pgData2 = [NSArray arrayWithObjects:strings count:3];
        _pageData = [pgData2 copy];
        //NSLog(@"%@",_pageData);
         */
        
        // Data.plist code
        NSBundle *thisBundle = [NSBundle mainBundle];
        //NSLog(@"src: %@", [thisBundle pathForResource:@"SutraText" ofType:@"plist"]);
        
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
        
        NSArray* content = [NSMutableArray arrayWithArray:[temp objectForKey:@"Content"]];
        _pageDataContent = [content copy];
                
    }
    return self;
}

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{
    //NSLog(@"%@",self.pageData);
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    DataViewController *dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"DataViewController"];
    dataViewController.dataObject = self.pageData[index];
    dataViewController.dataObjectContent = self.pageDataContent[index];
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(DataViewController *)viewController
{   
     // Return the index of the given data view controller.
     // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.pageData indexOfObject:viewController.dataObject];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

@end
