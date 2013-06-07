//
//  SoccerTeam.m
//  499
//
//  Created by Ali ElSayed on 10/27/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "SoccerTeam.h"

@implementation SoccerTeam

- (id) init
{
    self = [super init];
    if (self)
    {
        teamName = @"";
        teamID = 0;
        goalsScored = 0;
        totalShots = 0;
        shotsOnTarget = 0;
        shotsOffTarget = 0;
        dribblesWon = 0;
        assists = 0;
        crosses = 0;
        totalPasses = 0;
        passesComplete = 0;
        passesIncomplete = 0;
        tackles = 0;
        interceptions = 0;
        saves = 0;
        blocks = 0;
        freeKicksTaken = 0;
        cornersTaken = 0;
        penaltiesTaken = 0;
        offsides = 0;
        foulsCommitted = 0;
        yellowCards = 0;
        redCards = 0;
        ownGoals = 0;
        numberOfPlayers = 0;
        players = [[NSMutableArray alloc] init]; // init players array
    }
    return self;
}

- (id) teamName: (NSString*) _teamName
{
    teamName = _teamName;
    return self;
}

- (id) teamID: (NSInteger) _teamID
{
    teamID = _teamID;
    return self;
}

- (SoccerPlayer*) createPlayer: (NSString*) _name: (NSInteger) _jerseyNumber: (NSInteger) _playerID
{
    SoccerPlayer *player = [self findPlayerWithID: _playerID];
    if (player);
    else
    {
        player = [[SoccerPlayer alloc] init];
        [player name: _name];
        [player jerseyNumber: _jerseyNumber];
        [player teamID: teamID]; // The team's teamID needs to be set before a player is being created!
        [player playerID: _playerID];
        [player teamName: teamName]; // Team name needs to be set before a player is being created!
        [players addObject: player]; // Add the player to the array
    }
    return player;
    
}

- (SoccerPlayer*) createPlayerWithID: (NSInteger) _playerID // The tag is one set in interface builder.
{
    SoccerPlayer *player = [self findPlayerWithID: _playerID];
    if (player);
    else
    {
        player = [[SoccerPlayer alloc] init];
        [player playerID: _playerID];
        [players addObject: player];
    }
    return player;
}

- (SoccerPlayer*) findPlayerWithID: (NSInteger) _playerID
{
    // "Old way"
    SoccerPlayer *foundPlayer = nil;
    for (SoccerPlayer * aPlayer in players)
    {
        if (aPlayer.playerID == _playerID)
        {
            foundPlayer = aPlayer;
        }
    }
    return foundPlayer;
    // New way below (iOS 4 APIs) -- to be tested later, and may replace the code above
    // NSUInteger index = [players indexOfObjectPassingTest:^BOOL(SoccerPlayer *player, NSUInteger index, BOOL *stop) {
    //    return player.playerID == _playerID;
    // }];
    // foundPlayer = [players objectAtIndex:index];
}

- (void) updateTeamStats
{
    NSInteger _goalsScored = 0, _shotsOnTarget = 0, _shotsOffTarget = 0, _dribblesWon = 0;
    NSInteger _freeKicksTaken = 0, _cornersTaken = 0, _offsides = 0, _penaltiesTaken= 0;
    NSInteger _foulsCommitted = 0, _yellowCards = 0, _redCards = 0, _ownGoals = 0;
    NSInteger _assists = 0, _passesIncomplete = 0, _passesComplete = 0, _crosses = 0;
    NSInteger _tackles = 0, _saves = 0, _interceptions = 0, _blocks = 0;
    for (NSInteger i = 0; i < players.count; i++) // Loop until the team stats are updated.
    {
        SoccerPlayer *player = [players objectAtIndex:i];
        //
        _goalsScored += [player goalsScored];
        _shotsOnTarget += [player shotsOnTarget];
        _shotsOffTarget += [player shotsOffTarget];
        _dribblesWon += [player dribblesWon];
        //
        //
        _assists += [player assists];
        _passesComplete += [player passesComplete];
        _passesIncomplete += [player passesIncomplete];
        _crosses += [player crosses];
        //
        //
        _tackles += [player tackles];
        _saves += [player saves];
        _interceptions += [player interceptions];
        _blocks += [player blocks];
        //
        _freeKicksTaken += [player freeKicksTaken];
        _cornersTaken += [player cornersTaken];
        _penaltiesTaken += [player penaltiesTaken];
        _offsides += [player offsides];
        //
        _foulsCommitted += [player foulsCommitted];
        _yellowCards += [player yellowCards];
        _redCards += [player redCards];
        _ownGoals += [player ownGoals];
    }
    // Update all data
    goalsScored = _goalsScored;
    shotsOnTarget = _shotsOnTarget;
    shotsOffTarget = _shotsOffTarget;
    dribblesWon = _dribblesWon;
    //
    assists = _assists;
    crosses = _crosses;
    passesComplete = _passesComplete;
    passesIncomplete = _passesIncomplete;
    //
    tackles = _tackles;
    interceptions = _interceptions;
    saves = _saves;
    blocks = _blocks;
    //
    freeKicksTaken = _freeKicksTaken;
    cornersTaken = _cornersTaken;
    penaltiesTaken = _penaltiesTaken;
    offsides = _offsides;
    //
    foulsCommitted = _foulsCommitted;
    yellowCards = _yellowCards;
    redCards = _redCards;
    ownGoals = _ownGoals;
}
//
- (NSMutableArray*) players
{
    return players;
}

- (NSString*) teamName
{
    return teamName;
}

- (NSInteger) teamID
{
    return teamID;
}

//
- (NSInteger) goalsScored
{
    return goalsScored;
}

- (NSInteger) totalShots
{
    return shotsOffTarget + shotsOnTarget;
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

//
- (NSInteger) assists
{
    return assists;
}

- (NSInteger) crosses
{
    return crosses;
}

- (NSInteger) totalPasses
{
    return passesComplete + passesIncomplete;
}

- (NSInteger) passesComplete
{
    return passesComplete;
}

- (NSInteger) passesIncomplete
{
    return passesIncomplete;
}

//
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

//
- (NSInteger) freeKicksTaken
{
    return freeKicksTaken;
}

- (NSInteger) cornersTaken
{
    return cornersTaken;
}

- (NSInteger) penaltiesTaken
{
    return penaltiesTaken;
}

- (NSInteger) offsides
{
    return offsides;
}


//
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

//
- (NSInteger) numberOfPlayers
{
    return players.count;
}

- (NSInteger) passAccuracyPercentage
{
    totalPasses = passesComplete + passesIncomplete;
    if (totalPasses > 0) {
        NSLog(@"%d", passesComplete * 100 / totalPasses);
        return (passesComplete * 100 / totalPasses);
    }
    return -1;
}

- (NSInteger) shotAccuracyPercentage
{
    totalShots = shotsOnTarget + shotsOffTarget;
    if (totalShots > 0) {
        NSLog(@"%d", shotsOnTarget * 100 / totalShots);
        return (shotsOnTarget * 100 / totalShots);
    }
    return -1;
}

@end
