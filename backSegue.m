//
//  backSegue.m
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/11/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "backSegue.h"
#import "QuartzCore/QuartzCore.h"

@implementation backSegue



-(void)perform
{    
    UIViewController *srcViewController = (UIViewController*)[self sourceViewController];
    UIViewController *dstViewController = (UIViewController*)[self destinationViewController];
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.35;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    transition.subtype = kCATransitionFromRight; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    [srcViewController.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [srcViewController.navigationController pushViewController:dstViewController animated:NO];
}

@end
