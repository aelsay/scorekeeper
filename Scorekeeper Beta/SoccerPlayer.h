//
//  SoccerPlayer.h
//  499
//
//  Created by Ali ElSayed on 10/27/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef enum {SUSPENDED, CAUTIONED, NONE} Discipline; // Setup enums!!
//typedef enum {STARTER, SUBSTITUTE} Status;
//typedef enum {GOALKEEPER, DEFENDER, MIDFIELDER, ATTACKER} Position;

@interface SoccerPlayer : NSObject
{
    @private
    // Player and team info below must have setter functions
    NSString *name;
    NSString *teamName;
    NSString *position;
    NSInteger teamID;
    NSInteger playerID; // Player ID is last 2 numbers of the 3 digit tag in Storyboard
    NSInteger jerseyNumber;
    // Player and team info above should have setter functions
    //
    // Attacking / Scoring data
    NSInteger goalsScored;
    NSInteger totalShots;
    NSInteger shotsOnTarget;
    NSInteger shotsOffTarget;
    NSInteger dribblesWon;
    // Passing / Playmaking data
    NSInteger assists;
    NSInteger crosses;
    NSInteger totalPasses;
    NSInteger passesComplete;
    NSInteger passesIncomplete;
    // Defending / GK saves data
    NSInteger tackles;
    NSInteger interceptions;
    NSInteger blocks;
    NSInteger saves;
    // Set pieces and offsides
    NSInteger freeKicksTaken;
    NSInteger cornersTaken;
    NSInteger penaltiesTaken;
    NSInteger offsides;
    // Discipline and own goals
    NSInteger foulsCommitted;
    NSInteger yellowCards;
    NSInteger redCards;
    NSInteger ownGoals;
}

- (id) name: (NSString*) _name;
- (id) teamName: (NSString*) _teamName;
- (id) position: (NSString*) _position;
- (id) playerID: (NSInteger) _playerID;
- (id) teamID: (NSInteger) _teamID;
- (id) jerseyNumber: (NSInteger) _jerseyNumber;

// Attacking skills / goals
- (void) incrementGoalsScored;
- (void) incrementShotsOnTarget;
- (void) incrementShotsOffTarget;
- (void) incrementDribblesWon;

// Passing / playmaking
- (void) incrementAssists;
- (void) incrementPassesComplete;
- (void) incrementPassesIncomplete;
- (void) incrementCrosses;
// Defending / GK saves
- (void) incrementTackles;
- (void) incrementInterceptions;
- (void) incrementBlocks;
- (void) incrementSaves;
// Set pieces
- (void) incrementFreeKicksTaken;
- (void) incrementCornersTaken;
- (void) incrementOffsides;
- (void) incrementPenaltiesTaken;
// Discipline and own goals
- (void) incrementFoulsCommitted;
- (void) incrementYellowCards;
- (void) incrementRedCards;
- (void) incrementOwnGoals;


// Attacking skills / goals
- (NSInteger) decrementGoalsScored;
- (void) decrementShotsOnTarget;
- (void) decrementShotsOffTarget;
- (void) decrementDribblesWon;

// Passing / playmaking
- (void) decrementAssists;
- (void) decrementPassesComplete;
- (void) decrementPassesIncomplete;
- (void) decrementCrosses;
// Defending / GK saves
- (void) decrementTackles;
- (void) decrementInterceptions;
- (void) decrementBlocks;
- (void) decrementSaves;
// Set pieces
- (void) decrementFreeKicksTaken;
- (void) decrementCornersTaken;
- (void) decrementOffsides;
- (void) decrementPenaltiesTaken;
// Discipline and own goals
- (void) decrementFoulsCommitted;
- (void) decrementYellowCards;
- (void) decrementRedCards;
- (NSInteger) decrementOwnGoals;

- (NSString*) name;
- (NSString*) position;
- (NSString*) teamName;
- (NSInteger) teamID;
- (NSInteger) playerID;
- (NSInteger) jerseyNumber;

- (NSInteger) goalsScored;
- (NSInteger) totalShots;
- (NSInteger) shotsOnTarget;
- (NSInteger) shotsOffTarget;
- (NSInteger) dribblesWon;

- (NSInteger) assists;
- (NSInteger) totalPasses;
- (NSInteger) passesComplete;
- (NSInteger) passesIncomplete;
- (NSInteger) crosses;

- (NSInteger) tackles;
- (NSInteger) interceptions;
- (NSInteger) blocks;
- (NSInteger) saves;

- (NSInteger) freeKicksTaken;
- (NSInteger) cornersTaken;
- (NSInteger) offsides;
- (NSInteger) penaltiesTaken;

- (NSInteger) foulsCommitted;
- (NSInteger) yellowCards;
- (NSInteger) redCards;
- (NSInteger) ownGoals;






@end
