//
//  GameController.h
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/30/12.
//  Copyright (c) 2012 Scorekeeper. All rights reserved.
//

#import "SoccerTeam.h"
#import "SoccerPlayer.h"
#import "BasketballTeam.m"
#import "BasketballTeam.h"
#import <Foundation/Foundation.h>

@interface GameController : NSObject

@property (strong, nonatomic) id homeTeam;
@property (strong, nonatomic) id awayTeam;

@property (strong, nonatomic) UILabel *homeTeamScoreLabel;
@property (strong, nonatomic) UILabel *awayTeamScoreLabel;

@property (strong, nonatomic) NSString *sportName;

//time should be here

@end
