//
//  VegasDeck.m
//  CS63AMatch
//
//  Created by Chris on 7/6/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import "VegasDeck.h"
#import "VegasCard.h"

@implementation VegasDeck

- (instancetype)init {

   self = [super init];

   if (self) {
      for (NSString *suit in [VegasCard validSuits]) {
         for (NSUInteger rank=1; rank <= [VegasCard maxRank]; rank++) {
            VegasCard *card = [[VegasCard alloc] init];
            card.rank = rank;
            card.suit = suit;
            [self addCard:card];
         }

      }

   }
   
   return self;
}


@end
