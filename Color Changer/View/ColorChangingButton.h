//
//  ColorChangingButton.h
//  Color Changer
//
//  Created by Михаил Поддубный on 18.07.16.
//  Copyright © 2016 Михаил Поддубный. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MyColorChangingButtonType) {
    MyColorChangingButtonTypeRed,
    MyColorChangingButtonTypeYellow,
    MyColorChangingButtonTypeGreen,
};

@protocol ColorChangingButtonDelegate <NSObject>

@required

- (void) changeColor: (MyColorChangingButtonType) colorChangingButtonType;

@end

@interface ColorChangingButton : UIButton

@property (nonatomic, readonly) MyColorChangingButtonType colorChangingButtonType;
@property id <ColorChangingButtonDelegate> vcDelegate;

- (instancetype) initWithButtonType: (MyColorChangingButtonType) myButtonType;
- (void) setup;

@end
