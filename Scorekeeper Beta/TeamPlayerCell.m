//
//  TeamPlayerCell.m
//  499
//
//  Created by Ali ElSayed on 10/31/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "TeamPlayerCell.h"

@implementation TeamPlayerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        // Set cell style
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        // Setup the cell and add the labels to the view
        _jerseyNumberLabel = [[UILabel alloc] init];
        _playerNameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_jerseyNumberLabel];
        [self.contentView addSubview:_playerNameLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
