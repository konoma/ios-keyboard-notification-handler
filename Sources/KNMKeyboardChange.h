//
//  KNMKeyboardChange.h
//  KNMKeyboardNotificationHandler
//
//  Created by Markus Gasser on 28.12.14.
//  Copyright (c) 2014 konoma GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>


@class KNMKeyboardState;


@interface KNMKeyboardChange : NSObject

+ (instancetype)keyboardChangeFromNotification:(NSNotification *)notification;
+ (instancetype)keyboardChangeForCurrentState:(KNMKeyboardState *)state;

@property (nonatomic, readonly) KNMKeyboardState *currentState;
@property (nonatomic, readonly) KNMKeyboardState *targetState;

@property (nonatomic, readonly) NSTimeInterval animationDuration;
@property (nonatomic, readonly) UIViewAnimationOptions animationOptions;

@end
