//
//  AppDelegate.m
//  PocTest
//
//  Created by admin on 5/10/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



/**
    Remember to change the application ID and version on Info.plist
*/


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[GDiOS sharedInstance] getWindow];
    self.good = [GDiOS sharedInstance];

    _good.delegate = self;
    started = NO;

    // Show the Good Authentication UI.
    [_good authorize];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - Good Dynamics Delegate Methods
- (void)handleEvent:(GDAppEvent *)anEvent {

    /* Called from _good when events occur, such as system startup. */
    switch (anEvent.type)
    {
        case GDAppEventAuthorized:
        {
            [self onAuthorized:anEvent];
            break;
        }
        case GDAppEventNotAuthorized:
        {
            [self onNotAuthorized:anEvent];
            break;
        }
        case GDAppEventRemoteSettingsUpdate:
        {
            //A change to application-related configuration or policy settings.
            break;
        }
        case GDAppEventServicesUpdate:
        {
            //A change to services-related configuration.
            break;
        }
        case GDAppEventPolicyUpdate:
        {
            //A change to one or more application-specific policy settings has been received.
            break;
        }
        case GDAppEventDataPlanUpdate:
        {
            //A change to the data plan state of the running application has been received
            break;
        }
        case GDAppEventEntitlementsUpdate:
        {
            //A change to the entitlements data has been received.
            break;
        }
    }
}

- (void)onNotAuthorized:(GDAppEvent *)anEvent {

    /* Handle the Good Libraries not authorized event. */
    switch (anEvent.code) {
        case GDErrorActivationFailed:
        case GDErrorProvisioningFailed:
        case GDErrorPushConnectionTimeout:
        case GDErrorSecurityError:
        case GDErrorAppDenied:
        case GDErrorAppVersionNotEntitled:
        case GDErrorBlocked:
        case GDErrorWiped:
        case GDErrorRemoteLockout: 
        case GDErrorPasswordChangeRequired: {
            // an condition has occured denying authorization, an application may wish to log these events
            NSLog(@"onNotAuthorized %@", anEvent.message);
            break;
        }
        case GDErrorIdleLockout: {
            // idle lockout is benign & informational
            break;
        }
        default: 
            NSAssert(false, @"Unhandled not authorized event");
            break;
    }
}

- (void)onAuthorized:(GDAppEvent *)anEvent {

    /* Handle the Good Libraries authorized event. */                            
    switch (anEvent.code) {
        case GDErrorNone: {
            if (!started) {
                // launch application UI here
                started = YES;
            }
            break;
        }
        default:
            NSAssert(false, @"authorized startup with an error");
            break;
    }
}

@end
