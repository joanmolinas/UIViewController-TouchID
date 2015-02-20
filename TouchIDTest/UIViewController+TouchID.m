//
//  UIViewController+TouchID.m
//  TouchIDTest
//
//  Created by Joan Molinas on 19/2/15.
//  Copyright (c) 2015 Joan. All rights reserved.
//

#import "UIViewController+TouchID.h"

@implementation UIViewController (TouchID)

-(void)useTouchIDWithDescription:(NSString *)text completion:(void (^)(BOOL, NSString *, LAError ))block {
    LAContext *context = [LAContext new];
    NSError *error = [NSError new];
    __block NSString *message;
    
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:text reply:^(BOOL success, NSError *error) {
            if (success) {
                message = @"User authentication OK";
                block(success, message, 0);
            } else {
                switch (error.code) {
                    case LAErrorSystemCancel:
                        message = @"The system has cancelled the login process";
                        break;
                    case LAErrorUserCancel:
                        message = @"The user has cancelled the login process";
                        break;
                    case LAErrorUserFallback:
                        message = @"The user has chosen alternative method for login";
                        break;
                    default:
                        message = @"Login with TouchID has failed and show alternative method";
                        break;
                    
                }
                block(success, message, error.code);
            }
        }];
    } else {
        switch (error.code) {
            case LAErrorTouchIDNotEnrolled:
                message = @"User has not configurated the TouchID";
                break;
            case LAErrorPasscodeNotSet:
                message = @"User has not configurated the password";
                break;
            default:
                message = @"Touch ID not available";
                break;
        }
        block(false, message, error.code);

    }
    

}

@end
