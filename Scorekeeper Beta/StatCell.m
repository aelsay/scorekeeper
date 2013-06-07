//
//  StatCell.m
//  499
//
//  Created by Ali ElSayed on 11/3/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "StatCell.h"

@implementation StatCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        // Set cell style
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        // Setup the cell and add the labels to the view
        _statLabel = [[UILabel alloc] init];
        _homeTeamStat = [[UILabel alloc] init];
        _awayTeamStat = [[UILabel alloc] init];
        [self.contentView addSubview: _statLabel];
        [self.contentView addSubview: _homeTeamStat];
        [self.contentView addSubview: _awayTeamStat];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
