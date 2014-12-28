//
//  KNMKeyboardNotificationHandler.m
//  KNMKeyboardNotificationHandler
//
//  Created by Markus Gasser on 28.12.14.
//  Copyright (c) 2014 konoma GmbH. All rights reserved.
//

#import "KNMKeyboardNotificationHandler.h"


@interface KNMKeyboardNotificationHandler ()

@property (nonatomic, readonly) NSMutableDictionary *changeHandlers;
@property (nonatomic, readwrite) KNMKeyboardState *currentState;

@end


@implementation KNMKeyboardNotificationHandler

#pragma mark - Initialization

+ (instancetype)defaultHandler
{
    static KNMKeyboardNotificationHandler *handler;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handler = [[KNMKeyboardNotificationHandler alloc] init];
    });
    return handler;
}

- (instancetype)initWithNotificationCenter:(NSNotificationCenter *)notificationCenter
{
    if ((self = [super init])) {
        _notificationCenter = notificationCenter;
        _changeHandlers = [NSMutableDictionary dictionary];
    }
    return self;
}

- (instancetype)init
{
    return [self initWithNotificationCenter:[NSNotificationCenter defaultCenter]];
}


#pragma mark - Listening for Changes

- (void)beginListeningToKeyboardEvents
{
    [self.notificationCenter addObserver:self selector:@selector(keyboardWillChange:)
                                    name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)endListeningToKeyboardEvents
{
    [self.notificationCenter removeObserver:self];
}

- (void)keyboardWillChange:(NSNotification *)notification
{
    KNMKeyboardChange *change = [KNMKeyboardChange keyboardChangeFromNotification:notification];
    [self notifyKeyboardChange:change];
    
    self.currentState = change.targetState;
}


#pragma mark - Notifiying About Changes

- (id)addKeyboardChangeHandlerUsingBlock:(void(^)(KNMKeyboardChange *))handler
{
    NSParameterAssert(handler != nil);
    
    KNMKeyboardChange *initialChange = [KNMKeyboardChange keyboardChangeForCurrentState:self.currentState];
    handler(initialChange);
    
    id key = [NSUUID UUID];
    self.changeHandlers[key] = handler;
    return key;
}

- (void)removeKeyboardChangeHandler:(id)key
{
    [self.changeHandlers removeObjectForKey:key];
}

- (void)notifyKeyboardChange:(KNMKeyboardChange *)keyboardChange
{
    NSAssert([NSThread isMainThread], @"Expected to be called on main thread");
    
    [self.changeHandlers enumerateKeysAndObjectsUsingBlock:^(id key, void(^handler)(KNMKeyboardChange*), BOOL *stop) {
        handler(keyboardChange);
    }];
}

@end
