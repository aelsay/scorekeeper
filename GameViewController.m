//
//  GameViewController.m
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/12/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSString*) convertToString: (NSInteger) number
{
    return [NSString stringWithFormat:@"%d", number];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    // UIColor *color = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"lined_paper.png"]];
    // self.view.backgroundColor = color; // Set background color
	// Do any additional setup after loading the view.
    // There is no need to allocate the team classes
    // because there are being passed from the previous view
    // allocating them (the teams) will result in new empty teams
    [_tabBar setSelectedItem:[_tabBar.items objectAtIndex:0]];
    [self tabBar: self.tabBar didSelectItem:[_tabBar.items objectAtIndex:0]];
    //if(sportName == @"Soccer")
    //{
    //    [self.tabBar setSelectedImageTintColor:[UIColor greenColor]];
    //}
    //else if(sportName == @"Basketball")
    //{
    //    [self.tabBar setSelectedImageTintColor:[UIColor orangeColor]];
    //}
    // The code below has to be something like the following instead
    //
    if (sportName == @"Soccer")
    {
        _homeTeamScoreLabel.text = [self convertToString:soccerHomeTeam.goalsScored];
        _awayTeamScoreLabel.text = [self convertToString:soccerAwayTeam.goalsScored];
        _homeTeamLabel.text = soccerHomeTeam.teamName;
        _awayTeamLabel.text = soccerAwayTeam.teamName;
        [soccerHomeTeam teamID: 0];
        [soccerAwayTeam teamID: 1];
    }
    else if (sportName == @"Basketball")
    {
        _homeTeamScoreLabel.text = [self convertToString:basketballHomeTeam.totalPoints];
        _awayTeamScoreLabel.text = [self convertToString:basketballAwayTeam.totalPoints];
        _homeTeamLabel.text = basketballHomeTeam.name;
        _awayTeamLabel.text = basketballAwayTeam.name;
        [basketballHomeTeam teamID: 0];
        [basketballAwayTeam teamID: 1];
    }
    
    timerRunning = NO;
    
    [_timerButton setTitle:@"0:00" forState:UIControlStateNormal];
    _timePeriodLabel.text = @"1";
    //else if (sportName == @"Football")
    //{
        //
        //
        //
        //
    //}
    //else if (sportName == @"Baseball")
    //{
        //
        //
        //
        //
    //}
    // The score nav bar is always above everything in the view hierarchy
    // Everything else is a subview to it (so animations, or other views won't be drawn on top of it)
    [self.view insertSubview:_tabBar belowSubview:_scoreNavBar];
    //self.gameController = [[GameController alloc] init];
    //self.gameController.sportName = self.sportName;
    //self.gameController.homeTeamScoreLabel = self.homeTeamScoreLabel;
    //self.gameController.awayTeamScoreLabel = self.awayTeamScoreLabel;
    //if (sportName == @"Soccer") {
    //    self.gameController.homeTeam = self.soccerHomeTeam;
    //    self.gameController.awayTeam = self.soccerAwayTeam;
    //}
    //else if (sportName == @"Basketball")
    //{
    //    self.gameController.homeTeam = self.basketballHomeTeam;
    //    self.gameController.awayTeam = self.basketballAwayTeam;
    //}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSLog(@"didSelectItem: %d", item.tag);
    CGRect bounds = [[UIScreen mainScreen] bounds];
    // The ints below are there to determine the boundaries of the window
    NSInteger view_upper_bound = 93, view_lower_bound = bounds.size.height - 93 - 20; // -20 because the top bar needs to be taken into account
    switch (item.tag) {
        case 1:
            if (_playersViewController == nil)
            {
                self.playersViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"playersViewController"];
                [_playersViewController sportName: sportName];
                if (sportName == @"Soccer")
                {
                    [_playersViewController homeTeam: soccerHomeTeam.players];
                    [_playersViewController awayTeam: soccerAwayTeam.players];
                }
                else if (sportName == @"Basketball")
                {
                    [_playersViewController homeTeam: basketballHomeTeam.players];
                    [_playersViewController awayTeam: basketballAwayTeam.players];
                }
                // else if (sportName == @"Football")
                // {
                //   [_playersViewController homeTeam: footballHomeTeam.players];
                //   [_playersViewController awayTeam: footballAwayTeam.players];
                // }
                // else if (sportName == @"Football")
                // {
                //   [_playersViewController homeTeam: baseballHomeTeam.players];
                //   [_playersViewController awayTeam: baseballAwayTeam.players];
                // }
                _playersViewController.homeTeamScoreLabel = self.homeTeamScoreLabel; // Pass the score label
                _playersViewController.awayTeamScoreLabel = self.awayTeamScoreLabel; // Pass the score label
               // _playersViewController.gameController = self.gameController;
                // Set the view boundaries
                // The score nav bar is 44 pixel points
                // The tabBar is 49 pixel points
                // Any UIView should be loaded below them (at 93 pixel points)
                _playersViewController.view.frame = CGRectMake(0, view_upper_bound, 320, view_lower_bound);
                // The tabBar is a subview to the score nav bar, but everything else is a subview to it.
            }
            [self.view insertSubview: _playersViewController.view belowSubview:_tabBar];
            // If the view is occupied by some other view and it's not the same view
            if (_currentViewController != nil && _currentViewController != _playersViewController)
                [_currentViewController.view removeFromSuperview];
            _currentViewController = _playersViewController;            
            break;
        case 2:
            if (_playerStatsViewController == nil)
            {
                self.playerStatsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"playerStatsViewController"];
                [_playerStatsViewController sportName: sportName];
                _playerStatsViewController.homeTeamName = self.homeTeamLabel.text;
                _playerStatsViewController.awayTeamName = self.awayTeamLabel.text;
                if (sportName == @"Soccer")
                {
                    [_playerStatsViewController homeTeam: soccerHomeTeam.players];
                    [_playerStatsViewController awayTeam: soccerAwayTeam.players];
                }
                else if (sportName == @"Basketball")
                {
                    [_playerStatsViewController homeTeam: basketballHomeTeam.players];
                    [_playerStatsViewController awayTeam: basketballAwayTeam.players];
                }
                // else if (sportName == @"Football")
                // {
                //   [_playersViewController homeTeam: footballHomeTeam.players];
                //   [_playersViewController awayTeam: footballAwayTeam.players];
                // }
                // else if (sportName == @"Football")
                // {
                //   [_playersViewController homeTeam: baseballHomeTeam.players];
                //   [_playersViewController awayTeam: baseballAwayTeam.players];
                // }
                _playerStatsViewController.view.frame = CGRectMake(0, view_upper_bound, 320, view_lower_bound);
            }
            [self.view insertSubview: _playerStatsViewController.view belowSubview:_tabBar];
            // If the view is occupied by some other view and it's not the same view
            if (_currentViewController != nil && _currentViewController != _playerStatsViewController)
                [_currentViewController.view removeFromSuperview];
            _currentViewController = _playerStatsViewController;
            break;
        case 3:
            if (_matchFactsViewController == nil)
            {
                self.matchFactsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"matchFactsViewController"];
                _matchFactsViewController.view.frame = CGRectMake(0, view_upper_bound, 320, view_lower_bound);
                [_matchFactsViewController sportName: sportName];
                if (sportName == @"Soccer")
                {
                    [_matchFactsViewController soccerHomeTeam: soccerHomeTeam];
                    [_matchFactsViewController soccerAwayTeam: soccerAwayTeam];
                }
                else if (sportName == @"Basketball")
                {
                    [_matchFactsViewController basketballHomeTeam: basketballHomeTeam];
                    [_matchFactsViewController basketballAwayTeam: basketballAwayTeam];
                }
            }
            [self.view insertSubview:_matchFactsViewController.view belowSubview:_tabBar];
            // If the view is occupied by some other view and it's not the same view
            if (_currentViewController != nil && _currentViewController != _matchFactsViewController)
                [_currentViewController.view removeFromSuperview];
            _currentViewController = _matchFactsViewController;
            break;
        case 4:
            break;
        case 5:
            if (_timeViewController == nil)
            {
                self.timeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"timeViewController"];
                _timeViewController.view.frame = CGRectMake(0, view_upper_bound, 320, view_lower_bound);
                //[_timeViewController sportName: sportName];
                _timeViewController.TimeLabel.text = timeString;
                
            }
            [self.view insertSubview:_timeViewController.view belowSubview:_tabBar];
            // If the view is occupied by some other view and it's not the same view
            if (_currentViewController != nil && _currentViewController != _timeViewController)
                [_timeViewController.view removeFromSuperview];
            _currentViewController = _timeViewController;
            break;
        default:
            break;
    }
}

- (NSString*) sportName
{
    return sportName;
}

- (id) sportName: (NSString*) _sportName
{
    sportName = _sportName;
    return self;
}

- (SoccerTeam*) soccerHomeTeam
{
    return soccerHomeTeam;
}

- (SoccerTeam*) soccerAwayTeam
{
    return soccerAwayTeam;
}

- (BasketballTeam*) basketballHomeTeam
{
    return basketballHomeTeam;
}

- (BasketballTeam*) basketballAwayTeam
{
    return basketballAwayTeam;
}

- (id) soccerHomeTeam: (SoccerTeam*) _soccerHomeTeam
{
    soccerHomeTeam = _soccerHomeTeam;
    return self;
}

- (id) soccerAwayTeam: (SoccerTeam*) _soccerAwayTeam
{
    soccerAwayTeam = _soccerAwayTeam;
    return self;
}

- (id) basketballHomeTeam: (BasketballTeam*) _basketballHomeTeam
{
    basketballHomeTeam = _basketballHomeTeam;
    return self;
}

- (id) basketballAwayTeam: (BasketballTeam*) _basketballAwayTeam
{
    basketballAwayTeam = _basketballAwayTeam;
    return self;
}

- (IBAction)shareButton:(id)sender
{
    NSString *message = [[[[[[_homeTeamLabel.text stringByAppendingString:@" "] stringByAppendingString: [NSString stringWithFormat:@"%@", _homeTeamScoreLabel.text]] stringByAppendingString:@" - "] stringByAppendingString: _awayTeamScoreLabel.text] stringByAppendingString:@" "] stringByAppendingString:[NSString stringWithFormat:@"%@", _awayTeamLabel.text]];
    // Put the message in the items array
    NSArray *items = @[message];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc]initWithActivityItems:items applicationActivities:nil];
    //Exclude uneeded activities
    // Note: include UIActivityTypeMessage to exclude the Message option
    [activityViewController setExcludedActivityTypes:@[UIActivityTypePostToWeibo]];
    [self presentViewController:activityViewController animated:YES completion:nil];
    items = nil;
}

- (IBAction)whistleButton:(id)sender
{
    NSString *timePeriodButton = @"End Time Period";
    if (sportName == @"Soccer")
    {
        timePeriodButton = @"End Half";
    }
    else if (sportName == @"Basketball")
    {
        timePeriodButton = @"End Quarter";
    }
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Whistle to..." message:@"" delegate:self cancelButtonTitle:@"Back to Game View" otherButtonTitles:@"Start Time", timePeriodButton, @"End Game", nil];
    [alertView setTag: 13];
    [alertView show];
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alertView tag] == 13)
    {
        if (buttonIndex == 1)
        {
            [self timerButton:nil];
        }
        else if (buttonIndex == 2)
        {
            NSInteger currentPeriod = [self.timePeriodLabel.text integerValue];
            currentPeriod++;
            self.timePeriodLabel.text = [NSString stringWithFormat:@"%i", currentPeriod];
            if (timerRunning == YES) {
                [self timerButton:nil];
            }
            secondsAlreadyRun = 0;
            [_timerButton setTitle:@"0:00" forState:UIControlStateNormal];
        }
        else if (buttonIndex == 3)
        {
            UINavigationController *rootController = [self.storyboard instantiateViewControllerWithIdentifier:@"rootController"];
            [self presentViewController:rootController animated:YES completion:nil];
            self.currentViewController = nil;
            self.playersViewController = nil;
            self.playerStatsViewController = nil;
            self.matchFactsViewController = nil;
            self.timeViewController = nil;
            startDate = nil;
            stopWatchTimer = nil;
        }
    }
}

- (IBAction)timerButton:(id)sender
{
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
    }
   else if (timerRunning == YES)
    {
        timerRunning = NO;
        // _Increment_ secondsAlreadyRun to allow for multiple pauses and restarts
        secondsAlreadyRun += [[NSDate date] timeIntervalSinceDate:startDate];
        [stopWatchTimer invalidate];
        stopWatchTimer = nil;
        [self updateTimer];
    }
}

- (IBAction)reset:(id)sender; {
    secondsAlreadyRun = 0;
    [_timerButton setTitle:@"0:00" forState:UIControlStateNormal];
    //stopWatchLabel.text = @"00:00.00";
}

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
    timeString=[dateFormatter stringFromDate:timerDate];
    if (timerRunning == YES) {
        [self.timerButton setTitle:timeString forState:UIControlStateNormal];
    }
}

@end
