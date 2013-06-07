//
//  TeamMenuViewController.m
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/8/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "TeamMenuViewController.h"

#define NUM_OF_ROWS     2 // May have to be broken down as sport menus change...
#define NUM_OF_SECTIONS 3 // May have to be broken down as sport menus change...

// #define SOCCER_ROWS
// #define SOCCER_SECTIONS
// #define BASKETBALL_ROWS
// #define BASKETBALL_SECTIONS
// #define TENNIS_ROWS
// #define TENNIS_SECTIONS
// ...

@interface TeamMenuViewController ()

@end

@implementation TeamMenuViewController


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
    //[self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:[UIView new]]];
    //[self.navigationItem setHidesBackButton:YES animated:YES]; // Hide nav back button
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    nameTextFieldPlaceholders = [[Data alloc] init];
    intervalLabels = [[Data alloc] init];
    timeLabels = [[Data alloc] init];
    if (sportName == @"Soccer")
    {
        sportType = TEAM_SPORT;
        [nameTextFieldPlaceholders str1: @"Home Team Name"];
        [nameTextFieldPlaceholders str2: @"Away Team Name"];
        [intervalLabels str1: @"Number of Halves"];
        [intervalLabels str2: @"2"];
        [timeLabels str1: @"Minutes per Half"];
        [timeLabels str2: @"45"];
    }
    else if (sportName == @"Basketball")
    {
        sportType = TEAM_SPORT;
        [nameTextFieldPlaceholders str1: @"Home Team Name"];
        [nameTextFieldPlaceholders str2: @"Visitors Team Name"];
        [intervalLabels str1: @"Number of Quarters"];
        [intervalLabels str2: @"4"];
        [timeLabels str1: @"Minutes per Quarter"];
        [timeLabels str2: @"12"];
    }
    else if (sportName == @"Tennis")
    {
        sportType = INDIVIDUAL_SPORT;
        [nameTextFieldPlaceholders str1: @"Player %i Name"];
        [intervalLabels str1: @"Number of Sets"];
        [intervalLabels str2: @"5"];
    }
    // Decalre a notification view
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
    //return NUM_OF_SECTIONS;
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (sportType == INDIVIDUAL_SPORT && section == 1) {
        return 1;
    }
    else if (section == 1) // IT WAS (section == 2)
    {
        return 1; // 1 cell for back and next buttons
    }
    // Return the number of rows in the section.
    return NUM_OF_ROWS;
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            if (sportType == TEAM_SPORT)
                return @"Team Names";
            else
                return @"Player Names";
            break;
        //case 1:
        //    return @"Match Options";
        //    break;
        default:
            return @"";
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    // The textFieldCell is a cell with one textField entry
    // This entry will be used to enter the team names (home/away) or non team player names (ex: tennis)
    if (indexPath.section == 0) // In the first section
    {
        CellIdentifier = @"textFieldCell";
        TextFieldCell *cell = (TextFieldCell*) [tableView dequeueReusableCellWithIdentifier: CellIdentifier];
        if (cell == nil)
        {
            cell = [[TextFieldCell alloc] initWithStyle:UITableViewCellSelectionStyleNone reuseIdentifier:CellIdentifier];
        }
        NSString *placeholder;
        if (sportType == TEAM_SPORT) // Set textFields placeholders depending on the sport type
        {   // If it's a team sport
            if (indexPath.row == 0) // Row 1 (0)
            {
                placeholder = nameTextFieldPlaceholders.str1;
            }
            else // Row 2 (1)
            {
                placeholder = nameTextFieldPlaceholders.str2;
            }
            
        }
        else // Non team sport
        {
            placeholder = [NSString stringWithFormat:nameTextFieldPlaceholders.str1, indexPath.row + 1];
        }
        cell.textField.placeholder = placeholder; // Set placeholder
        return cell;
    }
    /*else if (indexPath.section == 1) // The second section loads a cell that has a label and a textField
    {   // The textField inputs only numbers and will likely be connected to a UIPickerView
        CellIdentifier = @"labelAndTextFieldCell";
        LabelAndTextFieldCell *cell = (LabelAndTextFieldCell*) [tableView dequeueReusableCellWithIdentifier: CellIdentifier];
        if (cell == nil)
        {
            cell = [[LabelAndTextFieldCell alloc] initWithStyle:UITableViewCellSelectionStyleNone reuseIdentifier:CellIdentifier];
        }
        if (indexPath.row == 0) {
            cell.label.text = intervalLabels.str1; // Set label text
            cell.textField.placeholder = intervalLabels.str2; // Set textField placeholder
        }
        else if (indexPath.row == 1)
        {
            cell.label.text = timeLabels.str1;
            cell.textField.placeholder = timeLabels.str2;
        }
        return cell;
    }*/
    else
    {
        CellIdentifier = @"buttonsCell"; // Buttons cell has a segmented control with 2 segments
        // The segments act as 2 buttons. One is to go back and the other is to go next.
        ButtonsCell *cell = (ButtonsCell*) [tableView dequeueReusableCellWithIdentifier: CellIdentifier];
        // Remove cell border since the segment itself already has one
        cell.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];
        if (cell == nil)
        {
            cell = [[ButtonsCell alloc] initWithStyle:UITableViewCellSelectionStyleNone reuseIdentifier:CellIdentifier];
        }
        return cell;
    }
    
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

- (NSString*) sportName // returns the sport name
{
    return sportName;
}

- (id) sportName: (NSString*) _sportName // sets the sport name
{
    sportName = _sportName;
    return self;
}

- (IBAction)segmentButtonClicked:(id)sender
{
    UISegmentedControl *buttons = (UISegmentedControl*) sender;
    // When the segment buttons are clicked we need the table view to call end editing
    // This will trigger textFieldShouldEndEditing to set the string values
    [self.tableView endEditing:YES];
    if (buttons.selectedSegmentIndex == 0) // If the back button in the segmented control is pressed
        [self.navigationController popViewControllerAnimated:YES]; // Pop back to previous view
    else // buttons.selectedSegmentIndex == 1 which means the next button was pressed
    {
        if ([nameField1 length] == 0 || [nameField2 length] == 0)
        {
            if (sportName == @"Soccer" || sportName == @"Basketball")
            {
                [_notificationView setTextLabel:@"Enter the team names!"];
                [_notificationView showAndDismissAutomaticallyAnimated];
            }
            else if(sportName == @"Tennis")
            {
                [_notificationView setTextLabel:@"Enter the player names!"];
                [_notificationView showAndDismissAutomaticallyAnimated];
            }
        }
        else
        {
            if (sportName == @"Soccer" || sportName == @"Basketball") {
                [self performSegueWithIdentifier:@"segueToPlayerMenu" sender:self]; // Go to the next view
            }
            else if (sportName == @"Tennis")
            {
                [self performSegueWithIdentifier:@"segueToTennisGameView" sender:self];
            }
        }
    }
}

- (IBAction)nextButton:(id)sender {
    [self.tableView endEditing:YES];
    if ([nameField1 length] == 0 || [nameField2 length] == 0)
    {
        if (sportName == @"Soccer" || sportName == @"Basketball")
        {
            [_notificationView setTextLabel:@"Enter the team names!"];
            [_notificationView showAndDismissAutomaticallyAnimated];
        }
        else if(sportName == @"Tennis")
        {
            [_notificationView setTextLabel:@"Enter the player names!"];
            [_notificationView showAndDismissAutomaticallyAnimated];
        }
    }
    else
    {
        if (sportName == @"Soccer" || sportName == @"Basketball") {
            [self performSegueWithIdentifier:@"segueToPlayerMenu" sender:self]; // Go to the next view
        }
        else if (sportName == @"Tennis")
        {
            [self performSegueWithIdentifier:@"segueToTennisGameView" sender:self];
        }
    }
}

- (BOOL) textFieldShouldEndEditing:(UITextField *)textField
{
    TextFieldCell *cell = (TextFieldCell *)[[textField superview] superview];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell]; // Get the path of the cell
    if (indexPath.row == 0)
    {
        nameField1 = textField.text;
    }
    else if(indexPath.row == 1)
    {
        nameField2 = textField.text;
    }
    return YES;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

// This will be called before the next view appears
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sportName == @"Soccer" || sportName == @"Basketball")
    {
        if ([[segue identifier] isEqualToString:@"segueToPlayerMenu"])
        {
            // Get destination view
            TeamPlayerMenuViewController *menu = [segue destinationViewController];
            [menu sportName: sportName];
            // Looks for the first text field (row 0 section 0)
            // This row is (by default -- for team sports) the home team name cell
            // Once we get that cell, we get the text entered in its textField and sends it to the next view
            // In the next view, it's used as a header for the table section
            // And will be/should be/is used to create the team class (SoccerTeam/BasketballTeam/etc...)
            TextFieldCell *cell = (TextFieldCell*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            [menu homeTeam: nameField1];
            // Looks for the second text field (row 1 section 0)
            // This row is the away team name cell
            // It's used for the same purpose as the home team
            cell = (TextFieldCell*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
            [menu awayTeam: nameField2];
            [menu teamID: 0]; // home team player menu view is always first after team menu!
            // Note: away team player menu is called in home team player menu (by looping to itself)
            
        }
    }
    else if (sportName == @"Tennis")
    {
        if ([[segue identifier] isEqualToString:@"segueToTennisGameView"])
        {
            TennisGameViewController *view = [segue destinationViewController];
            view.player1 = nameField1;
            view.player2 = nameField2;
            
        }

    }
}

@end
