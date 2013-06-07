//
//  TeamMenuViewController.h
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/8/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Data.h"
#import "ButtonsCell.h"
#import "TextFieldCell.h"
#import "LabelAndTextFieldCell.h"
#import "TeamPlayerMenuViewController.h"
#import "GCDiscreetNotificationView.h"
#import "TennisGameViewController.h"

enum SportType {TEAM_SPORT, INDIVIDUAL_SPORT};

@interface TeamMenuViewController : UITableViewController <UITextFieldDelegate>
{
    NSString *sportName;
    enum SportType sportType;
    Data *nameTextFieldPlaceholders, *intervalLabels, *timeLabels; // Placeholder strings where team/player name goes
    NSString *nameField1, *nameField2, *notification;
}

@property (nonatomic, strong) GCDiscreetNotificationView *notificationView;

- (NSString*) sportName;

- (id) sportName: (NSString*) _sportName;

- (IBAction)segmentButtonClicked:(id)sender;

- (IBAction)nextButton:(id)sender;


@end
