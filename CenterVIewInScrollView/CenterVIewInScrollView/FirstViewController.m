//
//  FirstViewController.m
//  CenterVIewInScrollView
//
//  Created by William on 23/3/15.
//  Copyright (c) 2015 William. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //
    
    UIScrollView *scrolView_ = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, 320, 400)];
    self.scrollViewContents = scrolView_;
    scrolView_.showsVerticalScrollIndicator = YES;
    [self.view addSubview:scrolView_];
    [scrolView_ setContentSize:CGSizeMake(320, 2000)];
    [scrolView_ setBackgroundColor:[UIColor redColor]];
    UIView *view_ = [[UIView alloc] initWithFrame:CGRectMake(100, 1200, 100, 50)];
    [scrolView_ addSubview:view_];
    UIButton *button_ = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [view_ addSubview:button_];
    [button_ setBackgroundColor:[UIColor yellowColor]];
    [button_ addTarget:self action:@selector(event_click:) forControlEvents:UIControlEventTouchUpInside];
    self.button_i = button_;
    
    CGRect rect_convert = [self.view convertRect:button_.frame toView:scrolView_];
    rect_convert = [scrolView_ convertRect:button_.frame toView:scrolView_];
    
    button_ = [[UIButton alloc] initWithFrame:CGRectMake(100, 150, 100, 50)];
    [scrolView_ addSubview:button_];
    [button_ setBackgroundColor:[UIColor purpleColor]];
    [button_ addTarget:self action:@selector(event_click:) forControlEvents:UIControlEventTouchUpInside];
    self.button_ii = button_;
    
    rect_convert = [self.view convertRect:button_.frame toView:scrolView_];
    rect_convert = [scrolView_ convertRect:button_.frame toView:scrolView_];
    
    button_ = [[UIButton alloc] initWithFrame:CGRectMake(100, 198, 100, 50)];
    [scrolView_ addSubview:button_];
    [button_ setBackgroundColor:[UIColor blackColor]];
    [button_ addTarget:self action:@selector(event_click:) forControlEvents:UIControlEventTouchUpInside];
    self.button_iii = button_;
    
    rect_convert = [button_ convertRect:button_.frame fromView:scrolView_];
    
    button_ = [[UIButton alloc] initWithFrame:CGRectMake(100, 1000, 100, 50)];
    [scrolView_ addSubview:button_];
    [button_ setBackgroundColor:[UIColor blueColor]];
    [button_ addTarget:self action:@selector(event_click:) forControlEvents:UIControlEventTouchUpInside];
    
    self.button_iv = button_;
    
    rect_convert = [button_ convertRect:button_.frame fromView:scrolView_];
    
    button_ = [[UIButton alloc] initWithFrame:CGRectMake(100, 1800, 100, 50)];
    [scrolView_ addSubview:button_];
    [button_ setBackgroundColor:[UIColor brownColor]];
    [button_ addTarget:self action:@selector(event_click:) forControlEvents:UIControlEventTouchUpInside];
    
    self.button_v = button_;
    
    rect_convert = [button_ convertRect:button_.frame fromView:scrolView_];
    
    
    
    //
}
-(void)event_click:(id)sender{
    UIButton *button_ = (UIButton *)sender;
    if (button_ && [button_ isKindOfClass:[UIButton class]]) {
        [button_ centerViewInScrollView:self.scrollViewContents];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@implementation UIView (CenterViewInScrollView)
-(void)autoDisplayViewInScrollView:(UIScrollView *)scrollView{
    
//    UITextField *textField_ =  (UITextField *)self;
//    CGRect rect_t = textField_.frame;
//    CGRect rect_s = scrollView.frame;
//    CGFloat float_height_offset  = (rect_s.size.height/2.0);
//    CGPoint point_t = [textField_ convertPoint:rect_t.origin toView:scrollView];
//    CGPoint point_offset;
//    if (point_t.y > float_height_offset) {
//        point_offset = CGPointMake(0, (point_t.y-float_height_offset));
//        [scrollView setContentOffset:point_offset animated:YES];
//    }else{
//        [scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
//    }
}
-(void)centerViewInScrollView:(UIScrollView *)scrollView{
    
    UIView *view_ =  (UIView *)self;
    UIView *view_superView_ = [view_ superview];
    //
    CGRect rect_t = view_.frame;
    CGRect rect_s = scrollView.frame;
    //
    CGFloat float_height_center  = (rect_s.size.height/2.0);
    
    //Convert view rect, need make sure this conditions
    if (view_superView_ && view_superView_ != scrollView) {
        //
        CGRect rect_convert = [view_superView_ convertRect:rect_t toView:scrollView];
        CGPoint point_center;
        //Assert it, who need to auto move to the center
        if (float_height_center>=rect_convert.origin.y) {//No need
            point_center = CGPointMake(0, 0);
            [scrollView setContentOffset:point_center animated:YES];
        }else{//Need
            //Counting off set point.y for view
            CGFloat float_center_offset = rect_convert.origin.y-float_height_center+(rect_t.size.height/2.0);
            point_center = CGPointMake(0, float_center_offset);
            [scrollView setContentOffset:point_center animated:YES];
        }
    }else{
        CGPoint point_center;
        //Assert it, who need to auto move to the center
        if (float_height_center>=rect_t.origin.y) {//No need
            point_center = CGPointMake(0, 0);
            [scrollView setContentOffset:point_center animated:YES];
        }else{//Need
            //Counting off set point.y for view
            CGFloat float_center_offset = rect_t.origin.y-float_height_center+(rect_t.size.height/2.0);
            point_center = CGPointMake(0, float_center_offset);
            [scrollView setContentOffset:point_center animated:YES];
        }
    }
}
@end