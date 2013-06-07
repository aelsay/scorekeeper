//
//  SportCell.m
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/8/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "SportCell.h"

@implementation SportCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        // Set cell style
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        // Setup the cell and add the labels to the view
        _sportLabel = [[UILabel alloc] init];
        _sportImage = [[UIImageView alloc] init];
        [self.contentView addSubview:_sportLabel];
        [self.contentView addSubview:_sportImage];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
