//
//  KNMKeyboardState.m
//  KNMKeyboardNotificationHandler
//
//  Created by Markus Gasser on 28.12.14.
//  Copyright (c) 2014 konoma GmbH. All rights reserved.
//

#import "KNMKeyboardState.h"


@implementation KNMKeyboardState

- (instancetype)initWithScreenFrame:(CGRect)screenFrame
{
    if ((self = [super init])) {
        _screenFrame = screenFrame;
        _visible = CGRectIntersectsRect([UIScreen mainScreen].bounds, screenFrame);
    }
    return self;
}

- (CGRect)keyboardFrameInView:(UIView *)view
{
    NSParameterAssert(view != nil);
    
    CGRect windowFrame = [view.window convertRect:self.screenFrame fromWindow:nil];
    CGRect viewFrame = [view.window convertRect:windowFrame toView:view];
    return viewFrame;
}

@end
