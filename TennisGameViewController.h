//
//  TennisGameViewController.h
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 12/11/12.
//  Copyright (c) 2012 Scorekeeper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerStatsViewController.h"
#import "MatchFactsViewController.h"
#import "TennisPlayer.h"
#import "CustomBadge.h"

@interface TennisGameViewController : UIViewController <UIAlertViewDelegate>
{
    TennisPlayer *TPlayer1, *TPlayer2, *TPlayer3, *TPlayer4;
    CustomBadge *badge1, *badge2, *badge3, *badge4;
    bool increment;
    NSInteger set;
    NSInteger game;
}
@property (strong, nonatomic) IBOutlet UILabel *player1Label;
@property (strong, nonatomic) IBOutlet UILabel *player2Label;
@property (strong, nonatomic) IBOutlet UILabel *player1PointsLabel;
@property (strong, nonatomic) IBOutlet UILabel *player2PointsLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *playerSegmentedControl;
@property (strong, nonatomic) IBOutlet UIButton *winnersButton;
@property (strong, nonatomic) IBOutlet UIButton *acesButton;
@property (strong, nonatomic) IBOutlet UIButton *doubleFaultsButton;
@property (strong, nonatomic) IBOutlet UIButton *unforcedErrorsButton;
@property (strong, nonatomic) IBOutlet UIView *buttonsView;
@property (strong, nonatomic) IBOutlet UIButton *undoButton;
@property (strong, nonatomic) IBOutlet UIButton *shareButton;
@property (strong, nonatomic) IBOutlet UIButton *whistleButton;
@property (strong, nonatomic) IBOutlet UILabel *setLabel;


@property (strong, nonatomic) NSString *player1;
@property (strong, nonatomic) NSString *player2;
@property (strong, nonatomic) NSString *player3;
@property (strong, nonatomic) NSString *player4;

@property (strong, nonatomic) PlayerStatsViewController *playerStatsViewController;
@property (strong, nonatomic) MatchFactsViewController *matchFactsViewController;

@end
