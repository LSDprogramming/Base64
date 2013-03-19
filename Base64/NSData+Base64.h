//
//  NSData+Base64.h
//  Base64
//
//  Created by Tom Zaworowski on 3/19/13.
//  Copyright (c) 2013 LSD programming LLC. All rights reserved.
//
//
//  Make sure to link against libresolv
//
//  DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//  Version 2, December 2004
//
//  Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
//
//  Everyone is permitted to copy and distribute verbatim or modified
//  copies of this license document, and changing it is allowed as long
//  as the name is changed.
//
//  DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//  TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
//
//  0. You just DO WHAT THE FUCK YOU WANT TO.

#import <Foundation/Foundation.h>
#import <resolv.h>

@interface NSData (Base64)

+ (NSData *)dataWithBaseBase64EncodedString:(NSString *)encodedString;
- (NSString *)base64EncodedString;

@end

@interface NSString (Base64)

- (NSString *)base64EncodedString;
- (NSString *)base64DecodedString;
- (NSData *)base64DecodedData;

@end
