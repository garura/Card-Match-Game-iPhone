//
//  EmoDeck.m
//  CS63AMatch
//
//  Created by Chris on 7/19/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import "EmoDeck.h"
#import "EmoCard.h"

@implementation EmoDeck

- (instancetype)init {

   self = [super init];

   if (self) {
      for (NSString *suit in [EmoCard validSuits]) {
         for (NSUInteger rank=1; rank <= [EmoCard maxRank]; rank++) {
            EmoCard *card = [[EmoCard alloc] init];
            card.rank = rank;
            card.suit = suit;
            [self addCard:card];
         }

      }

   }
   
   return self;
}

@end
