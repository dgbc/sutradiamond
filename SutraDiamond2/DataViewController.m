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
    
     NSString *someHtmlContent = [NSString stringWithFormat:@"<html><head><style type=\"text/css\">body {padding: 0px; margin: 0px; }</style><script src=\"yourLocalJsFile.js\"></script></head><body>%@<strong>%@</strong></body></html>", @"Hello", @"Hello2"];
     
     NSLog(@"HTML with code: \n%@", someHtmlContent);
    
     NSString *resourcePath = [[[[NSBundle mainBundle] resourcePath]
     stringByReplacingOccurrencesOfString:@"/" withString:@"//"]
     stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
     
     [self.webView loadHTMLString:someHtmlContent baseURL:[NSURL URLWithString:
     [NSString stringWithFormat:@"file:/%@//", resourcePath]]];
     
     //[self.webView setDelegate:self];

}

@end
