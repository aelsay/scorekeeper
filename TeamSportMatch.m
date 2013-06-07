//
//  SoccerGame.m
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/11/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "TeamSportMatch.h"

@implementation TeamSportMatch

- (NSString*) sport
{
    return sport;
}

- (id) sport: (NSString*) _sport
{
    sport = _sport;
    return self;
}

- (NSInteger) numberOfPlayers
{
    return numberOfPlayers;
}

- (id) numberOfPlayers: (NSInteger) _numberOfPlayers
{
    numberOfPlayers = _numberOfPlayers;
    return self;
}

@end
