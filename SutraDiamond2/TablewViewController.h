//
//  TablewViewController.h
//  SutraDiamond2
//
//  Created by Diego Costa on 5/27/13.
//  Copyright (c) 2013 omqal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface TablewViewController : UITableViewController
@property (readonly, strong, nonatomic) NSArray *pageData;
@property (nonatomic) NSInteger selectedRow;
@end
