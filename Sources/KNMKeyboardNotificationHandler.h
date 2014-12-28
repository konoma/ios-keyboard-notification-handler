//
//  KNMKeyboardNotificationHandler.h
//  KNMKeyboardNotificationHandler
//
//  Created by Markus Gasser on 28.12.14.
//  Copyright (c) 2014 konoma GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KNMKeyboardState.h"
#import "KNMKeyboardChange.h"


@interface KNMKeyboardNotificationHandler : NSObject

+ (instancetype)defaultHandler;
- (instancetype)initWithNotificationCenter:(NSNotificationCenter *)notificationCenter;
- (instancetype)init; // uses default notification center

@property (nonatomic, readonly) NSNotificationCenter *notificationCenter;
@property (nonatomic, readonly) KNMKeyboardState *currentState;

- (void)beginListeningToKeyboardEvents;
- (void)endListeningToKeyboardEvents;

- (id)addKeyboardChangeHandlerUsingBlock:(void(^)(KNMKeyboardChange *change))handler;
- (void)removeKeyboardChangeHandler:(id)handler;

@end
