//
//  LSDViewController.m
//  Base64
//
//  Created by Tom Zaworowski on 3/19/13.
//  Copyright (c) 2013 LSD programming LLC. All rights reserved.
//

#import "LSDViewController.h"
#import "NSData+Base64.h"

@interface LSDViewController ()

@end

@implementation LSDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *testString = @"Test. Test. Test.";
    
    NSLog(@"String: %@\nEncoded string: %@\n Decoded string: %@", testString, [testString base64EncodedString], [[testString base64EncodedString] base64DecodedString]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
