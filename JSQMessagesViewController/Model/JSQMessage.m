//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import "JSQMessage.h"

@implementation JSQMessage

#pragma mark - Initialization

+ (instancetype)messageWithText:(NSString *)text sender:(NSString *)sender
{
    return [[JSQMessage alloc] initWithText:text sender:sender date:[NSDate date]];
}

- (instancetype)initWithText:(NSString *)text
                      sender:(NSString *)sender
                        date:(NSDate *)date
{
    return [[JSQMessage alloc]initWithText:text
                                   sender:sender
                                     date:date
                                 imageURLs:nil videoPreviewURLs:nil documentNames:nil];
}

- (instancetype)initWithText:(NSString *)text
                      sender:(NSString *)sender
                        date:(NSDate *)date
                   imageURLs:(NSArray *)imageURLs
            videoPreviewURLs:(NSArray *)videoPreviewURLs
               documentNames:(NSArray *)documentNames
{
    NSParameterAssert(text != nil);
    NSParameterAssert(sender != nil);
    NSParameterAssert(date != nil);
    
    self = [self init];
    if (self) {
        _text = text;
        _sender = sender;
        _date = date;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _text = @"";
        _sender = @"";
        _date = [NSDate date];
    }
    return self;
}

- (void)dealloc
{
    _text = nil;
    _sender = nil;
    _date = nil;
    _imageURLs = nil;
    _videoPreviewURLs = nil;
    _documentNames = nil;
}

#pragma mark - JSQMessage

- (BOOL)isEqualToMessage:(JSQMessage *)aMessage
{
    __block BOOL imageArraysMatch = self.imageURLs.count == aMessage.imageURLs.count;
    if (imageArraysMatch)
    {
        [self.imageURLs enumerateObjectsUsingBlock:^(NSURL *url, NSUInteger idx, BOOL *stop) {
            BOOL isEqual = [url.absoluteString isEqualToString:[aMessage.imageURLs[idx] absoluteString]];
            if (!isEqual)
            {
                imageArraysMatch = NO;
                *stop = YES;
            }
        }];
        if (!imageArraysMatch)
            return NO;
    }
    __block BOOL videoArraysMatch = self.videoPreviewURLs.count == aMessage.videoPreviewURLs.count;
    if (videoArraysMatch)
    {
        [self.videoPreviewURLs enumerateObjectsUsingBlock:^(NSURL *url, NSUInteger idx, BOOL *stop) {
            BOOL isEqual = [url.absoluteString isEqualToString:[aMessage.videoPreviewURLs[idx] absoluteString]];
            if (!isEqual)
            {
                videoArraysMatch = NO;
                *stop = YES;
            }
        }];
        if (!videoArraysMatch)
            return NO;
    }
    __block BOOL docArraysMatch = self.documentNames.count == aMessage.documentNames.count;
    if (videoArraysMatch)
    {
        [self.documentNames enumerateObjectsUsingBlock:^(NSString *name, NSUInteger idx, BOOL *stop) {
            BOOL isEqual = [name isEqualToString:aMessage.documentNames[idx]];
            if (!isEqual)
            {
                docArraysMatch = NO;
                *stop = YES;
            }
        }];
        if (!docArraysMatch)
            return NO;
    }
    return [self.text isEqualToString:aMessage.text]
            && [self.sender isEqualToString:aMessage.sender]
            && ([self.date compare:aMessage.date] == NSOrderedSame);
}

#pragma mark - NSObject

- (BOOL)isEqual:(id)object
{
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    
    return [self isEqualToMessage:(JSQMessage *)object];
}

- (NSUInteger)hash
{
    return [self.text hash] ^ [self.sender hash] ^ [self.date hash] ^ [self.imageURLs hash] ^ [self.videoPreviewURLs hash] ^ [self.documentNames hash];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@>[ %@, %@, %@, %@, %@, %@ ]", [self class], self.sender, self.date, self.text, self.imageURLs, self.videoPreviewURLs, self.documentNames];
}

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _text = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(text))];
        _sender = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(sender))];
        _date = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(date))];
        _imageURLs = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(imageURLs))];
        _videoPreviewURLs = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(videoPreviewURLs))];
        _documentNames = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(documentNames))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.text forKey:NSStringFromSelector(@selector(text))];
    [aCoder encodeObject:self.sender forKey:NSStringFromSelector(@selector(sender))];
    [aCoder encodeObject:self.date forKey:NSStringFromSelector(@selector(date))];
    [aCoder encodeObject:self.imageURLs forKey:NSStringFromSelector(@selector(imageURLs))];
    [aCoder encodeObject:self.videoPreviewURLs forKey:NSStringFromSelector(@selector(videoPreviewURLs))];
    [aCoder encodeObject:self.documentNames forKey:NSStringFromSelector(@selector(documentNames))];
}

#pragma mark - NSCopying

- (instancetype)copyWithZone:(NSZone *)zone
{
    return [[[self class] allocWithZone:zone] initWithText:[self.text copy]
                                                    sender:[self.sender copy]
                                                      date:[self.date copy]
                                                 imageURLs:[self.imageURLs copy]
                                          videoPreviewURLs:[self.videoPreviewURLs copy]
                                             documentNames:[self.documentNames copy]];
}

@end
