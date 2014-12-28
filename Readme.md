# KNMKeyboardNotificationHandler

A simple wrapper around UIKeyboard notifications.


## Installation

Install using cocoapods:

    pod 'KNMKeyboardNotificationHandler', '~> 0.1'


## Usage

Keyboard notifications are handled by `KNMKeyboardNotificationHandler` which notifies blocks you pass it. Usually you will want to use the default handler which you get using `[KNMKeyboardNotificationHandler defaultHandler]`.


### Enabling Keyboard Handling

Before notifications are handled you must let the handler start listening to them:

    [[KNMKeyboardNotificationHandler defaultHandler] beginListeningToKeyboardEvents];

Call this method preferably somewhere early in your app startup code, since the handler will track the current keyboard state. This state may be inaccurate if there were keyboard changes before the handler had a chance to listen to them.


### Reacting to Keyboard Changes

Start by adding a change handler block to the notification handler:

    KNMKeyboardNotificationHandler *handler = [KNMKeyboardNotificationHandler defaultHandler];
    id handlerToken = [handler addKeyboardChangeHandlerUsingBlock:^(KNMKeyboardChange *change) {
        // handle the keyboard change
    }];

The block is called whenever the keyboard state changes. From there you can get information about the keyboard change, such as keyboard rects and animation parameters.

The returned handler token is used to remove the handler again:

    [handler removeKeyboardChangeHandler:handlerToken];
