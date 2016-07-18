//
//  InputTextField.m
//  Color Changer
//
//  Created by Михаил Поддубный on 17.07.16.
//  Copyright © 2016 Михаил Поддубный. All rights reserved.
//

#import "InputTextField.h"

@implementation InputTextField

- (instancetype) init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void) setup {
    [self setBackgroundColor: [UIColor colorWithWhite: 0.5 alpha: 1.0]];
    [self setKeyboardType: UIKeyboardTypeDefault];
    [self setKeyboardAppearance: UIKeyboardAppearanceDark];
    [self setClearButtonMode: UITextFieldViewModeAlways];
}

- (BOOL) shouldChangeTextInRange:(UITextRange *)range replacementText:(NSString *)text {
    if ([self.vcDelegate respondsToSelector: @selector (textEntered)]) {
        [self.vcDelegate textEntered];
    }
    return YES;
}

@end
