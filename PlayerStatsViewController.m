//
//  PlayerStatsViewController.m
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/16/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "PlayerStatsViewController.h"

@interface PlayerStatsViewController ()

@end

#define HEADER_HEIGHT 20

@implementation PlayerStatsViewController

@synthesize homeTeamHeaderView = _homeTeamHeaderView;
@synthesize awayTeamHeaderView = _awayTeamHeaderView;

@synthesize homeTeamHeaderCell = _homeTeamHeaderCell;
@synthesize awayTeamHeaderCell = _awayTeamHeaderCell;

@synthesize playerStatsTable = _playerStatsTable;

@synthesize homeTeamName = _homeTeamName;
@synthesize awayTeamName = _awayTeamName;

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
	// Do any additional setup after loading the view.
    _homeTeamHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, HEADER_HEIGHT)];
    _awayTeamHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, HEADER_HEIGHT)];
    static NSString *cellIdentifier = @"statsTableHeaderCell";
    
    _homeTeamHeaderCell = (PlayerStatsCell*) [_playerStatsTable dequeueReusableCellWithIdentifier:cellIdentifier];
    if (_homeTeamHeaderCell == nil)
    {
        _homeTeamHeaderCell = [[PlayerStatsCell alloc] initWithStyle:UITableViewCellSelectionStyleNone reuseIdentifier:cellIdentifier];
    }
    // configure cell here...
    if (sportName == @"Soccer")
    {
        _homeTeamHeaderCell.playerName.text = self.homeTeamName;
        _homeTeamHeaderCell.statLabel1.text = @"G";
        _homeTeamHeaderCell.statLabel2.text = @"A";
        _homeTeamHeaderCell.statLabel3.text = @"S";
        _homeTeamHeaderCell.statLabel4.text = @"OT";
        _homeTeamHeaderCell.statLabel5.text = @"F";
        _homeTeamHeaderCell.statLabel6.text = @"YC";
        _homeTeamHeaderCell.statLabel7.text = @"RC";
    }
    else if (sportName == @"Basketball")
    {
        _homeTeamHeaderCell.playerName.text = self.homeTeamName;
        _homeTeamHeaderCell.statLabel1.text = @"FG%";
        _homeTeamHeaderCell.statLabel2.text = @"3P%";
        _homeTeamHeaderCell.statLabel3.text = @"FT%";
        _homeTeamHeaderCell.statLabel4.text = @"A";
        _homeTeamHeaderCell.statLabel5.text = @"R";
        _homeTeamHeaderCell.statLabel6.text = @"B";
        _homeTeamHeaderCell.statLabel7.text = @"PTS";
    }
    else if (sportName == @"Tennis")
    {
        _homeTeamHeaderCell.playerName.text = @"Players";
        _homeTeamHeaderCell.statLabel1.text = @"PTS";
        _homeTeamHeaderCell.statLabel2.text = @"1";
        _homeTeamHeaderCell.statLabel3.text = @"2";
        _homeTeamHeaderCell.statLabel4.text = @"3";
        _homeTeamHeaderCell.statLabel5.text = @"4";
        _homeTeamHeaderCell.statLabel6.text = @"5";
        _homeTeamHeaderCell.statLabel7.text = @"";
        // Table is too short to scroll
        _playerStatsTable.scrollEnabled = NO;
        //_playerStatsTable.separatorColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.0];
    }
    if (sportName == @"Tennis") {
        _homeTeamHeaderCell.backgroundColor = [UIColor blackColor];
    }
    else
        _homeTeamHeaderCell.backgroundColor = [UIColor orangeColor];
    _homeTeamHeaderCell.frame = CGRectMake(0.0, 0.0, 320.0, HEADER_HEIGHT);

    [_homeTeamHeaderView addSubview:_homeTeamHeaderCell];
    
    _awayTeamHeaderCell = (PlayerStatsCell*) [_playerStatsTable dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (_awayTeamHeaderCell == nil)
    {
        _awayTeamHeaderCell = [[PlayerStatsCell alloc] initWithStyle:UITableViewCellSelectionStyleNone reuseIdentifier:cellIdentifier];
    }
    // configure cell here...
    if (sportName == @"Soccer")
    {
        _awayTeamHeaderCell.playerName.text = self.awayTeamName;
        _awayTeamHeaderCell.statLabel1.text = @"G";
        _awayTeamHeaderCell.statLabel2.text = @"A";
        _awayTeamHeaderCell.statLabel3.text = @"S";
        _awayTeamHeaderCell.statLabel4.text = @"OT";
        _awayTeamHeaderCell.statLabel5.text = @"F";
        _awayTeamHeaderCell.statLabel6.text = @"YC";
        _awayTeamHeaderCell.statLabel7.text = @"RC";
    }
    else if (sportName == @"Basketball")
    {
        _awayTeamHeaderCell.playerName.text = self.awayTeamName;
        _awayTeamHeaderCell.statLabel1.text = @"FG%";
        _awayTeamHeaderCell.statLabel2.text = @"3P%";
        _awayTeamHeaderCell.statLabel3.text = @"FT%";
        _awayTeamHeaderCell.statLabel4.text = @"A";
        _awayTeamHeaderCell.statLabel5.text = @"R";
        _awayTeamHeaderCell.statLabel6.text = @"B";
        _awayTeamHeaderCell.statLabel7.text = @"PTS";
    }
    _awayTeamHeaderCell.backgroundColor = [UIColor darkGrayColor];
    _awayTeamHeaderCell.frame = CGRectMake(0.0, 0.0, 320.0, HEADER_HEIGHT);
    
    [_awayTeamHeaderView addSubview:_awayTeamHeaderCell];
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.playerStatsTable reloadData];    
}

- (void) updateTable
{
    [self.playerStatsTable reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // Returns a UIView which will be the custom uitable header
    // The view (header) is customised in viewDidLoad instead of this function
    // which is better for the performance of the table and the app overall
    
    if(section == 0)
    {
        return _homeTeamHeaderView;
    }
    else if(section == 1)
    {
        return _awayTeamHeaderView;
    }
    return nil;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return HEADER_HEIGHT;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (sportName == @"Tennis")
    {
        return 1;
    }
    else
        return 2; // There are two teams
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{

    cell.backgroundColor = (indexPath.row % 2) ? [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0]:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (sportName == @"Tennis")
    {
        return 2; // for now
    }
    // Each section will have a certain number of rows
    // depending on the number of players on the team
    // Section 0 is the home team
    // Section 1 is the away team
    else
    {
        if (section == 0)
        {
            return homeTeam.count;
        }
        else if (section == 1)
        {
            return awayTeam.count;
        }
    }
    return 0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 33; // Row cell height
}

- (NSMutableArray*) team: (NSInteger) _teamID
{
    if (_teamID == 0) {
        return homeTeam;
    } else {
        return awayTeam;
    }
}

- (NSString*) convertToString: (NSInteger) number
{
    return [NSString stringWithFormat:@"%d", number];
}

// Add cells to table
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"playerStatsCell";
    PlayerStatsCell *cell = (PlayerStatsCell*) [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[PlayerStatsCell alloc] initWithStyle:UITableViewCellSelectionStyleNone reuseIdentifier:cellIdentifier];
    }
    // configure cell here...
    if (sportName == @"Soccer")
    {
        
        SoccerPlayer *player = [[self team:indexPath.section] objectAtIndex:indexPath.row];
        cell.playerName.text = player.name;
        cell.statLabel1.text = [self convertToString:player.goalsScored];
        cell.statLabel2.text = [self convertToString:player.assists];
        cell.statLabel3.text = [self convertToString:player.totalShots];
        cell.statLabel4.text = [self convertToString:player.shotsOnTarget];
        cell.statLabel5.text = [self convertToString:player.foulsCommitted];
        cell.statLabel6.text = [self convertToString:player.yellowCards];
        cell.statLabel7.text = [self convertToString:player.redCards];
    }
    else if (sportName == @"Basketball")
    {
        BasketballPlayer *player = [[self team:indexPath.section] objectAtIndex:indexPath.row];
        cell.playerName.text = player.name;
        if (player.fieldGoalsScoredPercentage == -1) {
            cell.statLabel1.text = @"-";
        } else {
            cell.statLabel1.text = [self convertToString:player.fieldGoalsScoredPercentage];
        }
        if (player.threePointFieldGoalsScoredPercentage == -1) {
            cell.statLabel2.text = @"-";
        } else {
            cell.statLabel2.text = [self convertToString:player.threePointFieldGoalsScoredPercentage];
        }
        if (player.freeThrowsScoredPercentage == -1) {
            cell.statLabel3.text = @"-";
        } else {
            cell.statLabel3.text = [self convertToString:player.freeThrowsScoredPercentage];
        }
        cell.statLabel4.text = [self convertToString:player.assists];
        cell.statLabel5.text = [self convertToString:player.rebounds];
        cell.statLabel6.text = [self convertToString:player.blocks];
        cell.statLabel7.text = [self convertToString:player.totalPoints];
    }
    else if (sportName == @"Tennis")
    {
        TennisPlayer *player = [[self team:indexPath.section] objectAtIndex:indexPath.row];
        if (player.name.length == 0) {
            cell.playerName.text = [NSString stringWithFormat:@"Player %i", indexPath.row];
        }
        else
        {
            cell.playerName.text = player.name;
        }
        cell.statLabel1.text = player.points;
        if (player.set1Score == -1) {
            cell.statLabel2.text = @"-";
        }
        else
        {
            cell.statLabel2.text = [self convertToString:player.set1Score];
        }
        if (player.set2Score == -1) {
            cell.statLabel3.text = @"-";
        }
        else
        {
            cell.statLabel3.text = [self convertToString:player.set2Score];
        }
        if (player.set3Score == -1) {
            cell.statLabel4.text = @"-";
        }
        else
        {
            cell.statLabel4.text = [self convertToString:player.set3Score];
        }
        if (player.set4Score == -1) {
            cell.statLabel5.text = @"-";
        }
        else
        {
            cell.statLabel5.text = [self convertToString:player.set4Score];
        }
        if (player.set5Score == -1) {
            cell.statLabel6.text = @"-";
        }
        else
        {
            cell.statLabel6.text = [self convertToString:player.set5Score];
        }
        if (player.set6Score == -1) {
            cell.statLabel7.text = @"";
        }
        else
        {
            cell.statLabel7.text = [self convertToString:player.set6Score];
            if (_homeTeamHeaderCell.statLabel7.text.length == 0) {
                _homeTeamHeaderCell.statLabel7.text = @"∞";
            }
        }
        
    }
    return cell;
}

- (id) sportName: (NSString*) _sportName
{
    sportName = _sportName;
    return self;
}

- (id) homeTeam: (NSMutableArray*) _homeTeam;
{
    homeTeam = _homeTeam;
    return self;
}

- (id) awayTeam: (NSMutableArray*) _awayTeam;
{
    awayTeam = _awayTeam;
    return self;
}

- (NSString*) sportName
{
    return sportName;
}

- (NSMutableArray*) homeTeam
{
    return homeTeam;
}

- (NSMutableArray*) awayTeam
{
    return awayTeam;
}

@end
