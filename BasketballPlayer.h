//
//  BasketballPlayer.h
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/7/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasketballPlayer : NSObject
{
    @private
    NSString *name;     // I see no point in having a dedicated string for first and last name
    NSString *position; // Position the player plays
    NSString *teamName; // Team the player plays for (may be useful someday)
    NSInteger playerID; // Each player has an ID. No two players have the same ID.
    NSInteger teamID;   // Home or away team
    NSInteger jerseyNumber;
    NSInteger totalPoints;
    NSInteger fieldGoalsScored;
    NSInteger fieldGoalsMissed;
    NSInteger freeThrowsScored;
    NSInteger freeThrowsMissed;
    NSInteger putbackScored;
    NSInteger putbackMissed;
    NSInteger threePointFieldGoalsScored;
    NSInteger threePointFieldGoalsMissed;
    NSInteger assists;
    NSInteger steals;
    NSInteger fouls;
    NSInteger offensiveRebounds;
    NSInteger defensiveRebounds;
    NSInteger turnovers;
    NSInteger blocks;
}

- (id) name: (NSString*) _name;
- (id) position: (NSString*) _position;
- (id) teamName: (NSString*) _teamName;
- (id) playerID: (NSInteger) _playerID;
- (id) teamID: (NSInteger) _teamID;
- (id) jerseyNumber: (NSInteger) _jerseyNumber;

- (NSString*) name;
- (NSString*) position;
- (NSString*) teamName;
- (NSInteger) playerID;
- (NSInteger) teamID;
- (NSInteger) jerseyNumber;
- (NSInteger) totalPoints;
- (NSInteger) fieldGoalsScored;
- (NSInteger) fieldGoalsMissed;
- (NSInteger) freeThrowsScored;
- (NSInteger) freeThrowsMissed;
- (NSInteger) threePointFieldGoalsScored;
- (NSInteger) threePointFieldGoalsMissed;
- (NSInteger) putbackScored;
- (NSInteger) putbackMissed;
- (NSInteger) assists;
- (NSInteger) steals;
- (NSInteger) fouls;
- (NSInteger) offensiveRebounds;
- (NSInteger) defensiveRebounds;
- (NSInteger) turnovers;
- (NSInteger) blocks;
- (NSInteger) rebounds;

- (NSInteger) freeThrowsScoredPercentage;
- (NSInteger) fieldGoalsScoredPercentage;
- (NSInteger) threePointFieldGoalsScoredPercentage;

- (void) incrementFieldGoalsScored;
- (void) incrementFieldGoalsMissed;
- (void) incrementFreeThrowsScored;
- (void) incrementFreeThrowsMissed;
- (void) incrementThreePointFieldGoalsScored;
- (void) incrementThreePointFieldGoalsMissed;
- (void) incrementPutbackScored;
- (void) incrementPutbackMissed;
- (void) incrementAssists;
- (void) incrementSteals;
- (void) incrementFouls;
- (void) incrementOffensiveRebounds;
- (void) incrementDefensiveRebounds;
- (void) incrementTurnovers;
- (void) incrementBlocks;

- (NSInteger) decrementFieldGoalsScored;
- (void) decrementFieldGoalsMissed;
- (NSInteger) decrementFreeThrowsScored;
- (void) decrementFreeThrowsMissed;
- (NSInteger) decrementThreePointFieldGoalsScored;
- (void) decrementThreePointFieldGoalsMissed;
- (NSInteger) decrementPutbackScored;
- (void) decrementPutbackMissed;
- (void) decrementAssists;
- (void) decrementSteals;
- (void) decrementFouls;
- (void) decrementOffensiveRebounds;
- (void) decrementDefensiveRebounds;
- (void) decrementTurnovers;
- (void) decrementBlocks;

@end
