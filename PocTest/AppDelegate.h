//
//  AppDelegate.h
//  PocTest
//
//  Created by admin on 5/11/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GD/GDiOS.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, GDiOSDelegate>
{
    BOOL started;
}

@property (strong, nonatomic) GDiOS *good;

@property (strong, nonatomic) UIWindow *window;

// GD methods
- (void)onAuthorized:(GDAppEvent*)anEvent;
- (void)onNotAuthorized:(GDAppEvent*)anEvent;

@end
