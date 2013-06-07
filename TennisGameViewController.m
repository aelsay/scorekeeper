//
//  TennisGameViewController.m
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 12/11/12.
//  Copyright (c) 2012 Scorekeeper. All rights reserved.
//

#import "TennisGameViewController.h"

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

@interface TennisGameViewController ()

@end

@implementation TennisGameViewController

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
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    UIColor *color = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"whitey.png"]];
    self.buttonsView.backgroundColor = color; // Set background
    TPlayer1 = [[TennisPlayer alloc] init];
    TPlayer2 = [[TennisPlayer alloc] init];
    if (self.player1.length > 0) {
        self.player1Label.text = self.player1;
        [self.playerSegmentedControl setTitle:self.player1 forSegmentAtIndex:0];
        TPlayer1.name = self.player1;
    }
    if (self.player2.length > 0) {
        self.player2Label.text = self.player2;
        [self.playerSegmentedControl setTitle:self.player2 forSegmentAtIndex:1];
        TPlayer2.name = self.player2;
    }
    self.setLabel.text = @"Set: 1";
    self.player1PointsLabel.text = @"0";
    self.player2PointsLabel.text = @"0";
    increment = YES;
    if (_playerStatsViewController == nil)
    {
        self.playerStatsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"playerStatsViewController"];
        [_playerStatsViewController sportName: @"Tennis"];
        // Send tennis player class
        //[_playerStatsViewController homeTeam: soccerHomeTeam.players];
        //[_playerStatsViewController awayTeam: soccerAwayTeam.players];
        _playerStatsViewController.view.frame = CGRectMake(0, 44, 320, 20+33*2);
        NSMutableArray *players = [[NSMutableArray alloc] init];
        [players addObject:TPlayer1];
        [players addObject:TPlayer2];
        [_playerStatsViewController homeTeam: players];
    }
    [self.view insertSubview: _playerStatsViewController.view belowSubview:self.view];
    if (_matchFactsViewController == nil)
    {
        self.matchFactsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"matchFactsViewController"];
        [_matchFactsViewController sportName: @"Tennis"];
        _matchFactsViewController.player1 = TPlayer1;
        _matchFactsViewController.player2 = TPlayer2;
        CGRect bounds = [[UIScreen mainScreen] bounds];
        CGFloat cell_height = 0;
        if (bounds.size.height == 568) {
            cell_height = 47;
        }
        else if(bounds.size.height == 480)
        {
            cell_height = 29.4;
        }

        _matchFactsViewController.view.frame = CGRectMake(0, 44+(20+33*2), 320, 20+cell_height*5);
    }
    [self.view insertSubview: _matchFactsViewController.view belowSubview:self.view];
    // Set up badges!!!
    badge1 = [CustomBadge customBadgeWithString:@"0"
                                withStringColor:[UIColor whiteColor]
                                withInsetColor:[UIColor blackColor]
                                withBadgeFrame:YES
                            withBadgeFrameColor:[UIColor whiteColor]
                                    withScale:0.84
                                    withShining:YES];
    [badge1 setUserInteractionEnabled:NO];
    badge2 = [CustomBadge customBadgeWithString:@"0"
                                withStringColor:[UIColor whiteColor]
                                 withInsetColor:[UIColor blackColor]
                                 withBadgeFrame:YES
                            withBadgeFrameColor:[UIColor whiteColor]
                                      withScale:0.84
                                    withShining:YES];
    [badge2 setUserInteractionEnabled:NO];
    badge3 = [CustomBadge customBadgeWithString:@"0"
                                withStringColor:[UIColor whiteColor]
                                 withInsetColor:[UIColor blackColor]
                                 withBadgeFrame:YES
                            withBadgeFrameColor:[UIColor whiteColor]
                                      withScale:0.84
                                    withShining:YES];
    [badge3 setUserInteractionEnabled:NO];
    badge4 = [CustomBadge customBadgeWithString:@"0"
                                withStringColor:[UIColor whiteColor]
                                 withInsetColor:[UIColor blackColor]
                                 withBadgeFrame:YES
                            withBadgeFrameColor:[UIColor whiteColor]
                                      withScale:0.84
                                    withShining:YES];
    [badge4 setUserInteractionEnabled:NO];
    badge1.frame = CGRectMake(124 - 14, 47 - 7, badge1.frame.size.width, badge1.frame.size.height);
    badge2.frame = CGRectMake(280 - 14, 47 - 7, badge2.frame.size.width, badge2.frame.size.height);
    badge3.frame = CGRectMake(124 - 14, 99 - 7, badge3.frame.size.width, badge3.frame.size.height);
    badge4.frame = CGRectMake(280 - 14, 99 - 7, badge4.frame.size.width, badge4.frame.size.height);
    // Add badges to view
    [self.buttonsView addSubview:badge1];
    [self.buttonsView addSubview:badge2];
    [self.buttonsView addSubview:badge3];
    [self.buttonsView addSubview:badge4];
    
    
    // set up match
    set = 1;
    game = 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playerSegmentedControl:(id)sender
{
    UISegmentedControl *buttons = (UISegmentedControl*) sender;
    if (self.playerSegmentedControl.selectedSegmentIndex == 0) // If the back button is pressed, pop current view
    {
        [self loadBadges:TPlayer1];
        // player 1
    }
    else if (self.playerSegmentedControl.selectedSegmentIndex == 1)
    {
        [self loadBadges:TPlayer2];
        // player 2
    }
    else if (buttons.selectedSegmentIndex == 2)
    {
        [self loadBadges:TPlayer3];
        // player 3
    }
    else if (buttons.selectedSegmentIndex == 3)
    {
        [self loadBadges:TPlayer4];
        // player 4
    }
}

- (TennisPlayer*) getPlayer
{
    if (self.playerSegmentedControl.selectedSegmentIndex == 0) // If the back button is pressed, pop current view
    {
        // player 1
        return TPlayer1;
    }
    else if (self.playerSegmentedControl.selectedSegmentIndex == 1)
    {
        // player 2
        return TPlayer2;
    }
    else if (self.playerSegmentedControl.selectedSegmentIndex == 2)
    {
        // player 3
        return TPlayer3;
    }
    else if (self.playerSegmentedControl.selectedSegmentIndex == 3)
    {
        // player 4
        return TPlayer4;
    }
    return nil;
}

- (IBAction)winnersButton:(id)sender
{
    TennisPlayer *player = [self getPlayer];
    if (increment == YES)
    {
        [player incrementWinners];
    }
    else
    {
        [player decrementWinners];
    }
    NSString *stat = [NSString stringWithFormat:@"%d", player.winners];
    [badge1 autoBadgeSizeWithString: stat];
    [self updateScore];

}

- (IBAction)acesButton:(id)sender
{
    TennisPlayer *player = [self getPlayer];
    if (increment == YES)
    {
        [player incrementAces];
    }
    else
    {
        [player decrementAces];
    }
    NSString *stat = [NSString stringWithFormat:@"%d", player.aces];
    [badge2 autoBadgeSizeWithString: stat];
    [self updateScore];
}

- (IBAction)doubleFaultsButton:(id)sender
{
    TennisPlayer *player = [self getPlayer];
    if (increment == YES)
    {
        [player incrementDoubleFaults];
    }
    else
    {
        [player decrementDoubleFaults];
    }
    NSString *stat = [NSString stringWithFormat:@"%d", player.doubleFaults];
    [badge3 autoBadgeSizeWithString: stat];
    [self updateScore];
}

- (IBAction)unforcedErrorsButton:(id)sender
{
    TennisPlayer *player = [self getPlayer];
    if (increment == YES)
    {
        [player incrementUnforcedErrors];
    }
    else
    {
        [player decrementUnforcedErrors];
    }
    NSString *stat = [NSString stringWithFormat:@"%d", player.unforcedErrors];
    [badge4 autoBadgeSizeWithString: stat];
    [self updateScore];
}

- (IBAction)shareButton:(id)sender
{
    CGRect bounds = [[UIScreen mainScreen] bounds];
    int y = 0;
    if (bounds.size.height == 568) {
        y = 568 - 163 - 20;
    }
    else
    {
        y = 480 - 163 - 20;
    }
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.view.bounds.size.width, y), self.view.opaque, 0.0);
    //UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    //UIGraphicsBeginImageContext(CGSizeMake(320,y));
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:ctx];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    ///////
    //NSString *message = @""; /*[[[[[[_homeTeamLabel.text stringByAppendingString:@" "] stringByAppendingString: [NSString stringWithFormat:@"%@", _homeTeamScoreLabel.text]] stringByAppendingString:@" - "] stringByAppendingString: _awayTeamScoreLabel.text] stringByAppendingString:@" "] stringByAppendingString:[NSString stringWithFormat:@"%@", _awayTeamLabel.text]];*/
    // Put the message in the items array
    NSArray *items = @[newImage];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc]initWithActivityItems:items applicationActivities:nil];
    //Exclude uneeded activities
    // Note: include UIActivityTypeMessage to exclude the Message option
    [activityViewController setExcludedActivityTypes:@[UIActivityTypePostToWeibo]];
    [self presentViewController:activityViewController animated:YES completion:nil];
    items = nil;
}

- (IBAction)whistleButton:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Whistle to..." message:@"" delegate:self cancelButtonTitle:@"Back to Match!" otherButtonTitles:@"End Match", @"Exit to Main Menu", nil];
    [alertView setTag: 13];
    [alertView show];
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alertView tag] == 13)
    {
        if (buttonIndex == 1)
        {
            // Go to end match view
        }
        else if (buttonIndex == 2)
        {
            UINavigationController *rootController = [self.storyboard instantiateViewControllerWithIdentifier:@"rootController"];
            [self presentViewController:rootController animated:YES completion:nil];
            self.playerStatsViewController = nil;
            //self.matchFactsViewController = nil;
        }
    }
}


- (IBAction)undoButton:(id)sender
{
    if (increment == YES) {
        increment = NO;
        [self.undoButton setImage:[UIImage imageNamed:@"minus.png"] forState:UIControlStateNormal];
    }
    else
    {
        increment = YES;
        [self.undoButton setImage:[UIImage imageNamed:@"plus.png"] forState:UIControlStateNormal];
    }
}

- (int) computePointsEarnedForPlayer: (TennisPlayer*) player1 againstPlayer: (TennisPlayer*) player2
{
    return player1.aces + player1.winners + player2.unforcedErrors + player2.doubleFaults;
}

- (NSString*) getPointsForPlayer: (TennisPlayer*) player
{
    return player.points;
}

- (BOOL) tied
{
    if (TPlayer1.points == @"A" && TPlayer2.points == @"A")
    {
        return YES;
    }
    else
        return NO;
}

- (BOOL) deuce
{
    if ([self tied] == YES) {
        TPlayer1.points = @"40";
        TPlayer2.points = @"40";
        return YES;
    }
    return NO;
}

- (void) resetBadges
{
    [badge1 autoBadgeSizeWithString: @"0"];
    [badge2 autoBadgeSizeWithString: @"0"];
    [badge3 autoBadgeSizeWithString: @"0"];
    [badge4 autoBadgeSizeWithString: @"0"];
}

- (NSString*) toStr: (NSInteger) val
{
    return [NSString stringWithFormat:@"%i", val];
}

- (void) loadBadges: (TennisPlayer*) player
{
    [badge1 autoBadgeSizeWithString: [self toStr: player.winners]];
    [badge2 autoBadgeSizeWithString: [self toStr: player.aces]];
    [badge3 autoBadgeSizeWithString: [self toStr: player.doubleFaults]];
    [badge4 autoBadgeSizeWithString: [self toStr: player.unforcedErrors]];
}

- (NSInteger) getPlayerSetScore: (int) _set: (TennisPlayer*) player
{
    switch (_set) {
        case 1:
            return player.set1Score;
            break;
        case 2:
            return player.set2Score;
            break;
        case 3:
            return player.set3Score;
            break;
        case 4:
            return player.set4Score;
            break;
        case 5:
            return player.set5Score;
            break;
        default:
            break;
    }
    return -2;
}

- (void) itIsGame: (TennisPlayer*) player1: (TennisPlayer*) player2
{
    [player1 newGame];
    [player2 newGame];
    [self resetBadges];
    player1.points = @"0";
    player2.points = @"0";
    //int winner = 6;

    if (set == 1)
    {
       
        //if ((player1.set1Score == player2.set1Score) && (player1.set1Score >= 5 || player2.set1Score >= 5))
        //{
        //    winner++;
        //}
        /*else if ((player1.set1Score  > player2.set1Score) && ((player1.set1Score < winner && player2.set1Score < winner - 1) || (player1.set1Score < winner - 1 && player2.set1Score < winner)))
        {
            winner = player1.set1Score + 1;
        }
        else if (player2.set1Score > player1.set1Score && ((player1.set1Score < winner && player2.set1Score < winner - 1) || (player1.set1Score < winner - 1 && player2.set1Score < winner)))
        {
            winner = player2.set2Score + 1;
        }//*/
        if (player1.set1Score == -1 && player2.set1Score == -1) {
            player1.set1Score = 1;
            player2.set1Score = 0;
        }
        else //if(player1.set1Score < winner)
        {
            player1.set1Score++;
        }
        // NSLog(@"p1: %d p2: %d", player1.set1Score, player2.set1Score);
        //if ((player1.set1Score == player2.set1Score) && (player1.set1Score >= 5 || player2.set1Score >= 5))
        //{
        //    winner++;
        //}
        //else if (player1.set1Score >= 5 && player2.set1Score >= 5 && (player1.set1Score == player2.set1Score + 1 || player2.set1Score == player1.set1Score + 1))
        //{
        //    winner++;
        //}
        //NSLog(@"Winner: %d", winner);
        if ((player1.set1Score > 5) && (player1.set1Score - player2.set1Score >= 2)) {
            set++;
            self.setLabel.text = [NSString stringWithFormat:@"Set: %d", set];
            [self displayAlertForPlayer:player1];
        }
    }
    else if (set == 2)
    {
        if (player1.set2Score == -1 && player2.set2Score == -1) {
            player1.set2Score = 1;
            player2.set2Score = 0;
        }
        else //if(player1.set2Score < 6)
        {
            player1.set2Score++;
        }
        if ((player1.set2Score > 5) && (player1.set2Score - player2.set2Score >= 2)) {
            set++;
            self.setLabel.text = [NSString stringWithFormat:@"Set: %d", set];
            [self displayAlertForPlayer:player1];
        }
    }
    else if (set == 3)
    {
        if (player1.set3Score == -1 && player2.set3Score == -1) {
            player1.set3Score = 1;
            player2.set3Score = 0;
        }
        else// if(player1.set3Score < 6)
        {
            player1.set3Score++;
        }
        if ((player1.set3Score > 5) && (player1.set3Score - player2.set3Score >= 2)) {
            set++;
            self.setLabel.text = [NSString stringWithFormat:@"Set: %d", set];
            [self displayAlertForPlayer:player1];
        }
    }
    else if (set == 4)
    {
        if (player1.set4Score == -1 && player2.set4Score == -1) {
            player1.set4Score = 1;
            player2.set4Score = 0;
        }
        else// if(player1.set4Score < 6)
        {
            player1.set4Score++;
        }
        if ((player1.set4Score > 5) && (player1.set4Score - player2.set4Score >= 2)) {
            set++;
            self.setLabel.text = [NSString stringWithFormat:@"Set: %d", set];
            [self displayAlertForPlayer:player1];
        }
    }
    else if (set == 5)
    {
        if (player1.set5Score == -1 && player2.set5Score == -1) {
            player1.set5Score = 1;
            player2.set5Score = 0;
        }
        else// if(player1.set5Score < 6)
        {
            player1.set5Score++;
        }
        if ((player1.set5Score > 5) && (player1.set5Score - player2.set5Score >= 2)) {
            set++;
            self.setLabel.text = [NSString stringWithFormat:@"Set: ∞"];
            [self displayAlertForPlayer:player1];
            NSString *message = [NSString stringWithFormat:@"You can still record stats! Just dismiss this message :)"];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"That's Five-Sets!" message:message delegate:self   cancelButtonTitle:@"Cool!" otherButtonTitles:nil];
            [alertView setTag: 17];
            [alertView show];
        }
    }
    else if (set == 6)
    {
        if (player1.set6Score == -1 && player2.set6Score == -1) {
            player1.set6Score = 1;
            player2.set6Score = 0;
        }
        else
        {
            player1.set6Score++;
        }
    }
}

- (void) displayAlertForPlayer: (TennisPlayer*) player
{
    NSString *message = [NSString stringWithFormat:@"%@ wins this set!", player.name];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"That's Set" message:message delegate:self   cancelButtonTitle:@"Okay!" otherButtonTitles:nil];
    [alertView setTag: 13];
    [alertView show];
}

- (void) setPointsForPlayer: (TennisPlayer*) player1 againstPlayer: (TennisPlayer*) player2
{
    NSInteger pointsEarned = player1.aces + player1.winners + player2.unforcedErrors + player2.doubleFaults;
    NSInteger p2PtsEarned = player2.aces + player2.winners + player1.unforcedErrors + player1.doubleFaults;
    //if (pointsEarned < 5)
    //{
       // for (int i = 0; i < pointsEarned; ++i)
        //{
            if (pointsEarned == 0)
            {
                player1.points = @"0";
            }
            else if (pointsEarned == 1)
            {
                player1.points = @"15";
            }
            else if (pointsEarned == 2)
            {
                player1.points = @"30";
            }
            else if (pointsEarned == 3)
            {
                player1.points = @"40";
            }
            else if (pointsEarned == 4)
            {
                //return 4;
                if (pointsEarned == p2PtsEarned)
                {
                    // Deuce
                    player1.points = @"40";
                    player2.points = @"40";
                }
                //else if (pointsEarned == p2PtsEarned + 2)
                //{
                    // player 1 wins
                //    [self itIsGame:player1 :player2];
                //}
                else if (pointsEarned == p2PtsEarned + 1)
                {
                    player1.points = @"A";
                }
                else if (pointsEarned > p2PtsEarned + 1)
                {
                    [self itIsGame:player1 :player2];
                }
                else
                {
                    NSLog(@"Nothing!");
                }
            }
            else if (pointsEarned > 4)
            {
                if (pointsEarned == p2PtsEarned)
                {
                    player1.points = @"40";
                    player2.points = @"40";
                }
                //else if (pointsEarned == p2PtsEarned + 2)
                //{
                    //NSLog(@"%d, %d", pointsEarned, p2PtsEarned);
                //    [self itIsGame:player1 :player2];
                //}
                else if(pointsEarned == p2PtsEarned + 1)
                {
                    //NSLog(@"%d, %d", pointsEarned, p2PtsEarned);
                    player1.points = @"A";
                }
                else if (pointsEarned > p2PtsEarned + 1)
                {
                    [self itIsGame:player1 :player2];
                }
                //else
                //{
                //    [self itIsGame:player1 :player2];
                //}
                //return -1;
            }
            //return 1;//*/
        //}
    //    return 1;
    //}
    //else
    //{
    //    return -1;
    //}
}

- (void) updateScore
{
    [self setPointsForPlayer:TPlayer1 againstPlayer:TPlayer2];
    [self setPointsForPlayer:TPlayer2 againstPlayer:TPlayer1];
    
    if ([self tied] == YES) {
        [self deuce];
    }
    self.player1PointsLabel.text = TPlayer1.points;
    self.player2PointsLabel.text = TPlayer2.points;
    [self.playerStatsViewController updateTable];
    [self.matchFactsViewController updateTable];
    NSLog(@"%@: %d\n%@: %d", TPlayer1.name, TPlayer1.totalPoints, TPlayer2.name, TPlayer2.totalPoints);
}

@end
