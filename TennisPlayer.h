//
//  TennisPlayer.h
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 12/11/12.
//  Copyright (c) 2012 Scorekeeper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TennisPlayer : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger totalAces;
@property (nonatomic, assign) NSInteger totalWinners;
@property (nonatomic, assign) NSInteger totalDoubleFaults;
@property (nonatomic, assign) NSInteger totalUnforcedErrors;
@property (nonatomic, assign) NSInteger aces;
@property (nonatomic, assign) NSInteger winners;
@property (nonatomic, assign) NSInteger doubleFaults;
@property (nonatomic, assign) NSInteger unforcedErrors;
@property (nonatomic, assign) NSInteger totalPoints;
@property (nonatomic, assign) NSInteger gamePoints;
@property (nonatomic, assign) NSInteger scorePoints; // special var used to help compute the score
@property (nonatomic, strong) NSString *points; // points of the current set
@property (nonatomic, assign) NSInteger set1Score;
@property (nonatomic, assign) NSInteger set2Score;
@property (nonatomic, assign) NSInteger set3Score;
@property (nonatomic, assign) NSInteger set4Score;
@property (nonatomic, assign) NSInteger set5Score;
@property (nonatomic, assign) NSInteger set6Score; // infinity set

- (void) newGame;
//- (void) newSet;

- (void) incrementAces;
- (void) incrementWinners;
- (void) incrementDoubleFaults;
- (void) incrementUnforcedErrors;

- (void) decrementAces;
- (void) decrementWinners;
- (void) decrementDoubleFaults;
- (void) decrementUnforcedErrors;

@end
