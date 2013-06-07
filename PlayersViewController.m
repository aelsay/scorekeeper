//
//  PlayersViewController.m
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/12/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

//#import "PlayersViewController.h"
#import "PlayersViewController.h"
@interface PlayersViewController ()

@end

@implementation PlayersViewController

@synthesize homeTeamTableView = _homeTeamTableView;
@synthesize awayTeamTableView = _awayTeamTableView;

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
    //homeTeamTableView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    //awayTeamTableView.backgroundColor = [UIColor colorWithRed:0.55 green:0.55 blue:0.55 alpha:1];
    statsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"statsViewController"];
    // Send data
    [statsViewController sportName: sportName];
    //if (homeTeam.count < 11 && awayTeam.count < 11) {
        //self.homeTeamTableView.scrollEnabled = NO;
        //self.awayTeamTableView.scrollEnabled = NO;
    //}
    self.homeTeamTableView.backgroundColor = [UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1.0];
    self.awayTeamTableView.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1; // There is one section in both home/away team tables
}

// Number of rows in a table depends on the table that's calling the function
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == [self homeTeamTableView]) // If it's the home team's table
    {
        return homeTeam.count; // Return the home team array size (which contains the number of home players)
    }
    else // Otherwise,
    {
        return awayTeam.count; // Return the away team array size
    }
    //if (homeTeam.count >= awayTeam.count) // Create equal number of cells for both teams regardless of how many players they have
    //{
    //    return homeTeam.count;
    //}
    //else
    //{
    //    return awayTeam.count;
    //}
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(TeamPlayerCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //if (tableView == self.homeTeamTableView) {
    //    cell.backgroundColor = (indexPath.row % 2) ? [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0]:[UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1.0];
    //} else {
	//cell.backgroundColor = (indexPath.row % 2) ? [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.0]:[UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1.0];
    //}
    //if (tableView == self.homeTeamTableView) {
        CGFloat var, diff;
        // diff = 0.1
        // soccer var = 0.025
        // var 0.05 (else)
        // color r = 0.65 g = 0.65 b = 0.65
        if (tableView == self.homeTeamTableView) {
            diff = 0;
        } else {
            diff = 0.01;
        }
        if (sportName == @"Soccer" && (homeTeam.count > 5 || awayTeam.count > 5))
        {
            var = 0.01 * indexPath.row + diff;
        }
        else
        {
            var = 0.02 * indexPath.row + diff;
        }
        cell.backgroundColor = [UIColor colorWithRed:0.88 + var green:0.88 + var blue:0.88 + var alpha:1.0];
        cell.playerNameLabel.textColor = [UIColor colorWithRed:0.32 + var green:0.32 + var blue:0.32 + var alpha:1.0];
        cell.jerseyNumberLabel.textColor = [UIColor colorWithRed:0.32 + var green:0.32 + var blue:0.32 + var alpha:1.0];
    /*}
    else
    {
        CGFloat var;
        if (sportName == @"Soccer" && (homeTeam.count > 5 || awayTeam.count > 5))
            var = 0.025 * indexPath.row;
        else
            var = 0.05 * indexPath.row;
        cell.backgroundColor = [UIColor colorWithRed:0.75 + var green:0.75 + var blue:0.75 + var alpha:1.0];
        cell.playerNameLabel.textColor = [UIColor colorWithRed:0.25 + var green:0.25 + var blue:0.25 + var alpha:1.0];
        cell.jerseyNumberLabel.textColor = [UIColor colorWithRed:0.25 + var green:0.25 + var blue:0.25 + var alpha:1.0];
    }*/
}

// Set the header height!
//- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//
//}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return 33;
    CGRect bounds = [[UIScreen mainScreen] bounds];
    if (bounds.size.height == 568) {
        return 455/11; // which is 41.3636363636...
    }
    else if(bounds.size.height == 480)
    {
        return 33;
    }
    return 33;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Apple says I should do this :p
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //View code here
    /*if (tableView == [self homeTeamTableView]) // self is needed there
    {
        if (sportName == @"Soccer")
        {
            statsViewController.soccerPlayer = [homeTeam objectAtIndex:indexPath.row];
        }
    }
    else
    {
        if (sportName == @"Soccer")
        {
            statsViewController.soccerPlayer = [awayTeam objectAtIndex:indexPath.row];
        }
    }*/
    if (sportName == @"Soccer")
    {
        if (tableView == [self homeTeamTableView])
        {
            statsViewController.soccerPlayer = [homeTeam objectAtIndex:indexPath.row];
        }
        else
        {
            statsViewController.soccerPlayer = [awayTeam objectAtIndex:indexPath.row];
        }
    }
    else if (sportName == @"Basketball")
    {
        if (tableView == [self homeTeamTableView])
        {
            statsViewController.basketballPlayer = [homeTeam objectAtIndex:indexPath.row];
        }
        else
        {
            statsViewController.basketballPlayer = [awayTeam objectAtIndex:indexPath.row];
        }
    }
    statsViewController.homeTeamScoreLabel = self.homeTeamScoreLabel; // Pass the score label
    statsViewController.awayTeamScoreLabel = self.awayTeamScoreLabel; // Pass the score label
    [statsViewController sportName: self.sportName];
    //statsViewController.gameController = self.gameController;
    // Animate to the next view
    // with
    // a
    // cool
    // custom
    // animation!
    [self presentSemiViewController:statsViewController withOptions: @{KNSemiModalOptionKeys.animationDuration: @(0.25)}];
}

- (void) setPlayerCell: (TeamPlayerCell*) cell for: (UITableView*) tableView at: (NSIndexPath*) indexPath
{
    if (sportName == @"Soccer")
    {
        SoccerPlayer *player;
        if (tableView == [self homeTeamTableView]) // self is needed there
        {
            if (indexPath.row < homeTeam.count)
                player = [homeTeam objectAtIndex:[indexPath row]];
        }
        else
        {
            if (indexPath.row < awayTeam.count)
                player = [awayTeam objectAtIndex:[indexPath row]];
        }
        // configure cell here...
        // If the player has a number but no number (0), then but a dash near his/her name.
        if (player.jerseyNumber == 0) // If the player jersey number is 0, then
        {
            if (player.name.length > 0)
            {
                cell.jerseyNumberLabel.text = @"-"; // place a dash instead
            }
            else
            {
                cell.jerseyNumberLabel.text = @"";
            }
        }
        else
        {
            cell.jerseyNumberLabel.text = [NSString stringWithFormat:@"%i", player.jerseyNumber];
        }
        cell.playerNameLabel.text = player.name;
    }
    else if (sportName == @"Basketball")
    {
        BasketballPlayer *player;
        if (tableView == [self homeTeamTableView]) // self is needed there
        {
            if (indexPath.row < homeTeam.count)
                player = [homeTeam objectAtIndex:[indexPath row]];
        }
        else
        {
            if (indexPath.row < awayTeam.count)
                player = [awayTeam objectAtIndex:[indexPath row]];
        }
        // configure cell here...
        if (player.jerseyNumber == 0) // If the player jersey number is 0, then
        {
            if (player.name.length > 0)
            {
                cell.jerseyNumberLabel.text = @"-"; // place a dash instead
            }
            else
            {
                cell.jerseyNumberLabel.text = @"";
            }
        }
        else
        {
            cell.jerseyNumberLabel.text = [NSString stringWithFormat:@"%i", player.jerseyNumber];
        }
        cell.playerNameLabel.text = player.name;
    }
}

// Add cells to the right table
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"playerCell";
    TeamPlayerCell *cell = (TeamPlayerCell*) [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[TeamPlayerCell alloc] initWithStyle:UITableViewCellSelectionStyleNone reuseIdentifier:cellIdentifier];
    }
    /*SoccerPlayer *player;
    if (tableView == [self homeTeamTableView]) // self is needed there
    {
        if (indexPath.row < homeTeam.count)
            player = [homeTeam objectAtIndex:[indexPath row]];
    }
    else
    {
        if (indexPath.row < awayTeam.count)
            player = [awayTeam objectAtIndex:[indexPath row]];
    }
    // configure cell here...
    // If the player has a number but no number (0), then but a dash near his/her name.
    if (player.jerseyNumber == 0) // If the player jersey number is 0, then
    {
        if (player.name.length > 0)
        {
            cell.jerseyNumberLabel.text = @"-"; // place a dash instead
        }
        else
        {
            cell.jerseyNumberLabel.text = @"";
        }
    }
    else
    {
        cell.jerseyNumberLabel.text = [NSString stringWithFormat:@"%i", player.jerseyNumber];
    }
    cell.playerNameLabel.text = player.name;*/
    [self setPlayerCell: cell for: tableView at: indexPath];
    return cell;
}

- (NSMutableArray*) homeTeam
{
    return homeTeam;
}

- (NSMutableArray*) awayTeam
{
    return awayTeam;
}

- (NSString*) sportName
{
    return sportName;
}

- (id) homeTeam: (NSMutableArray*) _homeTeam
{
    homeTeam = _homeTeam;
    return self;
}

- (id) awayTeam: (NSMutableArray*) _awayTeam
{
    awayTeam = _awayTeam;
    return self;
}

- (id) sportName:(NSString *)_sportName
{
    sportName = _sportName;
    return self;
}

@end
