//
//  TimeViewController.m
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 12/8/12.
//  Copyright (c) 2012 Scorekeeper. All rights reserved.
//

#import "TimeViewController.h"

@interface TimeViewController ()

@end

@implementation TimeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startAndStopButton:(id)sender
{
    /*
    if (timerRunning == NO) {
        timerRunning = YES;
        
        // Create the stop watch timer that fires every 10 ms
        stopWatchTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                          target:self
                                                        selector:@selector(updateTimer)
                                                        userInfo:nil
                                                         repeats:YES];
        startDate = [NSDate date];
        [stopWatchTimer fire];
        [self.timerButton setTitle:timeString forState:UIControlStateNormal];
    }
    else if (timerRunning == YES)
    {
        timerRunning = NO;
        // _Increment_ secondsAlreadyRun to allow for multiple pauses and restarts
        secondsAlreadyRun += [[NSDate date] timeIntervalSinceDate:startDate];
        [stopWatchTimer invalidate];
        stopWatchTimer = nil;
        [self updateTimer];
        [self.timerButton setTitle:timeString forState:UIControlStateNormal];
    }*/
}

- (IBAction)pauseButton:(id)sender
{

}

/*
- (void) updateTimer // Timer function
{
    NSDate *currentDate = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:startDate];
    timeInterval += secondsAlreadyRun;
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    static NSDateFormatter * dateFormatter = nil;
    if( !dateFormatter )
    {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"m:ss"];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    }
    NSString *timeString=[dateFormatter stringFromDate:timerDate];
    if (timerRunning == YES) {
        [self.timerButton setTitle:timeString forState:UIControlStateNormal];
    }
}*/

@end
