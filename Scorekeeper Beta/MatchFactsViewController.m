//
//  MatchFactsViewController.m
//  499
//
//  Created by Ali ElSayed on 11/3/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "MatchFactsViewController.h"

#define HOME_TEAM_ID            0
#define AWAY_TEAM_ID            1

#define NUM_OF_SOCCER_STATS     16
#define NUM_OF_BASKETBALL_STATS 14
#define NUM_OF_TENNIS_STATS     5

@interface MatchFactsViewController ()

@end

@implementation MatchFactsViewController

@synthesize statsTable = _statsTable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.statsTable.backgroundColor = [UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1];
    if (sportName == @"Tennis")
    {
        //NSLog(@"Sport: Tennis. Loading custom header...");
        //self.statsTable.scrollEnabled = NO;
        _headerStatCellView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 20)];
        static NSString *cellIdentifier = @"headerStatCell";
        
        _headerStatCell = (StatCell*) [_statsTable dequeueReusableCellWithIdentifier:cellIdentifier];
        if (_headerStatCell == nil)
        {
            _headerStatCell = [[StatCell alloc] initWithStyle:UITableViewCellSelectionStyleNone reuseIdentifier:cellIdentifier];
        }

        _headerStatCell.backgroundColor = [UIColor cyanColor];
        _headerStatCell.frame = CGRectMake(0.0, 0.0, 320.0, 20);
        _headerStatCell.homeTeamStat.text = self.player1.name;
        _headerStatCell.awayTeamStat.text = self.player2.name;
        NSLog(@"%@ vs %@", self.player1.name, self.player2.name);
        [_headerStatCellView addSubview:_headerStatCell];
    }
}

- (void) viewWillAppear:(BOOL)animated
{
    if (sportName == @"Soccer") {
        [soccerHomeTeam updateTeamStats];
        [soccerAwayTeam updateTeamStats];
    }
    else if(sportName == @"Basketball")
    {
        [basketballHomeTeam updateTeamStats];
        [basketballAwayTeam updateTeamStats];
    }
    [self.statsTable reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(sportName == @"Tennis")
    {
        return _headerStatCellView;
    }
    return nil;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (sportName == @"Tennis") {
        return 20;
    }
	return 0;
}


- (BasketballTeam*) getBasketballTeam: (NSInteger) teamID
{
    if (teamID == HOME_TEAM_ID)
    {
        return basketballHomeTeam;
    }
    else
    {
        return basketballAwayTeam;
    }
}

- (void) updateTable
{
    [self.statsTable reloadData];
}

- (NSString*) getTennisStatLabel: (NSInteger) row
{
    switch (row) {
        case 0:
            return @"Aces";
            break;
        case 1:
            return @"Double Faults";
            break;
        case 2:
            return @"Winners";
            break;
        case 3:
            return @"Unforced Errors";
            break;
        case 4:
            return @"Total Points Won";
            break;
        default:
            break;
    }
    return @"";
}

- (NSString*) getBasketballStatLabel: (NSInteger) row
{
    switch (row) {
        case 0:
            return @"Points";
            break;
        case 1:
            return @"FG Made";
            break;
        case 2:
            return @"FG Attempted";
            break;
        case 3:
            return @"FG %";
            break;
        case 4:
            return @"3P Made";
            break;
        case 5:
            return @"3P Attempted";
            break;
        case 6:
            return @"3P %";
            break;
        case 7:
            return @"FT Made";
            break;
        case 8:
            return @"FT Attempted";
            break;
        case 9:
            return @"FT %";
            break;
        case 10:
            return @"Rebounds";
            break;
        case 11:
            return @"Steals";
            break;
        case 12:
            return @"Turnovers";
            break;
        case 13:
            return @"Fouls";
            break;
        default:
            break;
    }
    return @"";
}

- (NSInteger) getTennisStatForRow: (NSInteger) row forPlayer: (TennisPlayer*) player1: (TennisPlayer*) player2
{
    switch (row) {
        case 0:
            return player1.totalAces;
            break;
        case 1:
            return player1.totalDoubleFaults;
            break;
        case 2:
            return player1.totalWinners;
            break;
        case 3:
            return player1.totalUnforcedErrors;
            break;
        case 4:
            return player1.totalAces + player1.totalWinners + player2.totalDoubleFaults + player2.totalUnforcedErrors;
            break;
        default:
            break;
    }
    return 0;
}

- (NSInteger) getBasketballStatForRow: (NSInteger) row forTeamWithID: (NSInteger) teamID
{
    switch (row) {
        case 0:
            return [[self getBasketballTeam:teamID] totalPoints];
            break;
        case 1:
            return [[self getBasketballTeam:teamID] fieldGoalsScored];
            break;
        case 2:
            return [[self getBasketballTeam:teamID] fieldGoalsAttempted];
            break;
        case 3:
            return [[self getBasketballTeam:teamID] fieldGoalsScoredPercentage];
            break;
        case 4:
            return [[self getBasketballTeam:teamID] threePointFieldGoalsScored];
            break;
        case 5:
            return [[self getBasketballTeam:teamID] threePointFieldGoalsAttempted];
            break;
        case 6:
            return [[self getBasketballTeam:teamID] threePointFieldGoalsScoredPercentage];
            break;
        case 7:
            return [[self getBasketballTeam:teamID] freeThrowsScored];
            break;
        case 8:
            return [[self getBasketballTeam:teamID] freeThrowsAttempted];
            break;
        case 9:
            return [[self getBasketballTeam:teamID] freeThrowsScoredPercentage];
            break;
        case 10:
            return [[self getBasketballTeam:teamID] rebounds];
            break;
        case 11:
            return [[self getBasketballTeam:teamID] steals];
            break;
        case 12:
            return [[self getBasketballTeam:teamID] turnovers];
            break;
        case 13:
            return [[self getBasketballTeam:teamID] fouls];
            break;
        default:
            break;
    }
    return 0;
}

- (NSString*) getSoccerStatLabel: (NSInteger) row
{
    switch (row) {
        case 0:
            return @"Goals";
            break;
        case 1:
            return @"Shots";
            break;
        case 2:
            return @"Shots On Target";
            break;
        case 3:
            return @"Shot Accuracy %";
            break;
        case 4:
            return @"Passes";
            break;
        case 5:
            return @"Passes Complete";
            break;
        case 6:
            return @"Pass Complete %";
            break;
        case 7:
            return @"Crosses";
            break;
        case 8:
            return @"Tackles";
            break;
        case 9:
            return @"Offsides";
            break;
        case 10:
            return @"Fouls";
            break;
        case 11:
            return @"Yellow Cards";
            break;
        case 12:
            return @"Red Cards";
            break;
        case 13:
            return @"Freekicks";
            break;
        case 14:
            return @"Corners";
            break;
        case 15:
            return @"Penalties";
            break;
        default:
            break;
    }
    return @"";
}

- (SoccerTeam*) getSoccerTeam: (NSInteger) teamID
{
    if (teamID == HOME_TEAM_ID) {
        return soccerHomeTeam;
    } else {
        return soccerAwayTeam;
    }
}

- (NSInteger) getSoccerStatForRow: (NSInteger) row forTeamWithID: (NSInteger) teamID
{
    switch (row) {
        case 0:
            if (teamID == 0)
            {
                return [[self getSoccerTeam:teamID] goalsScored] + [[self getSoccerTeam:1] ownGoals];
            }
            else
            {
                return [[self getSoccerTeam:teamID] goalsScored] + [[self getSoccerTeam:0] ownGoals];
            }
            break;
        case 1:
            return [[self getSoccerTeam:teamID] totalShots];
            break;
        case 2:
            return [[self getSoccerTeam:teamID] shotsOnTarget];
            break;
        case 3:
            return [[self getSoccerTeam:teamID] shotAccuracyPercentage];
            break;
        case 4:
            return [[self getSoccerTeam:teamID] totalPasses];
            break;
        case 5:
            return [[self getSoccerTeam:teamID] passesComplete];
            break;
        case 6:
            return [[self getSoccerTeam:teamID] passAccuracyPercentage];
            break;
        case 7:
            return [[self getSoccerTeam:teamID] crosses];
            break;
        case 8:
            return [[self getSoccerTeam:teamID] tackles];
            break;
        case 9:
            return [[self getSoccerTeam:teamID] offsides];
            break;
        case 10:
            return [[self getSoccerTeam:teamID] foulsCommitted];
            break;
        case 11:
            return [[self getSoccerTeam:teamID] yellowCards];
            break;
        case 12:
            return [[self getSoccerTeam:teamID] redCards];
            break;
        case 13:
            return [[self getSoccerTeam:teamID] freeKicksTaken];
            break;
        case 14:
            return [[self getSoccerTeam:teamID] cornersTaken];
            break;
        case 15:
            return [[self getSoccerTeam:teamID] penaltiesTaken];
            break;
        default:
            break;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1; // There is only one section
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (sportName == @"Tennis")
    {
        	cell.backgroundColor = (indexPath.row % 2) ? [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0]:[UIColor colorWithRed:0.937 green:0.937 blue:0.937 alpha:1.0];
    }
    else
    {
        cell.backgroundColor = (indexPath.row % 2) ? [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0]:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
    }
    // maybe data should be updated here...
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (sportName == @"Tennis") {
        CGRect bounds = [[UIScreen mainScreen] bounds];
        if (bounds.size.height == 568) {
            return 47;
        }
        else if(bounds.size.height == 480)
        {
            return 29.4;
        }
    }
    return 44; // Row cell height
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (sportName == @"Soccer")
    {
        return NUM_OF_SOCCER_STATS;
    }
    else if (sportName == @"Basketball")
    {
        return NUM_OF_BASKETBALL_STATS;
    }
    else if (sportName == @"Tennis")
    {
        return NUM_OF_TENNIS_STATS;
    }
    return 0;
}
// Add cells to table
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"statCell";
    StatCell *cell = (StatCell*) [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[StatCell alloc] initWithStyle:UITableViewCellSelectionStyleNone reuseIdentifier:cellIdentifier];
    }
    // configure cell here...
    NSInteger homeStat, awayStat;
    if (sportName == @"Soccer")
    {
        cell.statLabel.text = [self getSoccerStatLabel:indexPath.row];
        homeStat = [self getSoccerStatForRow:indexPath.row forTeamWithID:0];
        awayStat = [self getSoccerStatForRow:indexPath.row forTeamWithID:1];
        
    }
    else if (sportName == @"Basketball")
    {
        cell.statLabel.text = [self getBasketballStatLabel:indexPath.row];
        homeStat = [self getBasketballStatForRow: indexPath.row forTeamWithID:0];
        awayStat = [self getBasketballStatForRow: indexPath.row forTeamWithID:1];
                                                                    
    }
    else if (sportName == @"Tennis")
    {
        cell.statLabel.text = [self getTennisStatLabel:indexPath.row];
        [cell.statLabel setFont:[UIFont systemFontOfSize:12]];
        homeStat = [self getTennisStatForRow: indexPath.row forPlayer:self.player1: self.player2];
        awayStat = [self getTennisStatForRow: indexPath.row forPlayer:self.player2: self.player1];
    }
    if (homeStat >= 0)
    {
        cell.homeTeamStat.text = [NSString stringWithFormat:@"%d", homeStat];
        if (sportName == @"Tennis") {
            [cell.homeTeamStat setFont:[UIFont systemFontOfSize:12]];
        }
    }
    else
    {
        cell.homeTeamStat.text = @"-";
    }
    if (awayStat >= 0)
    {
        cell.awayTeamStat.text = [NSString stringWithFormat:@"%d", awayStat];
        if (sportName == @"Tennis") {
            [cell.awayTeamStat setFont:[UIFont systemFontOfSize:12]];
        }
    }
    else
    {
        cell.awayTeamStat.text = @"-";
    }
    return cell;
}

- (id) sportName: (NSString*) _sportName
{
    sportName = _sportName;
    return self;
}

- (NSString*) sportName
{
    return sportName;
}

- (SoccerTeam*) soccerHomeTeam
{
    return soccerHomeTeam;
}

- (SoccerTeam*) soccerAwayTeam
{
    return soccerAwayTeam;
}

- (BasketballTeam*) basketballHomeTeam
{
    return basketballHomeTeam;
}

- (BasketballTeam*) basketballAwayTeam
{
    return basketballAwayTeam;
}

- (id) soccerHomeTeam: (SoccerTeam*) _soccerHomeTeam
{
    soccerHomeTeam = _soccerHomeTeam;
    return self;
}

- (id) soccerAwayTeam: (SoccerTeam*) _soccerAwayTeam
{
    soccerAwayTeam = _soccerAwayTeam;
    return self;
}

- (id) basketballHomeTeam:(BasketballTeam *)_basketballHomeTeam
{
    basketballHomeTeam = _basketballHomeTeam;
    return self;
}

- (id) basketballAwayTeam:(BasketballTeam *)_basketballAwayTeam
{
    basketballAwayTeam = _basketballAwayTeam;
    return self;
}

@end
