//
//  TennisPlayer.m
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 12/11/12.
//  Copyright (c) 2012 Scorekeeper. All rights reserved.
//

#import "TennisPlayer.h"

@implementation TennisPlayer

- (id) init
{
    self = [super init];
    if (self)
    {
        self.name = @"";
        self.aces = 0;
        self.winners = 0;
        self.doubleFaults = 0;
        self.unforcedErrors = 0;
        self.points = @"0";
        self.gamePoints = 0;
        self.scorePoints = 0;
        self.totalPoints = 0;
        self.totalAces = 0;
        self.totalWinners = 0;
        self.totalDoubleFaults = 0;
        self.totalUnforcedErrors = 0;
        self.set1Score = -1;
        self.set2Score = -1;
        self.set3Score = -1;
        self.set4Score = -1;
        self.set5Score = -1;
        self.set6Score = -1;
    }
    return self;
}

- (void) newGame
{
    self.gamePoints = 0;
    self.aces = 0;
    self.winners = 0;
    self.doubleFaults = 0;
    self.unforcedErrors = 0;
    self.scorePoints = 0;
}

- (void) incrementAces
{
    self.aces++;
    self.totalAces++;
    self.gamePoints++;
    self.totalPoints++;
    self.scorePoints++;
}
- (void) incrementWinners
{
    self.winners++;
    self.totalWinners++;
    self.gamePoints++;
    self.totalPoints++;
    self.scorePoints++;
}
- (void) incrementDoubleFaults
{
    self.doubleFaults++;
    self.totalDoubleFaults++;
    //self.gamePoints++;
    //self.totalPoints++;
    self.scorePoints++;
}
- (void) incrementUnforcedErrors
{
    self.unforcedErrors++;
    self.totalUnforcedErrors++;
    //self.gamePoints++;
    //self.totalPoints++;
    self.scorePoints++;
}

- (void) decrementAces
{
    if (self.aces > 0) {
        self.aces--;
        self.totalAces--;
        self.gamePoints--;
        self.totalPoints--;
        self.scorePoints--;
    }
}
- (void) decrementWinners
{
    if (self.winners > 0) {
        self.winners--;
        self.totalWinners--;
        self.gamePoints--;
        self.totalPoints--;
        self.scorePoints--;
    }
}
- (void) decrementDoubleFaults
{
    if (self.doubleFaults > 0) {
        self.doubleFaults--;
        self.totalDoubleFaults--;
        //self.gamePoints--;
        //self.totalPoints--;
        self.scorePoints--;
    }
}
- (void) decrementUnforcedErrors
{
    if (self.unforcedErrors > 0) {
        self.unforcedErrors--;
        self.totalUnforcedErrors--;
        //self.gamePoints--;
        //self.totalPoints--;
        self.scorePoints--;
    }
}


@end
