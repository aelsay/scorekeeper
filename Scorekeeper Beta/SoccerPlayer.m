//
//  SoccerPlayer.m
//  499
//
//  Created by Ali ElSayed on 10/27/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "SoccerPlayer.h"

@implementation SoccerPlayer

- (id) init
{
    self = [super init];
    if (self)
    {
        name = @"";
        teamName = @"";
        position = @"";
        teamID = 0;
        playerID = 0;
        jerseyNumber = 0;
        goalsScored = 0;
        totalShots = 0;
        shotsOnTarget = 0;
        shotsOffTarget = 0;
        assists = 0;
        crosses = 0;
        totalPasses = 0;
        passesComplete = 0;
        passesIncomplete = 0;
        tackles = 0;
        interceptions = 0;
        blocks = 0;
        saves = 0;
        dribblesWon = 0;
        freeKicksTaken = 0;
        cornersTaken = 0;
        offsides = 0;
        foulsCommitted = 0;
        yellowCards = 0;
        redCards = 0;
    }
    return self;
}

- (id) name: (NSString*) _name
{
    name = _name;
    return self;
}

- (id) position: (NSString*) _position
{
    position = _position;
    return self;
}

- (id) teamName: (NSString*) _teamName
{
    teamName = _teamName;
    return self;
}

- (id) playerID: (NSInteger) _playerID
{
    playerID = _playerID;
    return self;
}

- (id) teamID: (NSInteger) _teamID
{
    teamID = _teamID;
    return self;
}

- (id) jerseyNumber: (NSInteger) _jerseyNumber
{
    jerseyNumber = _jerseyNumber;
    return self;
}


// -------------------------------------------------------------------------- //


- (void) incrementGoalsScored
{
    goalsScored++;
}

- (void) incrementShotsOnTarget
{
    shotsOnTarget++;
}

- (void) incrementShotsOffTarget
{
    shotsOffTarget++;
}

- (void) incrementDribblesWon
{
    dribblesWon++;
}

// -------------------------------------------------------------------------- //

- (void) incrementAssists
{
    assists++;
}

- (void) incrementPassesComplete
{
    passesComplete++;
}

- (void) incrementPassesIncomplete
{
    passesIncomplete++;
}

- (void) incrementCrosses
{
    crosses++;
}

// -------------------------------------------------------------------------- //

- (void) incrementTackles
{
    tackles++;
}

- (void) incrementInterceptions
{
    interceptions++;
}

- (void) incrementBlocks
{
    blocks++;
}

- (void) incrementSaves
{
    saves++;
}

// -------------------------------------------------------------------------- //


- (void) incrementFreeKicksTaken
{
    freeKicksTaken++; // The player has taken a freekick
    // The foul committed on the player must be manually implemented
    // Because there 
}

- (void) incrementCornersTaken
{
    cornersTaken++; // The player took a corner
}

- (void) incrementPenaltiesTaken
{
    penaltiesTaken++;
}

- (void) incrementOffsides
{
    offsides++; // The player is offside
    // The the other team gets a free kick, but the app doesn't know who will take it
    // The scorekeeper will have to do that manually
    // But maybe the app should increment the total free kicks taken in the overall team stats
}

// -------------------------------------------------------------------------- //

- (void) incrementYellowCards
{
    if (yellowCards < 2 && redCards < 1) // If a player has less than 2 cautions and no red cards
    {
        yellowCards++; // Then increment the yellowCards count
        // The player may have gotten a yellow card for arguing with the ref
        // No need to increment the fouls committed count
        if(yellowCards == 2) // If a player has 2 yellows
        {
            redCards++; // He's off!
        }
    }
}

- (void) incrementRedCards
{
    if(redCards == 0) // The player obviously can't have more than a red card
    {
        redCards = 1;
    }
    else
    {
        return; // Do nothing!
    }
}

- (void) incrementOwnGoals
{
    ownGoals++;
}

- (void) incrementFoulsCommitted
{
    foulsCommitted++; // A player committed a foul
}

// -------------------------------------------------------------------------- //
// -------------------------------------------------------------------------- //
// -------------------------------------------------------------------------- //
// -------------------------------------------------------------------------- //
// -------------------------------------------------------------------------- //


- (NSInteger) decrementGoalsScored
{
    if (goalsScored > 0)
    {
        goalsScored--;
        return 0;
    }
    return -1;
}

- (void) decrementShotsOnTarget
{
    if (shotsOnTarget > 0)
    {
        shotsOnTarget--;
    }
}

- (void) decrementShotsOffTarget
{
    if (shotsOffTarget > 0)
    {
        shotsOffTarget--;
    }
}

- (void) decrementDribblesWon
{
    if (dribblesWon > 0)
    {
        dribblesWon--;
    }
}

// -------------------------------------------------------------------------- //

- (void) decrementPassesComplete
{
    if (passesComplete > 0)
    {
        passesComplete--;
    }
}

- (void) decrementPassesIncomplete
{
    if (passesIncomplete > 0)
    {
        passesIncomplete--;
    }
}

- (void) decrementAssists
{
    if (assists > 0)
    {
        assists--;
    }
}

- (void) decrementCrosses
{
    if (crosses > 0)
    {
        crosses--;
    }
}

// -------------------------------------------------------------------------- //

- (void) decrementTackles
{
    if (tackles > 0)
    {
        tackles--;
    }
}

- (void) decrementInterceptions
{
    if (interceptions > 0)
    {
        interceptions--;
    }
}

- (void) decrementBlocks
{
    if (blocks > 0)
    {
        blocks--;
    }
}

- (void) decrementSaves
{
    if (saves > 0)
    {
        saves--;
    }
}

// -------------------------------------------------------------------------- //

- (void) decrementFreeKicksTaken
{
    if (freeKicksTaken > 0)
    {
        freeKicksTaken--;
    }
}

- (void) decrementCornersTaken
{
    if (cornersTaken > 0)
    {
        cornersTaken--;
    }
}

- (void) decrementOffsides
{
    if (offsides > 0)
    {
        offsides--;
    }
}

- (void) decrementPenaltiesTaken
{
    if (penaltiesTaken > 0)
    {
        penaltiesTaken--;
    }
}

// -------------------------------------------------------------------------- //

- (void) decrementFoulsCommitted
{
    if (foulsCommitted > 0)
    {
        foulsCommitted--;
    }
}

- (void) decrementYellowCards
{
    if (yellowCards > 0)
    {
        yellowCards--;
        if (redCards == 1)
        {
            redCards = 0;
        }
    }
}

- (void) decrementRedCards
{
    if (redCards == 1)
    {
        redCards = 0;
        if (yellowCards == 2)
        {
            yellowCards = 1;
        }
    }
}

- (NSInteger) decrementOwnGoals
{
    if (ownGoals > 0)
    {
        ownGoals--;
        return 0;
    }
    return -1;
}

// -------------------------------------------------------------------------- //
// -------------------------------------------------------------------------- //
// -------------------------------------------------------------------------- //
// -------------------------------------------------------------------------- //
// -------------------------------------------------------------------------- //
// -------------------------------------------------------------------------- //

- (NSString*) name
{
    return name;
}

- (NSString*) position
{
    return position;
}

- (NSString*) teamName
{
    return teamName;
}

- (NSInteger) teamID
{
    return teamID;
}

- (NSInteger) playerID
{
    return playerID;
}

- (NSInteger) jerseyNumber
{
    return jerseyNumber;
}

// -------------------------------------------------------------------------- //

- (NSInteger) goalsScored
{
    return goalsScored;
}

- (NSInteger) totalShots
{
    totalShots = shotsOffTarget + shotsOnTarget;
    return totalShots;
}

- (NSInteger) shotsOnTarget
{
    return shotsOnTarget;
}

- (NSInteger) shotsOffTarget
{
    return shotsOffTarget;
}

- (NSInteger) dribblesWon
{
    return dribblesWon;
}

// -------------------------------------------------------------------------- //

- (NSInteger) assists
{
    return assists;
}

- (NSInteger) passesComplete
{
    return passesComplete;
}

- (NSInteger) passesIncomplete
{
    return passesIncomplete;
}

- (NSInteger) crosses
{
    return crosses;
}

- (NSInteger) totalPasses
{
    totalPasses = passesIncomplete + passesComplete;
    return totalPasses;
}

// -------------------------------------------------------------------------- //

- (NSInteger) tackles
{
    return tackles;
}

- (NSInteger) interceptions
{
    return interceptions;
}

- (NSInteger) saves
{
    return saves;
}

- (NSInteger) blocks
{
    return blocks;
}

// -------------------------------------------------------------------------- //

- (NSInteger) freeKicksTaken
{
    return freeKicksTaken;
}

- (NSInteger) cornersTaken
{
    return cornersTaken;
}

- (NSInteger) offsides
{
    return offsides;
}

- (NSInteger) penaltiesTaken
{
    return penaltiesTaken;
}

// -------------------------------------------------------------------------- //

- (NSInteger) foulsCommitted
{
    return foulsCommitted;
}

- (NSInteger) yellowCards
{
    return yellowCards;
}

- (NSInteger) redCards
{
    return redCards;
}

- (NSInteger) ownGoals
{
    return ownGoals;
}

// -------------------------------------------------------------------------- //

@end
