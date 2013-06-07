//
//  BasketballPlayer.m
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/7/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "BasketballPlayer.h"

@implementation BasketballPlayer

- (id) init
{
    self = [super init];
    if (self)
    {
        name = @"";
        position = @"";
        teamName = @"";
        teamID = 0;
        playerID = 0;
        jerseyNumber = 0;
        totalPoints = 0;
        freeThrowsMissed = 0;
        freeThrowsScored = 0;
        fieldGoalsMissed = 0;
        fieldGoalsScored = 0;
        threePointFieldGoalsMissed = 0;
        threePointFieldGoalsScored = 0;
        putbackMissed = 0;
        putbackScored = 0;
        fouls = 0;
        steals = 0;
        assists = 0;
        offensiveRebounds = 0;
        defensiveRebounds = 0;
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

- (NSInteger) playerID
{
    return playerID;
}

- (NSInteger) teamID
{
    return teamID;
}

- (NSInteger) jerseyNumber
{
    return jerseyNumber;
}

- (NSInteger) totalPoints
{
    return totalPoints;
}

- (NSInteger) fieldGoalsScored
{
    return fieldGoalsScored;
}

- (NSInteger) fieldGoalsMissed
{
    return fieldGoalsMissed;
}

- (NSInteger) freeThrowsScored
{
    return freeThrowsScored;
}

- (NSInteger) freeThrowsMissed
{
    return freeThrowsMissed;
}

- (NSInteger) threePointFieldGoalsScored
{
    return threePointFieldGoalsScored;
}

- (NSInteger) threePointFieldGoalsMissed
{
    return threePointFieldGoalsMissed;
}

- (NSInteger) assists
{
    return assists;
}

- (NSInteger) steals
{
    return steals;
}

- (NSInteger) fouls
{
    return fouls;
}

- (NSInteger) rebounds
{
    return (offensiveRebounds + defensiveRebounds);
}

- (NSInteger) offensiveRebounds
{
    return offensiveRebounds;
}

- (NSInteger) defensiveRebounds
{
    return defensiveRebounds;
}

- (NSInteger) turnovers
{
    return turnovers;
}

- (NSInteger) blocks
{
    return blocks;
}

- (NSInteger) putbackScored
{
    return putbackScored;
}

- (NSInteger) putbackMissed
{
    return putbackMissed;
}

- (void) incrementFieldGoalsScored
{
    fieldGoalsScored++;
    totalPoints += 2; // Increment total points scored by the player
}

- (void) incrementFieldGoalsMissed
{
    fieldGoalsMissed++;
}

- (void) incrementFreeThrowsScored
{
    freeThrowsScored++;
    totalPoints++;
}

- (void) incrementFreeThrowsMissed
{
    freeThrowsMissed++;
}

- (void) incrementThreePointFieldGoalsScored
{
    threePointFieldGoalsScored++;
    totalPoints += 3;
}

- (void) incrementThreePointFieldGoalsMissed
{
    threePointFieldGoalsMissed++;
}

- (void) incrementPutbackScored
{
    putbackScored++;
    totalPoints += 2;
}

- (void) incrementPutbackMissed
{
    putbackMissed++;
}

- (void) incrementAssists
{
    assists++;
}

- (void) incrementSteals
{
    steals++;
}

- (void) incrementFouls
{
    fouls++;
}

- (void) incrementOffensiveRebounds
{
    offensiveRebounds++;
}

- (void) incrementDefensiveRebounds
{
    defensiveRebounds++;
}

- (void) incrementTurnovers
{
    turnovers++;
}

- (void) incrementBlocks
{
    blocks++;
}

- (NSInteger) decrementFieldGoalsScored
{
    if (fieldGoalsScored > 0) // You need at least 2 points to take away a field goal
    {
        fieldGoalsScored--;
        totalPoints -= 2;
        return 0;
    }
    return -1;
}

- (void) decrementFieldGoalsMissed
{
    if (fieldGoalsMissed > 0)
    {
        fieldGoalsMissed--;
    }
}

- (NSInteger) decrementFreeThrowsScored
{
    if (freeThrowsScored > 0) // If the player has at least a point
    {
        freeThrowsScored--;
        totalPoints--;
        return 0;
    }
    return -1;
}

- (void) decrementFreeThrowsMissed
{
    if (freeThrowsMissed > 0)
    {
        freeThrowsMissed--;
    }
}

- (NSInteger) decrementThreePointFieldGoalsScored
{
    if (threePointFieldGoalsScored > 0)
    {
        threePointFieldGoalsScored--;
        totalPoints -= 3;
        return 0;
    }
    return -1;
}

- (void) decrementThreePointFieldGoalsMissed
{
    if (threePointFieldGoalsMissed > 0)
    {
        threePointFieldGoalsMissed--;
    }
}

- (NSInteger) decrementPutbackScored
{
    if (putbackScored > 0)
    {
        putbackScored--;
        putbackScored -= 2;
        return 0;
    }
    return -1;
}

- (void) decrementPutbackMissed
{
    if (putbackMissed > 0)
    {
        putbackMissed--;
    }
}

- (void) decrementAssists
{
    if (assists > 0)
    {
        assists--;
    }
}

- (void) decrementSteals
{
    if (steals > 0)
    {
        steals--;
    }
}

- (void) decrementFouls
{
    if (fouls > 0)
    {
        fouls--;
    }
    
}

- (void) decrementOffensiveRebounds
{
    if (offensiveRebounds > 0)
    {
        offensiveRebounds--;
    }
}

- (void) decrementDefensiveRebounds
{
    if (defensiveRebounds > 0)
    {
        defensiveRebounds--;
    }
}

- (void) decrementTurnovers
{
    if (turnovers > 0)
    {
        turnovers--;
    }
}

- (void) decrementBlocks
{
    if (blocks > 0)
    {
        blocks--;
    }
}

- (NSInteger) freeThrowsScoredPercentage
{
    NSInteger freeThrowsAttempted = freeThrowsMissed + freeThrowsScored;
    if (freeThrowsAttempted > 0)
        return (freeThrowsScored * 100 / freeThrowsAttempted);
    return -1;
}

- (NSInteger) fieldGoalsScoredPercentage
{
    NSInteger fieldGoalsAttempted = fieldGoalsMissed + fieldGoalsScored;
    if (fieldGoalsAttempted > 0)
        return (fieldGoalsScored * 100 / fieldGoalsAttempted);
    return -1;
}

- (NSInteger) threePointFieldGoalsScoredPercentage
{
    NSInteger threePointFieldGoalsAttempted = threePointFieldGoalsMissed + threePointFieldGoalsScored;
    if (threePointFieldGoalsAttempted > 0)
        return (threePointFieldGoalsScored * 100 / threePointFieldGoalsAttempted);
    return -1;
}

@end
