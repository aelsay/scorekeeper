//
//  BasketballTeam.h
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/7/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BasketballPlayer.h"

@interface BasketballTeam : NSObject
{
    @private
    NSString *name; // Team name
    NSMutableArray *players;
    NSInteger teamID;
    NSInteger totalPoints;
    NSInteger fieldGoalsScored;
    NSInteger fieldGoalsMissed;
    NSInteger freeThrowsScored;
    NSInteger freeThrowsMissed;
    NSInteger threePointFieldGoalsScored;
    NSInteger threePointFieldGoalsMissed;
    NSInteger putbackScored;
    NSInteger putbackMissed;
    NSInteger assists;
    NSInteger steals;
    NSInteger fouls;
    NSInteger blocks;
    NSInteger turnovers;
    NSInteger offensiveRebounds;
    NSInteger defensiveRebounds;
    NSInteger numberOfPlayers;
}

- (id) name: (NSString*) _name;
- (id) teamID: (NSInteger) _teamID;

// Create player with a name, number, and ID
- (BasketballPlayer*) createPlayerWithName: (NSString*) _name withNumber: (NSInteger) _jerseyNumber withID:(NSInteger) _playerID;
- (BasketballPlayer*) createPlayerWithID: (NSInteger) _playerID;
// return player with ID
- (BasketballPlayer*) findPlayerWithID: (NSInteger) _playerID;
// Update team stats
- (void) updateTeamStats;

// Return the array that's storing all the players

- (NSMutableArray*) players;

- (NSString*) name;
- (NSInteger) teamID;
- (NSInteger) totalPoints;
- (NSInteger) fieldGoalsScored;
- (NSInteger) fieldGoalsMissed;
- (NSInteger) fieldGoalsAttempted;
- (NSInteger) freeThrowsScored;
- (NSInteger) freeThrowsMissed;
- (NSInteger) freeThrowsAttempted;
- (NSInteger) threePointFieldGoalsScored;
- (NSInteger) threePointFieldGoalsMissed;
- (NSInteger) threePointFieldGoalsAttempted;
- (NSInteger) putbackScored;
- (NSInteger) putbackMissed;
- (NSInteger) assists;
- (NSInteger) steals;
- (NSInteger) fouls;
- (NSInteger) blocks;
- (NSInteger) turnovers;
- (NSInteger) rebounds;
- (NSInteger) offensiveRebounds;
- (NSInteger) defensiveRebounds;
- (NSInteger) numberOfPlayers;
- (NSInteger) freeThrowsScoredPercentage;
- (NSInteger) fieldGoalsScoredPercentage;
- (NSInteger) threePointFieldGoalsScoredPercentage;

@end
