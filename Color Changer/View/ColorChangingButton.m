//
//  ColorChangingButton.m
//  Color Changer
//
//  Created by Михаил Поддубный on 18.07.16.
//  Copyright © 2016 Михаил Поддубный. All rights reserved.
//

#import "ColorChangingButton.h"

@implementation ColorChangingButton

- (instancetype) initWithButtonType:(MyColorChangingButtonType)myButtonType {
    self = [super init];
    if (self) {
        self->_colorChangingButtonType = myButtonType;
        [self setup];
    }
    return self;
}

- (void) setup {
    [self setBackgroundColor: [UIColor colorWithWhite: 0.5 alpha: 1.0]];
    [self setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
    switch (self.colorChangingButtonType) {
        case MyColorChangingButtonTypeRed:
            [self setBackgroundColor: [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0]];
            [self setTitle: @"Red" forState:UIControlStateNormal];
            break;
        
        case MyColorChangingButtonTypeYellow:
            [self setBackgroundColor: [UIColor colorWithRed:1.0 green:1.0 blue:0.0 alpha:1.0]];
            [self setTitle: @"Yellow" forState:UIControlStateNormal];
            break;
            
        case MyColorChangingButtonTypeGreen:
            [self setBackgroundColor:[UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0]];
            [self setTitle: @"Green" forState:UIControlStateNormal];
            break;
    }
    [self addTarget:self action: @selector (buttonIsPressed) forControlEvents:UIControlEventTouchDown];
}

- (void) buttonIsPressed {
    if ([self.vcDelegate respondsToSelector: @selector (changeColor:)]) {
        [self.vcDelegate changeColor: self.colorChangingButtonType];
    }
}

@end
