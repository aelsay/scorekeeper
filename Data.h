//
//  CellData.h
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/9/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import <Foundation/Foundation.h>

// Data is a simple class that will store 2 strings

@interface Data : NSObject
{
    @private
    NSString *str1;
    NSString *str2;
}

- (id) str1: (NSString*) _str1;
- (id) str2: (NSString*) _str2;

- (NSString*) str1;
- (NSString*) str2;

@end
