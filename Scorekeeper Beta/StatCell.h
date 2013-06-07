//
//  StatCell.h
//  499
//
//  Created by Ali ElSayed on 11/3/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *statLabel;
@property (strong, nonatomic) IBOutlet UILabel *homeTeamStat;
@property (strong, nonatomic) IBOutlet UILabel *awayTeamStat;

@end
