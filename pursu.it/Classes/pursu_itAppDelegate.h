//
//  pursu_itAppDelegate.h
//  pursu.it
//
//  Created by Elan Kiderman on 7/5/11.
//  Copyright 2011 Ramaz Upper School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class pursu_itViewController;

@interface pursu_itAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UINavigationController *navControl;
    pursu_itViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet pursu_itViewController *viewController;
@property (nonatomic, retain) IBOutlet UINavigationController *navControl;

@end

