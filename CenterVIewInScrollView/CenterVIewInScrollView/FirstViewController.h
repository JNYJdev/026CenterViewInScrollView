//
//  FirstViewController.h
//  CenterVIewInScrollView
//
//  Created by William on 23/3/15.
//  Copyright (c) 2015 William. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (nonatomic, strong) UIScrollView  *scrollViewContents;
@property (nonatomic, strong) UIButton      *button_i;
@property (nonatomic, strong) UIButton      *button_ii;
@property (nonatomic, strong) UIButton      *button_iii;
@property (nonatomic, strong) UIButton      *button_iv;
@property (nonatomic, strong) UIButton      *button_v;


@end


@interface UIView (CenterViewInScrollView)
-(void)centerViewInScrollView:(UIScrollView *)scrollView;
@end

