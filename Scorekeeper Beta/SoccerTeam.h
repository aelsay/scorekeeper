//
//  SoccerTeam.h
//  499
//
//  Created by Ali ElSayed on 10/27/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SoccerPlayer.h"


// Soccer main menu will create 2 instances of this class

// This class will create the players

@interface SoccerTeam : NSObject
{
    @private
    NSString *teamName;
    NSMutableArray *players; // A dynamic array of players
    NSInteger teamID;
    // -------------------- //
    NSInteger goalsScored;
    NSInteger totalShots;
    NSInteger shotsOnTarget;
    NSInteger shotsOffTarget;
    NSInteger dribblesWon;
    // ------------------- //
    NSInteger assists;
    NSInteger crosses;
    NSInteger totalPasses;
    NSInteger passesComplete;
    NSInteger passesIncomplete;
    
    // ------------------- //
    NSInteger tackles;
    NSInteger interceptions;
    NSInteger saves;
    NSInteger blocks;
    // ------------------ //
    NSInteger freeKicksTaken;
    NSInteger cornersTaken;
    NSInteger penaltiesTaken;
    NSInteger offsides;
    // ------------------ //
    NSInteger foulsCommitted;
    NSInteger yellowCards;
    NSInteger redCards;
    NSInteger ownGoals;
    // ------------------ //
    NSInteger numberOfPlayers; // Number of players in the team (including the subs)
}

- (id) teamName: (NSString*) _teamName;
- (id) teamID: (NSInteger) _teamID;

- (SoccerPlayer*) createPlayer: (NSString*) _name: (NSInteger) _jerseyNumber: (NSInteger) _playerID;
- (SoccerPlayer*) createPlayerWithID: (NSInteger) _playerID;
// find a player with ID
- (SoccerPlayer*) findPlayerWithID: (NSInteger) _playerID;
// Update overall team stats
- (void) updateTeamStats;

- (NSMutableArray*) players; // This class will return the array so we could modify it
//
- (NSString*) teamName;
- (NSInteger) teamID;
//
- (NSInteger) goalsScored;
- (NSInteger) totalShots;
- (NSInteger) shotsOnTarget;
- (NSInteger) shotsOffTarget;
- (NSInteger) dribblesWon;
//
- (NSInteger) assists;
- (NSInteger) crosses;
- (NSInteger) totalPasses;
- (NSInteger) passesComplete;
- (NSInteger) passesIncomplete;
//
- (NSInteger) tackles;
- (NSInteger) interceptions;
- (NSInteger) saves;
- (NSInteger) blocks;
//
- (NSInteger) freeKicksTaken;
- (NSInteger) cornersTaken;
- (NSInteger) penaltiesTaken;
- (NSInteger) offsides;
//
- (NSInteger) foulsCommitted;
- (NSInteger) yellowCards;
- (NSInteger) redCards;
- (NSInteger) ownGoals;
//
- (NSInteger) numberOfPlayers;

- (NSInteger) passAccuracyPercentage;

- (NSInteger) shotAccuracyPercentage;

@end
