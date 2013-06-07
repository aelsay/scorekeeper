//
//  GameViewController.h
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/12/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "GameController.h"

#import "PlayersViewController.h"

#import "MatchFactsViewController.h"

#import "PlayerStatsViewController.h"

#import "TimeViewController.h"

//#import "MFDoorwayTransition.h"

@interface GameViewController : UIViewController<UITabBarDelegate, UINavigationBarDelegate, UIAlertViewDelegate>
{
    NSString *sportName, *timeString;
    SoccerTeam *soccerHomeTeam, *soccerAwayTeam;
    BasketballTeam *basketballHomeTeam, *basketballAwayTeam;
    //FootballTeam *footballHomeTeam, *footballAwayTeam;
    //BaseballTeam *baseballHomeTeam, *baseballAwayTeam;
    bool timerRunning;
    //NSTimeInterval startTime;
    NSTimer *stopWatchTimer; // Store the timer that fires after a certain time
    NSDate *startDate; // Stores the date of the click on the start button
    NSTimeInterval secondsAlreadyRun;

}

- (NSString*) sportName;
- (SoccerTeam*) soccerHomeTeam;
- (SoccerTeam*) soccerAwayTeam;

- (BasketballTeam*) basketballHomeTeam;
- (BasketballTeam*) basketballAwayTeam;

- (id) sportName: (NSString*) _sportName;
- (id) soccerHomeTeam: (SoccerTeam*) _soccerHomeTeam;
- (id) soccerAwayTeam: (SoccerTeam*) _soccerAwayTeam;

- (id) basketballHomeTeam: (BasketballTeam*) _basketballHomeTeam;
- (id) basketballAwayTeam: (BasketballTeam*) _basketballAwayTeam;

@property (strong, nonatomic) IBOutlet UINavigationBar *scoreNavBar;
@property (strong, nonatomic) IBOutlet UITabBar *tabBar;
@property (strong, nonatomic) IBOutlet UIButton *timerButton;
@property (strong, nonatomic) PlayersViewController *playersViewController;
@property (strong, nonatomic) PlayerStatsViewController *playerStatsViewController;
@property (strong, nonatomic) MatchFactsViewController *matchFactsViewController;
@property (strong, nonatomic) TimeViewController *timeViewController;
@property (strong, nonatomic) UIViewController *currentViewController;
@property (strong, nonatomic) IBOutlet UILabel *homeTeamLabel;
@property (strong, nonatomic) IBOutlet UILabel *awayTeamLabel;
@property (strong, nonatomic) IBOutlet UILabel *homeTeamScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *awayTeamScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *timePeriodLabel;

//@property (strong, nonatomic) GameController *gameController;

- (IBAction)shareButton:(id)sender;
- (IBAction)whistleButton:(id)sender;
- (IBAction)timerButton:(id)sender;


@end
