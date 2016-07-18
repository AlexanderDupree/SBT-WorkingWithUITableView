//
//  SaveButton.h
//  Color Changer
//
//  Created by Михаил Поддубный on 18.07.16.
//  Copyright © 2016 Михаил Поддубный. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SaveButtonDelegate <NSObject>

@required

- (void) saveChanges;

@end

@interface SaveButton : UIButton

@property id <SaveButtonDelegate> vcDelegate;

- (void) setup;

@end
