//
//  StatsViewController.h
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/22/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomBadge.h"
#import "SoccerPlayer.h"
#import "BasketballPlayer.h"

//#import "GameController.h"

@interface StatsViewController : UIViewController

- (id) sportName: (NSString*) _sportName;

@property (strong, nonatomic) SoccerPlayer *soccerPlayer;
@property (strong, nonatomic) BasketballPlayer *basketballPlayer;

@property (nonatomic, strong) UILabel * homeTeamScoreLabel;
@property (nonatomic, strong) UILabel * awayTeamScoreLabel;

//@property (nonatomic, strong) GameController *gameController;

@end
