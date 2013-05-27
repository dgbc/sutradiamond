//
//  NavigationViewController.m
//  SutraDiamond2
//
//  Created by Diego Costa on 5/27/13.
//  Copyright (c) 2013 omqal. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    NSLog(@"SEGUE1!!");
//    if([segue.identifier isEqualToString:@"TBV1"])
//    {
//        /*
//         NSString *message = @"Tapped on home";
//         ViewController2 *vc = [segue destinationViewController];
//         vc.labelString = message;
//         */
//        NSLog(@"EE");
//    }
//}

@end
