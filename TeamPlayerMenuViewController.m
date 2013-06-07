//
//  TeamPlayerMenuViewController.m
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/11/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "TeamPlayerMenuViewController.h"

@interface TeamPlayerMenuViewController ()

@end

@implementation TeamPlayerMenuViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    if (sportName == @"Soccer")
    {
        if (teamID == 0)
        {
            soccerHomeTeam = [[SoccerTeam alloc] init];
            [soccerHomeTeam teamName: homeTeam];
        }
        else
        {
            soccerAwayTeam = [[SoccerTeam alloc] init];
            [soccerAwayTeam teamName: awayTeam];
        }
    }
    else if(sportName == @"Basketball")
    {
        if (teamID == 0)
        {
            basketballHomeTeam = [[BasketballTeam alloc] init];
            [basketballHomeTeam name: homeTeam];
        }
        else
        {
            basketballAwayTeam = [[BasketballTeam alloc] init];
            [basketballAwayTeam name: awayTeam];
        }
    }
    // else if(sportName == @"Football")
    // {
        //if(teamID == 0)
            // footballHomeTeam = [[FootballTeam alloc] init];
            // [footballHomeTeam name: homeTeam];
        //else
            // footballAwayTeam = [[FootballTeam alloc] init];
            // [footballAwayTeam name: awayTeam];
    // }
    // else if(sportName == @"Baseball")
    // {
        //if(teamID == 0)
            // baseballHomeTeam = [[BaseballTeam alloc] init];
            // [baseballHomeTeam name: homeTeam];
        //else
            // baseballAwayTeam = [[BaseballTeam alloc] init];
            // [baseballAwayTeam name: awayTeam];
    // }
    
    // TEST LOOPS BELOW!!!
   /* NSLog(@"Size: %d", soccerHomeTeam.players.count);
    for (int i = 0; i < soccerHomeTeam.players.count; i++)
    {
        SoccerPlayer *player = [soccerHomeTeam.players objectAtIndex:i];
        NSLog(@"#%d %@ %@", player.jerseyNumber, player.name, player.position);
    }
    for (int i = 0; i < basketballHomeTeam.players.count; i++)
    {
        BasketballPlayer *player = [basketballHomeTeam.players objectAtIndex:i];
        NSLog(@"#%d %@ %@", player.jerseyNumber, player.name, player.position);
    }*/
    _notificationView = [[GCDiscreetNotificationView alloc] initWithText:@"Shhh! It's quiet up here"
                                                            showActivity:NO
                                                      inPresentationMode:GCDiscreetNotificationViewPresentationModeTop
                                                                  inView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        if (sportName == @"Soccer" ||
            sportName == @"Football" ||
            sportName == @"Baseball" ||
            sportName == @"Basketball")
        {
            if (teamID == 0) // If it's the home team player menu
            {
                return homeTeam; // return home team name
            }
            else // otherwise
            {
                return awayTeam; // return away team name
            }
        }
        else
        {
            return @"There Should Be Stuff Here...";
        }
    }
    return @"";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) // Depending on the sport return the number of rows in the table
    {
        if (sportName == @"Soccer" || sportName == @"Football")
        {
            return 11; // Football and soccer have 11 starters
        }
        else if (sportName == @"Basketball")
        {
            return 5; // Basketball has 5
        }
    }
    else if (section == 1) // The second section hosts the back and next segmented control
    {
        return 1; // which is only one row in the tableview
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    // In the first section, load custom table cells that take player info (jersey#, player name and position)
    if (indexPath.section == 0)
    {
        CellIdentifier = @"playerInfoCell";
        PlayerInfoCell *cell = (PlayerInfoCell*) [tableView dequeueReusableCellWithIdentifier: CellIdentifier];
        if (cell == nil)
        {
            cell = [[PlayerInfoCell alloc] initWithStyle:UITableViewCellSelectionStyleNone reuseIdentifier:CellIdentifier];
        }
        // Configure the cell... set place holders
        cell.jerseyNumber.placeholder = [NSString stringWithFormat:@"%i", indexPath.row + 1];
        cell.playerName.placeholder = [NSString stringWithFormat:@"Player %i Name", indexPath.row + 1];
        NSString *position;
        if (sportName == @"Soccer") // Get soccer player placeholder position
        {
            position = [self getSoccerPosition:indexPath.row];
        }
        else if (sportName == @"Basketball") // Get basketball player placeholder position
        {
            position = [self getBasketballPosition:indexPath.row];
        }
        cell.playerPosition.placeholder = position;
        // Set cell tags
        cell.jerseyNumber.tag = indexPath.row + 100;
        cell.playerName.tag = indexPath.row + 200;
        cell.playerPosition.tag = indexPath.row + 300;
        return cell;
    }
    else // If it's the second row, then load the buttons Cell (which is back / next segmented button)
    {
        CellIdentifier = @"buttonsCell";
        ButtonsCell *cell = (ButtonsCell*) [tableView dequeueReusableCellWithIdentifier: CellIdentifier];
        // Remove cell border
        cell.backgroundView = [[UIView alloc] initWithFrame:CGRectZero]; // Otherwise, it'll have double borders!!!
        if (cell == nil)
        {
            cell = [[ButtonsCell alloc] initWithStyle:UITableViewCellSelectionStyleNone reuseIdentifier:CellIdentifier];
        }
        return cell;
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    /*  limit to only numeric characters  */
    if (textField.tag >= 100 && textField.tag < 200) {
        NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
        for (int i = 0; i < [string length]; i++)
        {
            unichar c = [string characterAtIndex:i];
            // Check if char is valid, and text field limit
            if ([characterSet characterIsMember:c] && [textField.text length] < 2)                 return YES;
            else
                return NO;
        }
        /*  limit the users input to only 2 characters  */
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return (newLength > 2) ? NO : YES;
    }
    else if (textField.tag >= 200 && textField.tag < 300) // If it's a textField for a player's jersey number
    {
        NSString *str = [textField.text stringByReplacingCharactersInRange:range withString:string];
        if ([str length] > 18) // Set character limit
            return NO;
        else
            return YES;
    }
    else if (textField.tag >= 300 && textField.tag < 400) // If it's a textField for a player's jersey number
    {
        NSString *str = [textField.text stringByReplacingCharactersInRange:range withString:string];
        if ([str length] > 3) // Set character limit
            return NO;
        else
            return YES;
    }
    return NO;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    NSInteger nextTag = textField.tag; // Current tag
    nextTag = textField.tag + 100; // Next textField tag is current + 100
    if (textField.tag >= 300 && textField.tag < 400) nextTag = textField.tag - 199;
    UIResponder *nextResponder = [textField.superview.superview.superview viewWithTag:nextTag];
    if (nextResponder)
    {
        [nextResponder becomeFirstResponder];
    }
    else
    {
        [textField resignFirstResponder];
    }
    return NO;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (NSString*) sportName
{
    return sportName;
}

- (NSString*) homeTeam
{
    return homeTeam;
}

- (NSString*) awayTeam
{
    return awayTeam;
}

- (NSInteger) teamID
{
    return teamID;
}

- (id) sportName: (NSString*) _sportName
{
    sportName = _sportName;
    return self;
}

- (id) homeTeam:(NSString *) _homeTeam
{
    homeTeam = _homeTeam;
    return self;
}

- (id) awayTeam:(NSString *) _awayTeam
{
    awayTeam = _awayTeam;
    return self;
}

- (id) teamID:(NSInteger)_teamID
{
    teamID = _teamID;
    return self;
}

- (NSString*) getSoccerPosition: (NSInteger) index
{
    switch (index) {
        case 0:
            return @"GK";
            break;
        case 1:
            return @"LB";
            break;
        case 2:
        case 3:
            return @"CB";
            break;
        case 4:
            return @"RB";
            break;
        case 5:
            return @"LM";
            break;
        case 6:
        case 7:
            return @"CM";
            break;
        case 8:
            return @"RM";
            break;
        case 9:
        case 10:
            return @"ST";
            break;
        default:
            break;
    }
    return @"";
}

- (NSString*) getBasketballPosition: (NSInteger) index
{
    switch (index) {
        case 0:
            return @"PG";
            break;
        case 1:
            return @"SG";
            break;
        case 2:
            return @"SF";
            break;
        case 3:
            return @"PF";
            break;
        case 4:
            return @"C";
            break;
        default:
            break;
    }
    return @"";
}

- (IBAction)segmentButtonClicked:(id)sender
{
    UISegmentedControl *buttons = (UISegmentedControl*) sender;
    [self.tableView endEditing:YES];
    if (buttons.selectedSegmentIndex == 0) // If the back button is pressed, pop current view
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else // If the next button is pressed, go to the next view
    {
        if (teamID == 0) // If current view is home team player menu
        {   // then load the away team player menu
            if (sportName == @"Soccer") {
                if ([soccerHomeTeam.players count] == 0)
                {
                    [_notificationView setTextLabel:@"Enter some player names!"];
                    [_notificationView showAndDismissAutomaticallyAnimated];
                }
                else
                {
                    [self performSegueWithIdentifier:@"segueToSelf" sender:self];
                }
            }
            else if (sportName == @"Basketball")
            {
                if ([basketballHomeTeam.players count] == 0)
                {
                    [_notificationView setTextLabel:@"Enter some player names!"];
                    [_notificationView showAndDismissAutomaticallyAnimated];
                }
                else
                {
                    [self performSegueWithIdentifier:@"segueToSelf" sender:self];
                }
            }
        }
        else // This is the away team player menu
        {   // go to the next view!
            if (sportName == @"Soccer") {
                if ([soccerAwayTeam.players count] == 0)
                {
                    [_notificationView setTextLabel:@"Enter some player names!"];
                    [_notificationView showAndDismissAutomaticallyAnimated];
                }
                else
                {
                    [self performSegueWithIdentifier:@"segueToGameView" sender:self];
                }
            }
            else if (sportName == @"Basketball")
            {
                if ([basketballAwayTeam.players count] == 0)
                {
                    [_notificationView setTextLabel:@"Enter some player names!"];
                    [_notificationView showAndDismissAutomaticallyAnimated];
                }
                else
                {
                    [self performSegueWithIdentifier:@"segueToGameView" sender:self];
                }
            }
            
        }
    }
}

- (IBAction)nextButton:(id)sender
{
    [self.tableView endEditing:YES];
    if (teamID == 0) // If current view is home team player menu
    {   // then load the away team player menu
        if (sportName == @"Soccer") {
            if ([soccerHomeTeam.players count] == 0)
            {
                [_notificationView setTextLabel:@"Enter some player names!"];
                [_notificationView showAndDismissAutomaticallyAnimated];
            }
            else
            {
                [self performSegueWithIdentifier:@"segueToSelf" sender:self];
            }
        }
        else if (sportName == @"Basketball")
        {
            if ([basketballHomeTeam.players count] == 0)
            {
                [_notificationView setTextLabel:@"Enter some player names!"];
                [_notificationView showAndDismissAutomaticallyAnimated];
            }
            else
            {
                [self performSegueWithIdentifier:@"segueToSelf" sender:self];
            }
        }
    }
    else // This is the away team player menu
    {   // go to the next view!
        if (sportName == @"Soccer") {
            if ([soccerAwayTeam.players count] == 0)
            {
                [_notificationView setTextLabel:@"Enter some player names!"];
                [_notificationView showAndDismissAutomaticallyAnimated];
            }
            else
                [self performSegueWithIdentifier:@"segueToGameView" sender:self];
        }
        else if (sportName == @"Basketball")
        {
            if ([basketballAwayTeam.players count] == 0)
            {
                [_notificationView setTextLabel:@"Enter some player names!"];
                [_notificationView showAndDismissAutomaticallyAnimated];
            }
            else
                [self performSegueWithIdentifier:@"segueToGameView" sender:self];
        }
        
    }
}

- (SoccerTeam*) soccerTeam
{
    if (teamID == 0) // If teamID is 0 then return the soccer home team
    {
        return soccerHomeTeam;
    }
    else // otherwise return the soccer away team
    {
        return soccerAwayTeam;
    }
}

- (BasketballTeam*) basketballTeam
{
    if (teamID == 0) // If teamID is 0 then return the basketball home team
    {
        return basketballHomeTeam;
    }
    else // otherwise return the basketball away team (visitors)
    {
        return basketballAwayTeam;
    }
}

- (NSInteger) playerID: (NSInteger) _playerID // Takes a tag, returns a playerID
{
    if (_playerID >= 0 && _playerID < 100); // Player ID is from 0 to 99
    else
    {
        while (_playerID >= 100)
        {
            _playerID -= 100;
        }
    }
    return _playerID;
}


// This function will be needed to save cell data in the class
- (BOOL) textFieldShouldEndEditing:(UITextField *)textField
{
    // Get the cell where the textField being edited is located
    //PlayerInfoCell *cell = (PlayerInfoCell *)[[textField superview] superview];
    //NSIndexPath *indexPath = [self.tableView indexPathForCell:cell]; // Get the path of the cell
    SoccerPlayer *soccerPlayer = nil;
    BasketballPlayer *basketballPlayer = nil;
    //NSLog(@"TF: %@ IP.R: %d", textField.text, indexPath.row);
    NSInteger playerID = [self playerID: textField.tag];
    if ([textField.text length] == 0); // If the text field is empty, don't bother!
    else if (textField.tag >= 100 && textField.tag < 200)
    {
        NSInteger jerseyNumber = [textField.text intValue];
        if (sportName == @"Soccer")
        {
            // Each textField has a tag which is an int
            // The tag is used to generate an ID for each player by calling [self playerID]
            // The tag helps us determine which cell was edited and at what row
            // The cell tags were set in cellForRowAtPath
            // The jerseyNumber textFields are from 100 to 199
            // The playerName textFields are from 200 to 299
            // The playerPosition textFields are from 300 to 399
            // The playerID ranges from 0 to 99
            // A player with playerID 0 has textFields 100, 200, and 300
            // A player with playerID 1 has textFields 101, 201, and 301
            
            // createPlayerWithID creates a player and sets the player an ID
            // Every player in his team has a unique ID
            // Again, this helps us determine which textFields belong to which player
            // every player is tied to their row number (in the ui table)
            // If a player already exists, createPlayerWithID will return the player so we could update/modify it.
            soccerPlayer = [[self soccerTeam] createPlayerWithID: playerID];
            [soccerPlayer jerseyNumber: jerseyNumber];
            [soccerPlayer teamID: teamID];
        }
        else if(sportName == @"Basketball")
        {
            basketballPlayer = [[self basketballTeam] createPlayerWithID: playerID];
            [basketballPlayer jerseyNumber: jerseyNumber];
            [basketballPlayer teamID: teamID];
        }
        //else if(sportName == @"Football")
        //{
            // footballPlayer = [[self footballTeam] createPlayerWithID: playerID];
            // [footballPlayer jerseyNumber: jerseyNumber];
        //}
        //else if(sportName == @"Baseball")
        //{
            // Coming sometime...
        //}
    }
    else if (textField.tag >= 200 && textField.tag < 300)
    {
        NSString *name = textField.text;
        if (sportName == @"Soccer")
        {
            soccerPlayer = [[self soccerTeam] createPlayerWithID: playerID];
            [soccerPlayer name: name];
            [soccerPlayer teamID: teamID];
        }
        else if(sportName == @"Basketball")
        {
            basketballPlayer = [[self basketballTeam] createPlayerWithID: playerID];
            [basketballPlayer name: name];
            [basketballPlayer teamID: teamID];
        }
        //else if(sportName == @"Football")
        //{
            // footballPlayer = [[self footballTeam] createPlayerWithID: playerID];
            // [footballPlayer name: name];
        //}
        //else if(sportName == @"Baseball")
        //{
            // Coming sometime...
        //}
    }
    else if (textField.tag >= 300 && textField.tag < 400)
    {
        NSString *position = textField.text;
        if (sportName == @"Soccer")
        {
            soccerPlayer = [[self soccerTeam] createPlayerWithID: playerID];
            [soccerPlayer position: position];
            [soccerPlayer teamID: teamID];
        }
        else if(sportName == @"Basketball")
        {
            basketballPlayer = [[self basketballTeam] createPlayerWithID: playerID];
            [basketballPlayer position: position];
            [basketballPlayer teamID: teamID];
        }
        //else if(sportName == @"Football")
        //{
            // footballPlayer = [[self footballTeam] createPlayerWithID: playerID];
            // [footballPlayer position: position];
        //}
        //else if(sportName == @"Baseball")
        //{
            // Coming sometime...
        //}
    }
    return YES;
}

// This will be called before the next view appears
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"segueToSelf"])
    {
        // Get destination view
        TeamPlayerMenuViewController *menu = [segue destinationViewController];
        // Setup class for next view!
        [menu sportName: sportName];
        [menu homeTeam: homeTeam];
        [menu awayTeam: awayTeam];
        [menu soccerHomeTeam: soccerHomeTeam]; // Pass the home team which should be already populated
        //[menu soccerAwayTeam: soccerAwayTeam]; // it's NULL anyways. There's no point.
        [menu basketballHomeTeam: basketballHomeTeam];
        // [menu footballHomeTeam: footbalHomeTeam];
        // [menu baseballHomeTeam: baseballHomeTeam];
        [menu teamID: 1]; // Next view will be for the away team (loop segue -- segueToSelf)
    }
    else if ([[segue identifier] isEqualToString:@"segueToGameView"]) // Soon to Coin toss view before game view!
    {
        GameViewController *game = [segue destinationViewController];
        game.homeTeamLabel.text = homeTeam;
        game.awayTeamLabel.text = awayTeam;
        [game sportName: sportName]; // the sportname is required to load the appropriate class in the GameViewController class
        if (sportName == @"Soccer")
        {
            [game soccerHomeTeam: soccerHomeTeam];
            [game soccerAwayTeam: soccerAwayTeam];
        }
        else if(sportName == @"Basketball")
        {
            [game basketballHomeTeam: basketballHomeTeam];
            [game basketballAwayTeam: basketballAwayTeam];
        }
        // Set up before coin toss view
    }
}


/*
 The functions below set and get the SoccerTeam and BasketballTeam instances from the class.
 This is needed since (this) view controller segues to itself and data needs to be passed to the next view...
 */

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

- (id) basketballHomeTeam: (BasketballTeam*) _basketballHomeTeam
{
    basketballHomeTeam = _basketballHomeTeam;
    return self;
}

- (id) basketballAwayTeam: (BasketballTeam*) _basketballAwayTeam
{
    basketballAwayTeam = _basketballAwayTeam;
    return self;
}

@end
