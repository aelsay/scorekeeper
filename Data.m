//
//  CellData.m
//  Scorekeeper Beta
//
//  Created by Ali ElSayed on 11/9/12.
//  Copyright (c) 2012 Ali ElSayed. All rights reserved.
//

#import "Data.h"

@implementation Data

- (id) init
{
    self = [super init];
    if (self)
    {
        str1 = @"";
        str2 = @"";
    }
    return self;
}

- (id) str1: (NSString*) _str1
{
    str1 = _str1;
    return self;
}

- (id) str2: (NSString*) _str2
{
    str2 = _str2;
    return self;
}

- (NSString*) str1
{
    return str1;
}

- (NSString*) str2
{
    return str2;
}

@end
