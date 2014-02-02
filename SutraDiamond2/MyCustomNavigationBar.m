//
//  MyCustomNavigationBar.m
//  SutraDiamond2
//
//  Created by Diego Costa on 10/4/13.
//  Copyright (c) 2013 omqal. All rights reserved.
//

#import "MyCustomNavigationBar.h"

@implementation MyCustomNavigationBar

- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed: @"NavBar-Cardboard.png"];
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    

}

@end
