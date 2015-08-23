//
//  VegasCard.m
//  CS63AMatch
//
//  Created by Chris on 7/6/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import "VegasCard.h"

@implementation VegasCard

-(int)match:(NSArray *)otherCards {
   int score = 0;

   if ([otherCards count] == 1) {
      VegasCard *otherCard = [otherCards firstObject];
      if (otherCard.rank == self.rank) {
         score = 4;
      }
      else if ([otherCard.suit isEqualToString:self.suit]) {
         score = 1;
      }
   }
   
   return score;
}




- (NSString *) contents {
   NSArray *rankStrings = [VegasCard rankStrings];
   return [rankStrings[self.rank] stringByAppendingString:self.suit];
}


@synthesize suit = _suit;


+ (NSArray *)validSuits {
   return @[@"♥️",@"♦️",@"♠️",@"♣️"];
}

- (void)setSuit:(NSString *)suit {
   if ([[VegasCard validSuits] containsObject:suit]) {
      _suit= suit;
   }
}

- (NSString *)suit {
   return _suit ? _suit : @"?";
}


+ (NSArray *)rankStrings {
   return @[@"?", @"A", @"2", @"3",@"4",@"5",@"6",@"7",@"8",
            @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank {
   return [[self rankStrings] count]-1;
}

- (void)setRank:(NSUInteger)rank {
   if (rank <= [VegasCard maxRank]) {
      _rank = rank;
   }
}

@end