//
//  StatsViewController.m
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/22/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "StatsViewController.h"

#define NUM_OF_SOCCER_BUTTONS       20
#define NUM_OF_BASKETBALL_BUTTONS   14

@interface StatsViewController () <UIScrollViewDelegate>
{
    UILabel *label;
    NSInteger totalNumberOfButtons;
    NSString *sportName;
    NSMutableArray *buttons;
    NSMutableArray *badges;
    UIScrollView *scroll;
    UIPageControl *pageControl;
    NSInteger currentPageNumber;
    BOOL increment;
    UIButton *undoButton;
}
@end

@implementation StatsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) setLabel
{
    if (sportName == @"Soccer")
    {
        NSString *jerseyNumber = @"- ";
        if (_soccerPlayer.jerseyNumber > 0)
        {
            jerseyNumber = [NSString stringWithFormat:@"#%d - ", _soccerPlayer.jerseyNumber];
        }
        if (_soccerPlayer.position.length > 0) {
            label.text = [[[jerseyNumber stringByAppendingString:_soccerPlayer.name] stringByAppendingString:@" Pos: "]stringByAppendingString: _soccerPlayer.position];
        }
        else
        {
            label.text = [jerseyNumber stringByAppendingString:_soccerPlayer.name];
        }
        
    }
    else if (sportName == @"Basketball")
    {
        NSString *jerseyNumber = @"- ";
        if (_basketballPlayer.jerseyNumber > 0)
        {
            jerseyNumber = [NSString stringWithFormat:@"#%d - ", _basketballPlayer.jerseyNumber];
        }
        if (_basketballPlayer.position.length > 0) {
            label.text = [[[jerseyNumber stringByAppendingString:_basketballPlayer.name] stringByAppendingString:@" Pos: "]stringByAppendingString: _basketballPlayer.position];
        }
        else
        {
            label.text = [jerseyNumber stringByAppendingString:_basketballPlayer.name];
        }
        
    }
}

- (void) increment
{
    if (increment == YES) {
        increment = NO;
        [undoButton setBackgroundImage:[UIImage imageNamed:@"minus.png"] forState:UIControlStateNormal];
    }
    else
    {
        increment = YES;
        [undoButton setBackgroundImage:[UIImage imageNamed:@"plus.png"] forState:UIControlStateNormal];
    }
}

- (void) resetIncrement
{
    increment = NO;
    [self increment];
}

- (void) createButton
{
    undoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    // Connect button to function
    [undoButton addTarget:self action:@selector(increment) forControlEvents:UIControlEventTouchUpInside];
    // Set button background in normal state
    increment = YES;
    [undoButton setBackgroundImage:[UIImage imageNamed:@"plus.png"] forState:UIControlStateNormal];
    // Set button x and y position and size (20 * 20)
    undoButton.frame = CGRectMake(262, 3, 20, 20);
    // Add button to view
    [self.view addSubview: undoButton];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.frame = CGRectMake(0, 0, 320, 200);
    //[super loadView];
    // Set up top label
    //
    //
    //
    //
    // Top left corner
    [self createButton];
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 200, 20)];
    // Set text color
    label.textColor = [UIColor grayColor];
    // Set background color
    label.backgroundColor = [UIColor clearColor];
    // Set text alignment
    label.textAlignment = NSTextAlignmentLeft;
    // Set spacing to fit width
    [label setAdjustsLetterSpacingToFitWidth:YES];
    // set font
    label.font = [UIFont fontWithName:@"Copperplate" size:14];
    // add to main view
    [self.view addSubview:label];
    //
    //
    //
    // End of setting up label */
    //
    // Allocate arrays that will store the badges and the buttons
    //
    buttons = [[NSMutableArray alloc] init];
    badges = [[NSMutableArray alloc] init];
    //
    //
    // Set background color
    UIColor *color = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"whitey.png"]];
    self.view.backgroundColor = color; // Set background pattern color
    //
    //
    scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height)];
    scroll.pagingEnabled = YES;
    scroll.showsVerticalScrollIndicator = NO;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.delegate = self;
    //
    //
    //
    //
    //
    NSInteger numberOfViews = 2; // May depend on the sport
    NSInteger tag = 0; // tag for buttons
    totalNumberOfButtons = 1; // loads one button if no sport is given (for fun)
    [self setLabel];
    if (sportName == @"Soccer")
    {
        totalNumberOfButtons = NUM_OF_SOCCER_BUTTONS;
    }
    else if (sportName == @"Basketball")
    {
        totalNumberOfButtons = NUM_OF_BASKETBALL_BUTTONS;
    }
    for (int i = 0; i < numberOfViews; i++)
    {
        CGFloat xOrigin = i * self.view.frame.size.width;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(xOrigin, 0, self.view.frame.size.width, self.view.frame.size.height)];
        view.backgroundColor = [UIColor clearColor];
        // Add stuff to the view below
        NSInteger buttonsPerRow = 4, numberOfRows = 3;
        CGFloat buttonXSize = 55, buttonYSize = 44;
        CGFloat x = 20, y = 10;
        CGFloat xSpace = 20, ySpace = 6;
        increment = YES;
        for (int j = 0; j < numberOfRows; j++)
        {
            for (int k = 0; k < buttonsPerRow; k++)
            {
                // Create custom button
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                // Set button label
                if (sportName == @"Soccer")
                {
                    [button setTitle:[self getSoccerLabel:tag] forState:UIControlStateNormal];
                }
                else if (sportName == @"Basketball")
                {
                    [button setTitle:[self getBasketballLabel:tag] forState:UIControlStateNormal];
                }
                // Set button title color
                [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
                [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
                // Tilt the label
                //[button.titleLabel setTransform:CGAffineTransformMakeRotation(M_PI / 18)];
                // Set button font size
                button.titleLabel.font = [UIFont systemFontOfSize:10];
                // Set button font text alignment to center
                button.titleLabel.textAlignment = NSTextAlignmentCenter;
                // Set button font line break mode
                button.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
                // Connect button to function
                [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
                // Set button background in normal state
                [button setBackgroundImage:[UIImage imageNamed:@"greyButton.png"] forState:UIControlStateNormal];
                // Set button background in highlighted state
                [button setBackgroundImage:[UIImage imageNamed:@"blackButton.png"] forState:UIControlStateHighlighted];
                // Set button x and y position and size (44 * 44)
                button.frame = CGRectMake(x, y, buttonXSize, buttonYSize);
                // Set button tag
                button.tag = tag;
                //NSLog(@"x: %f y: %f", x, y);
                // Add button to array
                [buttons addObject:button];
                // Add button to view
                [view addSubview:button];
                // Create badge
                //
                //
                //
                NSString *stat = [NSString stringWithFormat:@"%d", [self getSoccerStat:tag]];
                CustomBadge *badge = [CustomBadge customBadgeWithString:stat
                                                        withStringColor:[UIColor whiteColor]
                                                        withInsetColor:[UIColor blackColor]
                                                        withBadgeFrame:YES
                                                    withBadgeFrameColor:[UIColor whiteColor]
                                                              withScale:0.84
                                                            withShining:YES];
                [badge setUserInteractionEnabled:NO];
                //if (stat.length == 1)
                //{
                    badge.frame = CGRectMake(x + buttonXSize - 14, y - 7, badge.frame.size.width, badge.frame.size.height);
                //}
                //else if (stat.length > 1)
                //{
                //    badge.frame = CGRectMake(x + buttonXSize - 14, y - 7, badge.frame.size.width - 8, badge.frame.size.height);
                //}
                //[button addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
                //[button addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpOutside];
                //
                [badges addObject:badge];
                // Add badge to view
                [view addSubview:badge];
                //
                //
                // Check if all buttons needed have been created
                if (tag >= totalNumberOfButtons) {
                    break;
                }
                //
                // Make adjustments
                x += buttonXSize + xSpace;
                tag++;
            }
            // Check if all buttons needed have been created
            if (tag >= totalNumberOfButtons) {
                break;
            }
            // Make adjustments
            y += buttonYSize + ySpace;
            x = 20;
        }
        y = 10;
        // Add stuff to the view above
        [scroll addSubview:view];
    }
    scroll.contentSize = CGSizeMake(self.view.frame.size.width * numberOfViews, self.view.frame.size.height);
    [self.view addSubview:scroll];
    
    pageControl = [[UIPageControl alloc] init];
    pageControl.center = CGPointMake(self.view.center.x, self.view.frame.size.height - 20);
    pageControl.numberOfPages = 2;
    [pageControl setPageIndicatorTintColor:[UIColor lightGrayColor]];
    [pageControl setCurrentPageIndicatorTintColor:[UIColor darkGrayColor]];
    [self.view addSubview:pageControl];
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
}

- (void) viewWillAppear:(BOOL)animated
{
    [self setLabel];
    [self updateAllButtonBadges];
    scroll.contentOffset = CGPointMake(0, 0); // Go back to page 1
    pageControl.currentPage = 0;
    [self resetIncrement]; // increment will be set to YES after this function executes
}

- (void) setBadgeFrame: (CustomBadge*) badge withString: (NSString*) text
{
    // Access badge by tag (in array)
    if (text.length == 1)
    {
        badge.frame = CGRectMake(badge.frame.origin.x, badge.frame.origin.y, badge.frame.size.width, badge.frame.size.height);
    }
    else if (text.length > 1)
    {
        badge.frame = CGRectMake(badge.frame.origin.x, badge.frame.origin.y, badge.frame.size.width - 8, badge.frame.size.height);
    }
}

// ------------------------------------------------------------------------------------------ //

- (void) updateAllButtonBadges
{
    for (NSInteger i = 0; i < totalNumberOfButtons; ++i) {
        [self updateButtonBadge:i];
    }
}


- (void) updateButtonBadge: (NSInteger) tag
{
    if (badges.count > tag)
    {
        CustomBadge *badge = [badges objectAtIndex:tag];
        NSString *stat = @"";
        if (sportName == @"Soccer")
        {
            stat = [NSString stringWithFormat:@"%d", [self getSoccerStat:tag]];
        }
        else if (sportName == @"Basketball")
        {
            stat = [NSString stringWithFormat:@"%d", [self getBasketballStat:tag]];
        }
        //[self setBadgeFrame: badge withString:stat];
        [badge autoBadgeSizeWithString: stat];
        if (stat.length > 1) {
            //badge.badgeScaleFactor = 0.84;
            badge.frame = badge.frame = CGRectMake(badge.frame.origin.x, badge.frame.origin.y, badge.frame.size.width - 8, badge.frame.size.height);
        }
        //badge.badgeText = stat;
    }
}

// ------------------------------------------------------------------------------------------ //

- (NSString*) getSoccerLabel: (NSInteger) tag
{
    switch (tag)
    {
        ////////////////////////////////////
        case 0:
            return @"Goal";
            break;
        case 1:
            return @"Shot On Goal";
            break;
        case 2:
            return @"Missed Shot";
            break;
        case 3:
            return @"Dribble Won";
            break;
        ////////////////////////////////////
        case 4:
            return @"Assist";
            break;
        case 5:
            return @"Complete Pass";
            break;
        case 6:
            return @"Incomplete Pass";
            break;
        case 7:
            return @"Cross";
            break;
        ////////////////////////////////////
        case 8:
            return @"Tackle";
            break;
        case 9:
            return @"Inter- ception";
            break;
        case 10:
            return @"Block";
            break;
        case 11:
            return @"Save (GK)";
            break;
        ////////////////////////////////////
        case 12:
            return @"Free Kick";
            break;
        case 13:
            return @"Corner";
            break;
        case 14:
            return @"Penalty";
            break;
        case 15:
            return @"Offside";
            break;
        ////////////////////////////////////
        case 16:
            return @"Foul";
            break;
        case 17:
            return @"Yellow  Card";
            break;
        case 18:
            return @"Red Card";
            break;
        case 19:
            return @"Own Goal";
            break;
        ////////////////////////////////////
        default:
            break;
    }
    return [NSString stringWithFormat:@"%d", tag];
}

- (NSString*) getBasketballLabel: (NSInteger) tag
{
    switch (tag)
    {
            ////////////////////////////////////
        case 0:
            return @"FG Scored";
            break;
        case 1:
            return @"FG Missed";
            break;
        case 2:
            return @"3-Pt FG Scored";
            break;
        case 3:
            return @"3-Pt FG Missed";
            break;
            ////////////////////////////////////
        case 4:
            return @"Putback Scored";
            break;
        case 5:
            return @"Putback Missed";
            break;
        case 6:
            return @"Off. Rebound";
            break;
        case 7:
            return @"Def. Rebound";
            break;
            ////////////////////////////////////
        case 8:
            return @"Assist";
            break;
        case 9:
            return @"Steal";
            break;
        case 10:
            return @"Block";
            break;
        case 11:
            return @"Turnover";
            break;
            ///////////////////////////////////
        case 12:
            return @"FT Scored";
            break;
        case 13:
            return @"FT Missed";
            break;
        case 14:
            return @"Foul";
            break;
            ///////
        default:
            break;
    }
    return [NSString stringWithFormat:@"%d", tag];
}

// ------------------------------------------------------------------------------------------ //

- (NSInteger) getBasketballStat: (NSInteger) tag
{
    switch (tag)
    {
        case 0:
            return _basketballPlayer.fieldGoalsScored;
            break;
        case 1:
            return _basketballPlayer.fieldGoalsMissed;
            break;
        case 2:
            return _basketballPlayer.threePointFieldGoalsScored;
            break;
        case 3:
            return _basketballPlayer.threePointFieldGoalsMissed;
            break;
        case 4:
            return _basketballPlayer.putbackScored;
            break;
        case 5:
            return _basketballPlayer.putbackMissed;
            break;
        case 6:
            return _basketballPlayer.offensiveRebounds;
            break;
        case 7:
            return _basketballPlayer.defensiveRebounds;
            break;
        case 8:
            return _basketballPlayer.assists;
            break;
        case 9:
            return _basketballPlayer.steals;
            break;
        case 10:
            return _basketballPlayer.blocks;
            break;
        case 11:
            return _basketballPlayer.turnovers;
            break;
        case 12:
            return _basketballPlayer.freeThrowsScored;
            break;
        case 13:
            return _basketballPlayer.freeThrowsMissed;
            break;
        case 14:
            return _basketballPlayer.fouls;
            break;
        default:
            break;
    }
    return -1;
}

- (NSInteger) getSoccerStat: (NSInteger) tag
{
    switch (tag)
    {
            ////////////////////////////////////
        case 0:
            return _soccerPlayer.goalsScored;
            break;
        case 1:
            return _soccerPlayer.shotsOnTarget;
            break;
        case 2:
            return _soccerPlayer.shotsOffTarget;
            break;
        case 3:
            return _soccerPlayer.dribblesWon;
            break;
            ////////////////////////////////////
        case 4:
            return _soccerPlayer.assists;
            break;
        case 5:
            return _soccerPlayer.passesComplete;
            break;
        case 6:
            return _soccerPlayer.passesIncomplete;
            break;
        case 7:
            return _soccerPlayer.crosses;
            break;
            ////////////////////////////////////
        case 8:
            return _soccerPlayer.tackles;
            break;
        case 9:
            return _soccerPlayer.interceptions;
            break;
        case 10:
            return _soccerPlayer.blocks;
            break;
        case 11:
            return _soccerPlayer.saves;
            break;
            ////////////////////////////////////
        case 12:
            return _soccerPlayer.freeKicksTaken;
            break;
        case 13:
            return _soccerPlayer.cornersTaken;
            break;
        case 14:
            return _soccerPlayer.penaltiesTaken;
            break;
        case 15:
            return _soccerPlayer.offsides;
            break;
            ////////////////////////////////////
        case 16:
            return _soccerPlayer.foulsCommitted;
            break;
        case 17:
            return _soccerPlayer.yellowCards;
            break;
        case 18:
            return _soccerPlayer.redCards;
            break;
        case 19:
            return _soccerPlayer.ownGoals;
            break;
            ////////////////////////////////////
        default:
            break;
    }
    return -1;
}

// ------------------------------------------------------------------------------------------ //

/*
- (void)touchDown:(id)sender
{
    UIButton *button = (UIButton*) sender;
    //button.frame = CGRectInset(button.frame, -0.0, -20);
    [button setBounds:CGRectMake(0, -20,
                               button.bounds.size.width,
                               button.bounds.size.height)];
    //[button setBounds:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)]
}

- (void) touchUp: (id) sender
{
    UIButton *button = (UIButton*) sender;
    [button setBounds:CGRectMake(0, 20,
                                 button.bounds.size.width,
                                 button.bounds.size.height)];
    //button.frame = CGRectInset(button.frame, 0.0, 20);
}*/

- (void)buttonClicked:(id)sender
{
    UIButton *button = (UIButton*) sender;
    //[button setBounds:CGRectMake(-EXPAND_BY, -EXPAND_BY,
    //                           button.bounds.size.width + EXPAND_BY * 2,
    //                           button.bounds.size.height + EXPAND_BY * 2)];
    if (sportName == @"Soccer")
    {
        if (increment == YES)
        {
            [self incrementSoccerStat: button.tag];
        }
        else
        {
            [self decrementSoccerStat: button.tag];
        }
    }
    else if (sportName == @"Basketball")
    {
        if (increment == YES)
        {
            [self incrementBasketballStat: button.tag];
        }
        else
        {
            [self decrementBasketballStat: button.tag];
        }
    }
    [button setBounds:CGRectMake(0, 20,
                                 button.bounds.size.width,
                                 button.bounds.size.height)];
    //button.frame = CGRectInset(button.frame, 0.0, 20);
}

- (void) updateScoreLabel: (NSInteger) tag
{
    NSInteger homeTeamScore, awayTeamScore;
    homeTeamScore = [self.homeTeamScoreLabel.text integerValue];
    awayTeamScore = [self.awayTeamScoreLabel.text integerValue];
    NSInteger incrementVal = 0;
    if (sportName == @"Soccer") {
        if (increment == YES) {
            incrementVal = 1;
        } else {
            incrementVal = -1;
        }
    }
    else if (sportName == @"Basketball")
    {
        if (increment == YES)
        {
            if (tag == 0 || tag == 4)
            {
                incrementVal = 2;
            }
            else if (tag == 2)
            {
                incrementVal = 3;
            }
            else if (tag == 12)
            {
                incrementVal = 1;
            }
        }
        else
        {
            if (tag == 0 || tag == 4)
            {
                incrementVal = -2;
            }
            else if (tag == 2)
            {
                incrementVal = -3;
            }
            else if (tag == 12)
            {
                incrementVal = -1;
            }
        }
    }
    //
    //
    NSInteger labelID = -1;
    //NSLog(@"Name: %@ teamID: %d", self.soccerPlayer.name, self.soccerPlayer.playerID);
    if (sportName == @"Soccer")
    {
        //NSLog(@"Name: %@ teamID: %d", self.soccerPlayer.name, self.soccerPlayer.playerID);
        if (self.soccerPlayer.teamID == 0 && tag == 0) {
            labelID = 0;
        }
        else if (self.soccerPlayer.teamID == 0 && tag == 19)
        {
            labelID = 1;
        }
        else if (self.soccerPlayer.teamID == 1 && tag == 0)
        {
            labelID = 1;
        }
        else if (self.soccerPlayer.teamID == 1 && tag == 19)
        {
            labelID = 0;
        }
    }
    else if (sportName == @"Basketball")
    {
        if (self.basketballPlayer.teamID == 0) {
            labelID = 0;
        }
        else if (self.basketballPlayer.teamID == 1)
        {
            labelID = 1;
        }
    }
    //NSLog(@"labelID: %d", labelID);
    //
    //
    if (labelID == 0) // that's a goal scored!
    {
        //if (homeTeamScore > 0) {
        //if (incrementVal <= homeTeamScore) {
            homeTeamScore += incrementVal;
            self.homeTeamScoreLabel.text = [NSString stringWithFormat:@"%d", homeTeamScore];
        //}
        //}
    }
    else if (labelID == 1)
    {
        //if (incrementVal <= awayTeamScore) {
            awayTeamScore += incrementVal;
            self.awayTeamScoreLabel.text = [NSString stringWithFormat:@"%d", awayTeamScore];
        //}
    }

}
/*
- (void) updateGameScore: (NSInteger) tag
{
    if (self.gameController.sportName == @"Soccer")
    {
        SoccerTeam *team = self.gameController.homeTeam;
        [team updateTeamStats];
        self.gameController.homeTeamScoreLabel = self.gameController.homeTeam;
    }
    
}*/

// ------------------------------------------------------------------------------------------ //

- (void) incrementSoccerStat: (NSInteger) tag
{
    switch (tag)
    {
            ////////////////////////////////////
        case 0:
            [_soccerPlayer incrementGoalsScored];
            [self updateScoreLabel:tag];
            break;
        case 1:
            [_soccerPlayer incrementShotsOnTarget];
            break;
        case 2:
            [_soccerPlayer incrementShotsOffTarget];
            break;
        case 3:
            [_soccerPlayer incrementDribblesWon];
            break;
            ////////////////////////////////////
        case 4:
            [_soccerPlayer incrementAssists];
            break;
        case 5:
            [_soccerPlayer incrementPassesComplete];
            break;
        case 6:
            [_soccerPlayer incrementPassesIncomplete];
            break;
        case 7:
            [_soccerPlayer incrementCrosses];
            break;
            ////////////////////////////////////
        case 8:
            [_soccerPlayer incrementTackles];
            break;
        case 9:
            [_soccerPlayer incrementInterceptions];
            break;
        case 10:
            [_soccerPlayer incrementBlocks];
            break;
        case 11:
            [_soccerPlayer incrementSaves];
            break;
            ////////////////////////////////////
        case 12:
            [_soccerPlayer incrementFreeKicksTaken];
            break;
        case 13:
            [_soccerPlayer incrementCornersTaken];
            break;
        case 14:
            [_soccerPlayer incrementPenaltiesTaken];
            break;
        case 15:
            [_soccerPlayer incrementOffsides];
            break;
            ////////////////////////////////////
        case 16:
            [_soccerPlayer incrementFoulsCommitted];
            break;
        case 17:
            [_soccerPlayer incrementYellowCards];
            [self updateButtonBadge:18];
            break;
        case 18:
            [_soccerPlayer incrementRedCards];
            break;
        case 19:
            [_soccerPlayer incrementOwnGoals];
            [self updateScoreLabel:tag];
            break;
            ////////////////////////////////////
        default:
            break;
    }
    [self updateButtonBadge:tag];
}

- (void) decrementSoccerStat: (NSInteger) tag
{
    switch (tag)
    {
            ////////////////////////////////////
        case 0:
            if ([_soccerPlayer decrementGoalsScored] == 0)
                [self updateScoreLabel: tag];
            break;
        case 1:
            [_soccerPlayer decrementShotsOnTarget];
            break;
        case 2:
            [_soccerPlayer decrementShotsOffTarget];
            break;
        case 3:
            [_soccerPlayer decrementDribblesWon];
            break;
            ////////////////////////////////////
        case 4:
            [_soccerPlayer decrementAssists];
            break;
        case 5:
            [_soccerPlayer decrementPassesComplete];
            break;
        case 6:
            [_soccerPlayer decrementPassesIncomplete];
            break;
        case 7:
            [_soccerPlayer decrementCrosses];
            break;
            ////////////////////////////////////
        case 8:
            [_soccerPlayer decrementTackles];
            break;
        case 9:
            [_soccerPlayer decrementInterceptions];
            break;
        case 10:
            [_soccerPlayer decrementBlocks];
            break;
        case 11:
            [_soccerPlayer decrementSaves];
            break;
            ////////////////////////////////////
        case 12:
            [_soccerPlayer decrementFreeKicksTaken];
            break;
        case 13:
            [_soccerPlayer decrementCornersTaken];
            break;
        case 14:
            [_soccerPlayer decrementPenaltiesTaken];
            break;
        case 15:
            [_soccerPlayer decrementOffsides];
            break;
            ////////////////////////////////////
        case 16:
            [_soccerPlayer decrementFoulsCommitted];
            break;
        case 17:
            [_soccerPlayer decrementYellowCards];
            [self updateButtonBadge:18];
            break;
        case 18:
            [_soccerPlayer decrementRedCards];
            break;
        case 19:
            if ([_soccerPlayer decrementOwnGoals] == 0)
                [self updateScoreLabel: tag];
            break;
            ////////////////////////////////////
        default:
            break;
    }
    [self updateButtonBadge:tag];
}

// ------------------------------------------------------------------------------------------ //

- (void) incrementBasketballStat: (NSInteger) tag
{
    switch (tag) {
        case 0:
            [_basketballPlayer incrementFieldGoalsScored];
            [self updateScoreLabel: tag];
            break;
        case 1:
            [_basketballPlayer incrementFieldGoalsMissed];
            break;
        case 2:
            [_basketballPlayer incrementThreePointFieldGoalsScored];
            [self updateScoreLabel: tag];
            break;
        case 3:
            [_basketballPlayer incrementThreePointFieldGoalsMissed];
            break;
        ///////////////////////////////////
        case 4:
            [_basketballPlayer incrementPutbackScored];
            [self updateScoreLabel: tag];
            break;
        case 5:
            [_basketballPlayer incrementPutbackMissed];
            break;
        case 6:
            [_basketballPlayer incrementOffensiveRebounds];
            break;
        case 7:
            [_basketballPlayer incrementDefensiveRebounds];
            break;
        ///////////////////////////////////
        case 8:
            [_basketballPlayer incrementAssists];
            break;
        case 9:
            [_basketballPlayer incrementSteals];
            break;
        case 10:
            [_basketballPlayer incrementBlocks];
            break;
        case 11:
            [_basketballPlayer incrementTurnovers];
            break;
        ///////////////////////////////////
        case 12:
            [_basketballPlayer incrementFreeThrowsScored];
            [self updateScoreLabel: tag];
            break;
        case 13:
            [_basketballPlayer incrementFreeThrowsMissed];
            break;
        case 14:
            [_basketballPlayer incrementFouls];
            break;
        default:
            break;
    }
    [self updateButtonBadge:tag];
}

- (void) decrementBasketballStat: (NSInteger) tag
{
    switch (tag) {
        case 0:
            if ([_basketballPlayer decrementFieldGoalsScored] == 0)
                [self updateScoreLabel: tag];
            break;
        case 1:
            [_basketballPlayer decrementFieldGoalsMissed];
            break;
        case 2:
            if ([_basketballPlayer decrementThreePointFieldGoalsScored] == 0)
                [self updateScoreLabel: tag];
            break;
        case 3:
            [_basketballPlayer decrementThreePointFieldGoalsMissed];
            break;
        ///////////////////////////////////
        case 4:
            if ([_basketballPlayer decrementPutbackScored] == 0)
                [self updateScoreLabel: tag];
            break;
        case 5:
            [_basketballPlayer decrementPutbackMissed];
            break;
        case 6:
            [_basketballPlayer decrementOffensiveRebounds];
            break;
        case 7:
            [_basketballPlayer decrementDefensiveRebounds];
            break;
        ///////////////////////////////////
        case 8:
            [_basketballPlayer decrementAssists];
            break;
        case 9:
            [_basketballPlayer decrementSteals];
            break;
        case 10:
            [_basketballPlayer decrementBlocks];
            break;
        case 11:
            [_basketballPlayer decrementTurnovers];
            break;
        ///////////////////////////////////
        case 12:
            if ([_basketballPlayer decrementFreeThrowsScored] == 0)
                [self updateScoreLabel: tag];
            break;
        case 13:
            [_basketballPlayer decrementFreeThrowsMissed];
            break;
        case 14:
            [_basketballPlayer decrementFouls];
            break;
        default:
            break;
    }
    [self updateButtonBadge:tag];

}

// ------------------------------------------------------------------------------------------ //
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id) sportName: (NSString*) _sportName
{
    sportName = _sportName;
    return self;
}

@end
