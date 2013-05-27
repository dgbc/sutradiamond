//
//  DataViewController.m
//  SutraDiamond2
//
//  Created by Diego Costa on 5/23/13.
//  Copyright (c) 2013 omqal. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()

@end

@implementation DataViewController

- (void)dealloc
{
    [_dataLabel release];
    [_dataObject release];
    [_dataObjectContent release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    /*
    NSURL *imgUrl=[[NSURL alloc] initWithString:@"http://img835.imageshack.us/img835/9794/screenshot20110802at345.png"];
    NSData *imgData = [NSData dataWithContentsOfURL:imgUrl];
    UIImage *img = [UIImage imageWithData:imgData];
    
    
    [self.imageView setImage:img];
    [self.dataView addSubview:self.imageView ];
    [self.dataView sendSubviewToBack:self.imageView ];
    
    //[self.imageView release]; [imgUrl release];
     */
    //NSLog(@"viewDidLoad");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
    self.dataText.text = [self.dataObjectContent description];
}

@end
