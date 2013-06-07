//
//  TeamPlayerMenuViewController.h
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/11/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerInfoCell.h"
#import "ButtonsCell.h"
// May not be needed if a match setup class is used
#import "SoccerTeam.h"
#import "BasketballTeam.h"
#import "GCDiscreetNotificationView.h"

#import "GameViewController.h"

@interface TeamPlayerMenuViewController : UITableViewController <UITextFieldDelegate>
{
    @private
    NSString *sportName, *homeTeam, *awayTeam;
    // Home team ID is 0. Away team ID is 1.
    NSInteger teamID;
    // Team classes below
    // The team classes will be populated as the textField gets edited
    SoccerTeam *soccerHomeTeam, *soccerAwayTeam;
    BasketballTeam *basketballHomeTeam, *basketballAwayTeam;
}

- (SoccerTeam*) soccerHomeTeam;
- (SoccerTeam*) soccerAwayTeam;

- (BasketballTeam*) basketballHomeTeam;
- (BasketballTeam*) basketballAwayTeam;

- (id) soccerHomeTeam: (SoccerTeam*) _soccerHomeTeam;
- (id) soccerAwayTeam: (SoccerTeam*) _soccerAwayTeam;

- (id) basketballHomeTeam: (BasketballTeam*) _basketballHomeTeam;
- (id) basketballAwayTeam: (BasketballTeam*) _basketballAwayTeam;

@property (nonatomic, strong) GCDiscreetNotificationView *notificationView;

// Depending on the team ID the view will load the home or away team name above the tableview
// It will also be used to determine which view the user is in (home or away)
// If Away, then go to next view (game or coin toss view)
// If Home, go to away view (loop).
// An invisible button in the view was used to create the loop segue

- (NSString*) sportName;
- (NSString*) homeTeam;
- (NSString*) awayTeam;
- (NSInteger) teamID;

- (id) sportName: (NSString*) _sportName;
- (id) homeTeam: (NSString*) _homeTeam;
- (id) awayTeam: (NSString*) _awayTeam;
- (id) teamID: (NSInteger) _teamID;

@end
