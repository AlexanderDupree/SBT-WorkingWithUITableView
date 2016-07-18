//
//  SaveButton.m
//  Color Changer
//
//  Created by Михаил Поддубный on 18.07.16.
//  Copyright © 2016 Михаил Поддубный. All rights reserved.
//

#import "SaveButton.h"

@implementation SaveButton

- (instancetype) init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void) setup {
    [self setBackgroundColor: [UIColor colorWithWhite:0.5 alpha:1.0]];
    [self setTitle: @"Save" forState: UIControlStateNormal];
    [self addTarget: self action: @selector(saveButtonIsPressed) forControlEvents:UIControlEventTouchUpInside];
}

- (void) saveButtonIsPressed {
    if ([self.vcDelegate respondsToSelector: @selector(saveChanges)]) {
        [self.vcDelegate saveChanges];
    }
}

@end
