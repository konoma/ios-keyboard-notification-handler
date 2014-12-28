//
//  KNMKeyboardChange.m
//  KNMKeyboardNotificationHandler
//
//  Created by Markus Gasser on 28.12.14.
//  Copyright (c) 2014 konoma GmbH. All rights reserved.
//

#import "KNMKeyboardChange.h"
#import "KNMKeyboardState.h"


static UIViewAnimationOptions AnimationOptionsForCurve(UIViewAnimationCurve curve)
{
    switch (curve) {
        case UIViewAnimationCurveEaseIn: return UIViewAnimationOptionCurveEaseIn;
        case UIViewAnimationCurveEaseOut: return UIViewAnimationOptionCurveEaseOut;
        case UIViewAnimationCurveEaseInOut: return UIViewAnimationOptionCurveEaseInOut;
        case UIViewAnimationCurveLinear: return UIViewAnimationOptionCurveLinear;
    }
}


@implementation KNMKeyboardChange

+ (instancetype)keyboardChangeFromNotification:(NSNotification *)notification
{
    CGRect startFrame = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    KNMKeyboardState *currentState = [[KNMKeyboardState alloc] initWithScreenFrame:startFrame];
    
    CGRect endFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    KNMKeyboardState *targetState = [[KNMKeyboardState alloc] initWithScreenFrame:endFrame];
    
    NSTimeInterval duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationCurve curve = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    UIViewAnimationOptions options = AnimationOptionsForCurve(curve);
    
    return [[self alloc] initWithCurrentState:currentState targetState:targetState
                            animationDuration:duration animationOptions:options];
}

+ (instancetype)keyboardChangeForCurrentState:(KNMKeyboardState *)state
{
    return [[self alloc] initWithCurrentState:state targetState:state animationDuration:0.0 animationOptions:0];
}

- (instancetype)initWithCurrentState:(KNMKeyboardState *)currentState
                         targetState:(KNMKeyboardState *)targetState
                   animationDuration:(NSTimeInterval)animationDuration
                    animationOptions:(UIViewAnimationOptions)animationOptions
{
    if ((self = [super init])) {
        _currentState = currentState;
        _targetState = targetState;
        _animationDuration = animationDuration;
        _animationOptions = animationOptions;
    }
    return self;
}

@end
