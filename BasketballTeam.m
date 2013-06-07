//
//  BasketballTeam.m
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/7/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "BasketballTeam.h"

@implementation BasketballTeam

- (id) init
{
    self = [super init];
    if (self)
    {
        name = @"";
        teamID = 0;
        totalPoints = 0;
        fieldGoalsScored = 0;
        fieldGoalsMissed = 0;
        freeThrowsScored = 0;
        freeThrowsMissed = 0;
        threePointFieldGoalsScored = 0;
        threePointFieldGoalsMissed = 0;
        assists = 0;
        steals = 0;
        fouls = 0;
        offensiveRebounds = 0;
        defensiveRebounds = 0;
        blocks = 0;
        turnovers = 0;
        numberOfPlayers = 0;
        players = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id) name: (NSString*) _name
{
    name = _name;
    return self;
}
- (id) teamID: (NSInteger) _teamID
{
    teamID = _teamID;
    return self;
}

// Create player with a name, number, and ID
- (BasketballPlayer*) createPlayerWithName: (NSString*) _name withNumber: (NSInteger) _jerseyNumber withID:(NSInteger) _playerID
{
    BasketballPlayer *player = [self findPlayerWithID: _playerID];
    if (player);
    else
    {
        player = [[BasketballPlayer alloc] init];
        [player name: _name];
        [player jerseyNumber: _jerseyNumber];
        [player playerID: _playerID];
        [player teamID: teamID];
        [player teamName: name];
        [players addObject: player]; // Add player to array
    }
    return player;
}
- (BasketballPlayer*) createPlayerWithID: (NSInteger) _playerID
{
    BasketballPlayer *player = [self findPlayerWithID: _playerID];
    if (player); // If the player already exists, return the existing player
    else
    {
        player = [[BasketballPlayer alloc] init];
        [player playerID: _playerID];
        [players addObject: player];
    }
    return player;
}
// return player with ID
- (BasketballPlayer*) findPlayerWithID: (NSInteger) _playerID
{
    BasketballPlayer *foundPlayer = nil;
    for (BasketballPlayer *aPlayer in players)
    {
        if (aPlayer.playerID == _playerID)
            foundPlayer = aPlayer;
    }
    return foundPlayer;
}
// Update team stats
- (void) updateTeamStats
{
    NSInteger _totalPoints = 0;
    NSInteger _fieldGoalsScored = 0;
    NSInteger _fieldGoalsMissed = 0;
    NSInteger _freeThrowsScored = 0;
    NSInteger _freeThrowsMissed = 0;
    NSInteger _threePointFieldGoalsScored = 0;
    NSInteger _threePointFieldGoalsMissed = 0;
    NSInteger _putbackScored = 0;
    NSInteger _putbackMissed = 0;
    NSInteger _assists = 0;
    NSInteger _steals = 0;
    NSInteger _fouls = 0;
    NSInteger _blocks = 0;
    NSInteger _turnovers = 0;
    NSInteger _offensiveRebounds = 0;
    NSInteger _defensiveRebounds = 0;
    for (NSInteger i = 0; i < players.count; i++)
    {
        BasketballPlayer *player = [players objectAtIndex:i];
        _totalPoints += [player totalPoints];
        _fieldGoalsScored += [player fieldGoalsScored];
        _fieldGoalsMissed += [player fieldGoalsMissed];
        _freeThrowsMissed += [player freeThrowsMissed];
        _freeThrowsScored += [player freeThrowsScored];
        _threePointFieldGoalsMissed += [player threePointFieldGoalsMissed];
        _threePointFieldGoalsScored += [player threePointFieldGoalsScored];
        _putbackMissed += [player putbackMissed];
        _putbackScored += [player putbackScored];
        _assists += [player assists];
        _steals += [player steals];
        _fouls += [player fouls];
        _blocks += [player blocks];
        _turnovers += [player turnovers];
        _offensiveRebounds += [player offensiveRebounds];
        _defensiveRebounds += [player defensiveRebounds];
    }
    // Update class data
    totalPoints = _totalPoints;
    fieldGoalsScored = _fieldGoalsScored;
    fieldGoalsMissed = _fieldGoalsMissed;
    freeThrowsScored = _freeThrowsScored;
    freeThrowsMissed = _freeThrowsMissed;
    threePointFieldGoalsScored = _threePointFieldGoalsScored;
    threePointFieldGoalsMissed = _threePointFieldGoalsMissed;
    putbackMissed = _putbackMissed;
    putbackScored = _putbackScored;
    assists = _assists;
    steals = _steals;
    fouls = _fouls;
    blocks = _blocks;
    turnovers = _turnovers;
    offensiveRebounds = _offensiveRebounds;
    defensiveRebounds = _defensiveRebounds;
}

// Return the array that's storing all the players

- (NSMutableArray*) players
{
    return players;
}

- (NSString*) name
{
    return name;
}

- (NSInteger) teamID
{
    return teamID;
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

- (NSInteger) putbackScored
{
    return putbackScored;
}

- (NSInteger) putbackMissed
{
    return putbackMissed;
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

- (NSInteger) blocks
{
    return blocks;
}

- (NSInteger) turnovers
{
    return turnovers;
}

- (NSInteger) offensiveRebounds
{
    return offensiveRebounds;
}

- (NSInteger) defensiveRebounds
{
    return defensiveRebounds;
}

- (NSInteger) numberOfPlayers
{
    return players.count;
}

- (NSInteger) fieldGoalsAttempted
{
    return fieldGoalsMissed + fieldGoalsScored;
}
- (NSInteger) freeThrowsAttempted
{
    return freeThrowsMissed + freeThrowsScored;
}
- (NSInteger) threePointFieldGoalsAttempted
{
    return threePointFieldGoalsMissed + threePointFieldGoalsScored;
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

- (NSInteger) rebounds
{
    return offensiveRebounds + defensiveRebounds;
}

@end
