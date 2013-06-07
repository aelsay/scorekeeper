//
//  SoccerGame.h
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/11/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "SoccerTeam.h"
#import "SoccerPlayer.h"
#import "BasketballTeam.h"
#import "BasketballPlayer.h"
#import <Foundation/Foundation.h>


@interface TeamSportMatch : NSObject
{
    @private
    NSMutableArray *teams;
    NSString *sport;
    NSInteger numberOfTimePeriods;
    NSInteger minutesPerTimerPeriod;
    NSInteger numberOfPlayers;
}

- (NSString*) sport;

- (id) sport: (NSString*) _sport;

- (NSInteger) numberOfPlayers;

- (id) numberOfPlayers: (NSInteger) _numberOfPlayers;

@end
