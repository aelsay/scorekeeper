//
//  SportSelectorViewController.h
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/7/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data.h"
#import "SportCell.h"
#import "TeamMenuViewController.h"

@interface SportSelectorViewController : UITableViewController
{
    NSMutableArray *sportCells;
}

- (IBAction)sportButton:(id)sender;

@end
