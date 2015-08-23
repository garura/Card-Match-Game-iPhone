//
//  VegasCard.h
//  CS63AMatch
//
//  Created by Chris on 7/6/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import "Card.h"

@interface VegasCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
