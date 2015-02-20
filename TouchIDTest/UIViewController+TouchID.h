//
//  UIViewController+TouchID.h
//  TouchIDTest
//
//  Created by Joan Molinas on 19/2/15.
//  Copyright (c) 2015 Joan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LocalAuthentication/LocalAuthentication.h>
@interface UIViewController (TouchID)
-(void)useTouchIDWithDescription:(NSString *)text completion:(void (^)(BOOL success, NSString *stateMessage, LAError errorResult))block;
@end
