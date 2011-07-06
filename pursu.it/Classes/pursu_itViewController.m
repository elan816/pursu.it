//
//  pursu_itViewController.m
//  pursu.it
//
//  Created by Elan Kiderman on 7/5/11.
//  Copyright 2011 Ramaz Upper School. All rights reserved.
//

#import "pursu_itViewController.h"
#import "MainViewController.h"
#import "ASIFormDataRequest.h"

@implementation pursu_itViewController
@synthesize username;
@synthesize password;
@synthesize facebookButton;



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	facebookButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	facebookButton.frame = CGRectMake(100, 100, 120, 40);
	[facebookButton addTarget:self action:@selector(loginAppear) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:facebookButton];
	
}

- (void)loginAppear {
	facebookButton.userInteractionEnabled = NO;
	
	username = [[UITextField alloc] initWithFrame:CGRectMake(100,150,120,30)];
	[username setBorderStyle:UITextBorderStyleLine];
	username.tag = 101;
	username.clearsOnBeginEditing = YES;
	[username setReturnKeyType:UIReturnKeyNext];
	[username setDelegate:self];
	[username becomeFirstResponder];
	[self.view addSubview:username];
	
	password = [[UITextField alloc] initWithFrame:CGRectMake(100,190,120,30)];
	[password setBorderStyle:UITextBorderStyleLine];
	[password setBackgroundColor:[UIColor greenColor]];
	password.tag = 102;
	password.clearsOnBeginEditing = YES;
	[password setReturnKeyType:UIReturnKeyDone];
	[password setDelegate:self];
	[password becomeFirstResponder];
	password.secureTextEntry = YES;
	[self.view addSubview:password];
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
	NSInteger nextTag = textField.tag + 1;
	// Try to find next responder
	UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
	if (nextResponder) {
		// Found next responder, so set it.
		[nextResponder becomeFirstResponder];
	} else {
		// Not found, so remove keyboard.
		[textField resignFirstResponder];
		
		MainViewController *mainViewController = [[MainViewController alloc] init];
		
		ASIFormDataRequest *request = [[[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:@"http://172.16.25.132/"]] autorelease];
		[request setPostValue:username.text forKey:@"name"];
		request.delegate = self;
		request.didFinishSelector = @selector(loginRequestDidFinish:);
		
		[request start];
		
		//[[self navigationController] pushViewController:mainViewController animated:NO];
	}
	return NO; // We do not want UITextField to insert line-breaks.
}

- (void) loginRequestDidFinish: (ASIHTTPRequest *)request {
	NSError *error = [request error];
	if (!error) {
		NSLog(@"request finished");
		NSString *response = [request responseString];
		NSLog([NSString stringWithFormat:@"%@"], response);
		
		UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100,250,120,30)];
		nameLabel.text = response;
		[self.view addSubview: nameLabel];
	}
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
