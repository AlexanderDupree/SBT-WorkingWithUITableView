//
//  OutputTableView.m
//  Color Changer
//
//  Created by Михаил Поддубный on 18.07.16.
//  Copyright © 2016 Михаил Поддубный. All rights reserved.
//

#import "OutputTableView.h"

@implementation OutputTableView

- (instancetype) init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void) setup {
    [self setScrollEnabled:YES];
    [self setBackgroundColor:[UIColor grayColor]];
    self.rowHeight = 50;
}



@end
