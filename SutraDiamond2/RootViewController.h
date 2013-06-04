//
//  RootViewController.h
//  SutraDiamond2
//
//  Created by Diego Costa on 5/23/13.
//  Copyright (c) 2013 omqal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) IBOutlet UINavigationItem *navigationItem2;
//@property (strong, nonatomic) NSString *message;
@property (nonatomic) NSInteger selected_page;

@end
