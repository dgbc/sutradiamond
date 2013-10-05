//
//  DataViewController.h
//  SutraDiamond2
//
//  Created by Diego Costa on 5/23/13.
//  Copyright (c) 2013 omqal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) IBOutlet UITextView *dataText;
@property (strong, nonatomic) IBOutlet UIView *dataView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIToolbar *toolBar;
@property (strong, nonatomic) id dataObject;
@property (strong, nonatomic) id dataObjectContent;

@end
