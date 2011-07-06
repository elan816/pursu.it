//
//  pursu_itViewController.h
//  pursu.it
//
//  Created by Elan Kiderman on 7/5/11.
//  Copyright 2011 Ramaz Upper School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pursu_itViewController : UIViewController <UITextFieldDelegate> {
	UIButton *facebookButton;
	UITextField *username;
	UITextField *password;
}

@property (nonatomic,retain) UIButton *facebookButton;
@property (nonatomic,retain) UITextField *username;
@property (nonatomic,retain) UITextField *password;

- (void)loginAppear;

@end

