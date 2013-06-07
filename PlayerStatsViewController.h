//
//  PlayerStatsViewController.h
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/16/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoccerPlayer.h"
#import "BasketballPlayer.h"
#import "TennisPlayer.h"
#import "PlayerStatsCell.h"
@interface PlayerStatsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSString *sportName, *homeTeamName, *awayTeamName;
    NSMutableArray *homeTeam, *awayTeam;
    IBOutlet UITableView *playerStatsTable;
}

@property (nonatomic, strong) UITableView *playerStatsTable;

@property (nonatomic, strong) UIView *homeTeamHeaderView;
@property (nonatomic, strong) UIView *awayTeamHeaderView;
@property (nonatomic, strong) PlayerStatsCell *homeTeamHeaderCell;
@property (nonatomic, strong) PlayerStatsCell *awayTeamHeaderCell;

@property (nonatomic, strong) NSString* homeTeamName;
@property (nonatomic, strong) NSString* awayTeamName;

- (void) updateTable;

- (id) sportName: (NSString*) _sportName;
- (id) homeTeam: (NSMutableArray*) _homeTeam;
- (id) awayTeam: (NSMutableArray*) _awayTeam;

- (NSString*) sportName;
- (NSMutableArray*) homeTeam;
- (NSMutableArray*) awayTeam;

@end
