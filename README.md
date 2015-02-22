UIViewController+TouchID
======================
TouchID used easy on one line in your ViewController. 

##Installation
At this moment, You can install only a way, manually.
For install, you can add `UIViewController+TouchID.h`and `UIViewController+TouchID.m` folder to your project. Import `UIViewController+TouchID.h` and init a view.
##Usage
1. Import `UIViewController+TouchID.h and .m`in your project:   
    `#import "UIViewController+TouchID.h"`
2. In ViewController add the follow block:<br />
    **- useTouchIDWithDescription:completion:**
    <pre><code>[self useTouchIDWithDescription:@"TouchID" completion:^(BOOL success, NSString *stateMessage, LAError errorResult) {
        NSLog(@"%ld",errorResult);
    }];</code></pre>
3. Import LocalAuthentication framework

##Return values
- success: BOOL -> if succes or not
- stateMessage: NSString -> message with touchID login
- errorResult: 
    - TouchID OK                  = 0
    - LAErrorAuthenticationFailed = -1
    - LAErrorUserCancel           = -2
    - LAErrorUserFallback         = -3
    - LAErrorSystemCancel         = -4
    - LAErrorPasscodeNotSet       = -5
    - LAErrorTouchIDNotAvailable  = -6
    - LAErrorTouchIDNotEnrolled   = -7


##Requeriments
- TouchID.
- iOS 8 or higher

##License 
Mit License

##Contact
joanmramon@gmail.com

http://joanmolinas.com

