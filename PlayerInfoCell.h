//
//  PlayerInfoCell.h
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/11/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerInfoCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UITextField *jerseyNumber;
@property (strong, nonatomic) IBOutlet UITextField *playerName;
@property (strong, nonatomic) IBOutlet UITextField *playerPosition;

@end
