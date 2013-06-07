//
//  PlayersViewController.h
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/12/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SoccerTeam.h"
#import "SoccerPlayer.h"
//#import "GameController.h"
#import "TeamPlayerCell.h"
#import "BasketballTeam.h"
#import "BasketballPlayer.h"
#import "StatsViewController.h"
#import "UIViewController+KNSemiModal.h"

@interface PlayersViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    // A table for each team
    IBOutlet UITableView * homeTeamTableView;
    IBOutlet UITableView * awayTeamTableView;
    NSMutableArray *homeTeam, *awayTeam; // An array that stores the home and away team players
    NSString *sportName;
    StatsViewController *statsViewController;
}

- (NSMutableArray*) homeTeam;
- (NSMutableArray*) awayTeam;

- (id) homeTeam: (NSMutableArray*) _homeTeam;
- (id) awayTeam: (NSMutableArray*) _awayTeam;

- (id) sportName: (NSString*) _sportName;

- (NSString*) sportName;

@property (nonatomic, strong) UILabel * homeTeamScoreLabel;
@property (nonatomic, strong) UILabel * awayTeamScoreLabel;

@property (nonatomic, strong) UITableView * homeTeamTableView;
@property (nonatomic, strong) UITableView * awayTeamTableView;

//@property (nonatomic, strong) GameController *gameController;

@end
