//
//  KNMKeyboardState.h
//  KNMKeyboardNotificationHandler
//
//  Created by Markus Gasser on 28.12.14.
//  Copyright (c) 2014 konoma GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface KNMKeyboardState : NSObject

- (instancetype)initWithScreenFrame:(CGRect)screenFrame;

@property (nonatomic, readonly) CGRect screenFrame;
@property (nonatomic, readonly) BOOL visible;

- (CGRect)keyboardFrameInView:(UIView *)view;

@end
