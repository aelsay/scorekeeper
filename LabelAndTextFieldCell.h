//
//  LabelAndTextFieldCell.h
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/9/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabelAndTextFieldCell : UITableViewCell
{
    NSMutableArray *data;
}

@property (strong, nonatomic) IBOutlet UILabel *label;

@property (strong, nonatomic) IBOutlet UITextField *textField;

@end
