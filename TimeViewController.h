//
//  TimeViewController.h
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 12/8/12.
//  Copyright (c) 2012 Scorekeeper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeViewController : UIViewController
{
    bool timerRunning;
    NSString *sportName;
    //NSTimeInterval startTime;
    NSTimer *stopWatchTimer; // Store the timer that fires after a certain time
    NSDate *startDate; // Stores the date of the click on the start button
    NSTimeInterval secondsAlreadyRun;
}

@property (strong, nonatomic) IBOutlet UILabel *TimeLabel;
@property (strong, nonatomic) IBOutlet UIButton *startAndStopButton;
@property (strong, nonatomic) IBOutlet UIButton *pauseButton;

- (IBAction)startAndStopButton:(id)sender;
- (IBAction)pauseButton:(id)sender;

@end
