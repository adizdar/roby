//
//  AppDelegate.h
//  cardTestNew
//
//  Created by Ahmed Dizdar on 10/05/15.
//  Copyright (c) 2015 Ahmed Dizdar. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) id historyData; // NOT GOOD @TODO REFACTOR
//http://stackoverflow.com/questions/569940/whats-the-best-way-to-communicate-between-view-controllers

@end

