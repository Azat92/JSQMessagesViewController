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

#import <Foundation/Foundation.h>

#import "JSQMessageData.h"

/**
 *  A `JSQMessage` model object represents a single user message. 
 *  This is a concrete class that implements the `JSQMessageData` protocol. 
 *  It contains the message text, its sender, and the date that the message was sent.
 */
@interface JSQMessage : NSObject <JSQMessageData, NSCoding, NSCopying>

/**
 *  The body text of the message. This value must not be `nil`.
 */
@property (copy, nonatomic) NSString *text;

/**
 *  The name of user who sent the message. This value must not be `nil`.
 */
@property (copy, nonatomic) NSString *sender;

/**
 *  The date that the message was sent. This value must not be `nil`.
 */
@property (copy, nonatomic) NSDate *date;

/**
 *  The array of image URLs for message was sent.
 */
@property (nonatomic, strong) NSArray *imageURLs;

/**
 *  The array of video preview URLs for message was sent.
 */
@property (nonatomic, strong) NSArray *videoPreviewURLs;

/**
 *  The array of document names for message was sent.
 */
@property (nonatomic, strong) NSArray *documentNames;

#pragma mark - Initialization

/**
 *  Initializes and returns a message object having the given text, sender, and current system date.
 *
 *  @param text   The body text of the message.
 *  @param sender The name of the user who sent the message.
 *
 *  @return An initialized `JSQMessage` object or `nil` if the object could not be successfully initialized.
 */
+ (instancetype)messageWithText:(NSString *)text sender:(NSString *)sender;

/**
 *  Initializes and returns a message object having the given text, sender, and date.
 *
 *  @param text   The body text of the message.
 *  @param sender The name of the user who sent the message.
 *  @param date   The date that the message was sent.
 *
 *  @return An initialized `JSQMessage` object or `nil` if the object could not be successfully initialized.
 */
- (instancetype)initWithText:(NSString *)text
                      sender:(NSString *)sender
                        date:(NSDate *)date;

/**
 *  Initializes and returns a message object having the given text, sender, and date.
 *
 *  @param text             The body text of the message.
 *  @param sender           The name of the user who sent the message.
 *  @param date             The date that the message was sent.
 *  @param imageURLs        The embedded image URLs
 *  @param videoPreviewURLs The embedded video preview URLs
 *  @param documentNames    The embedded document names
 *
 *  @return An initialized `JSQMessage` object or `nil` if the object could not be successfully initialized.
 */
- (instancetype)initWithText:(NSString *)text
                      sender:(NSString *)sender
                        date:(NSDate *)date
                   imageURLs:(NSArray *)imageURLs
            videoPreviewURLs:(NSArray *)videoPreviewURLs
               documentNames:(NSArray *)documentNames;

/**
 *  Returns a boolean value that indicates whether a given message is equal to the receiver.
 *
 *  @param aMessage The message with which to compare the receiver.
 *
 *  @return `YES` if aMessage is equivalent to the receiver, otherwise `NO`.
 */
- (BOOL)isEqualToMessage:(JSQMessage *)aMessage;

@end
