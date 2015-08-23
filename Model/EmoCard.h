//
//  EmoCard.h
//  CS63AMatch
//
//  Created by Chris on 7/19/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import "Card.h"

@interface EmoCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
