//
//  MatchFactsViewController.h
//  499
//
//  Created by Ali ElSayed on 11/3/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoccerTeam.h"
#import "BasketballTeam.h"
#import "StatCell.h"
#import "TennisPlayer.h"

@interface MatchFactsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSString *sportName;
    BasketballTeam *basketballHomeTeam, *basketballAwayTeam;
    SoccerTeam *soccerHomeTeam, *soccerAwayTeam;
    IBOutlet UITableView * statsTable;
}

@property (nonatomic, strong) UITableView *statsTable;

- (id) sportName: (NSString*) _sportName;

- (id) soccerHomeTeam: (SoccerTeam*) _soccerHomeTeam;
- (id) soccerAwayTeam: (SoccerTeam*) _soccerAwayTeam;

- (id) basketballHomeTeam: (BasketballTeam*) _basketballHomeTeam;
- (id) basketballAwayTeam: (BasketballTeam*) _basketballAwayTeam;

- (NSString*) sportName;

- (SoccerTeam*) soccerHomeTeam;
- (SoccerTeam*) soccerAwayTeam;

- (BasketballTeam*) basketballHomeTeam;
- (BasketballTeam*) basketballAwayTeam;

- (void) updateTable;

@property (strong, nonatomic) TennisPlayer *player1;
@property (strong, nonatomic) TennisPlayer *player2;

@property (strong, nonatomic) StatCell *headerStatCell;
@property (nonatomic, strong) UIView *headerStatCellView;

@end
