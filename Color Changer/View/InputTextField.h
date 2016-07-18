//
//  InputTextField.h
//  Color Changer
//
//  Created by Михаил Поддубный on 17.07.16.
//  Copyright © 2016 Михаил Поддубный. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InputTextFieldDelegate <NSObject>

@required

- (void) textEntered;

@end

@interface InputTextField : UITextField

@property id <InputTextFieldDelegate> vcDelegate;

- (void) setup;

@end
