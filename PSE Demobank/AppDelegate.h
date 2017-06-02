//
//  AppDelegate.h
//  PSE Demobank
//
//  Created by Nicolas Loira on 6/1/17.
//  Copyright © 2017 Khipu SpA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (UIColor*) principalColor;
- (UIColor*) darkerPrincipalColor;
- (UIColor*) secondaryColor;

@end

