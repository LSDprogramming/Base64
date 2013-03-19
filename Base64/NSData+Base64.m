//
//  NSData+Base64.m
//  Base64
//
//  Created by Tom Zaworowski on 3/19/13.
//  Copyright (c) 2013 LSD programming LLC. All rights reserved.
//

#import "NSData+Base64.h"

@implementation NSData (Base64)

+ (NSData *)dataWithBaseBase64EncodedString:(NSString *)encodedString {
    NSData *dataToEncode = [encodedString dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encodedData = nil;
    
    NSUInteger dataToEncodeLength = dataToEncode.length;
    NSUInteger encodedBufferLength = ((dataToEncodeLength + 2) / 3) * 4;
    
    char *encodedBuffer = malloc(encodedBufferLength);
    
    int encodedRealLength = b64_ntop(dataToEncode.bytes, dataToEncodeLength,
                                     encodedBuffer, encodedBufferLength);
    
    if(encodedRealLength >= 0) {
        encodedData = [NSData dataWithBytesNoCopy:encodedBuffer
                                           length:encodedRealLength
                                     freeWhenDone:YES];
    } else {
        free(encodedBuffer);
    }
    
    return [NSString stringWithCString:encodedData.bytes encoding:NSASCIIStringEncoding];
    
}

- (NSString *)base64EncodedString {
    NSData *dataToEncode = self;
    NSData *encodedData = nil;
    
    NSUInteger dataToEncodeLength = dataToEncode.length;
    NSUInteger encodedBufferLength = ((dataToEncodeLength + 2) / 3) * 4;
    
    char *encodedBuffer = malloc(encodedBufferLength);
    
    int encodedRealLength = b64_ntop(dataToEncode.bytes, dataToEncodeLength,
                                     encodedBuffer, encodedBufferLength);
    
    if(encodedRealLength >= 0) {
        encodedData = [NSData dataWithBytesNoCopy:encodedBuffer
                                           length:encodedRealLength
                                     freeWhenDone:YES];
    } else {
        free(encodedBuffer);
    }
    
    return [NSString stringWithCString:encodedData.bytes encoding:NSASCIIStringEncoding];
}

@end

@implementation NSString (Base64)

- (NSString *)base64EncodedString {
    NSData *dataToEncode = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encodedData = nil;
    
    NSUInteger dataToEncodeLength = dataToEncode.length;
    NSUInteger encodedBufferLength = ((dataToEncodeLength + 2) / 3) * 4 + 1;
    
    char *encodedBuffer = malloc(encodedBufferLength);
    
    int encodedRealLength = b64_ntop(dataToEncode.bytes, dataToEncodeLength,
                                     encodedBuffer, encodedBufferLength);
    
    if(encodedRealLength >= 0) {
        encodedData = [NSData dataWithBytesNoCopy:encodedBuffer
                                           length:encodedRealLength + 1
                                     freeWhenDone:YES];
    } else {
        free(encodedBuffer);
    }
    
    return [NSString stringWithCString:encodedData.bytes encoding:NSASCIIStringEncoding];
}

- (NSString *)base64DecodedString {
    NSData *dataToDecode = [self dataUsingEncoding:NSASCIIStringEncoding];
    NSData *decodedData = nil;
    
    NSUInteger decodedBufferLength = dataToDecode.length * 3 / 4;
    uint8_t* decodedBuffer = malloc(decodedBufferLength);
    
    int decodedBufferRealLength = b64_pton(dataToDecode.bytes,
                                           decodedBuffer,
                                           decodedBufferLength);
    
    if(decodedBufferRealLength >= 0) {
        decodedData = [NSData dataWithBytesNoCopy:decodedBuffer
                                           length:decodedBufferRealLength
                                     freeWhenDone:YES];
    } else {
        free(decodedBuffer);
    }
    
    return [NSString stringWithCString:decodedData.bytes encoding:NSUTF8StringEncoding];
}

- (NSData *)base64DecodedData {
    NSData *dataToDecode = [self dataUsingEncoding:NSASCIIStringEncoding];
    NSData *decodedData = nil;
    
    NSUInteger decodedBufferLength = dataToDecode.length * 3 / 4;
    uint8_t* decodedBuffer = malloc(decodedBufferLength);
    
    int decodedBufferRealLength = b64_pton(dataToDecode.bytes,
                                           decodedBuffer,
                                           decodedBufferLength);
    
    if(decodedBufferRealLength >= 0) {
        decodedData = [NSData dataWithBytesNoCopy:decodedBuffer
                                           length:decodedBufferRealLength
                                     freeWhenDone:YES];
    } else {
        free(decodedBuffer);
    }
    
    return decodedData;
}

@end
