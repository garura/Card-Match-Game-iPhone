//
//  CardMatchingGame.m
//  CS63AMatch
//
//  Created by Chris on 7/18/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // type Cards
@property (nonatomic, readwrite) NSString *results;
@end


@implementation CardMatchingGame

-(NSMutableArray *)cards {
   if (!_cards) {
      _cards = [[NSMutableArray alloc] init];
   }
   return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck {
   self = [super init];
   if (self) {
      for (int i = 0; i < count; i++) {
         Card *card = [deck drawRandomCard];
         if (card) {
            [self.cards addObject:card];
         }
         else {
            self = nil;
            break;
         }

      }
   }
   return self;
}


-(Card *)cardAtIndex:(NSUInteger)index {
   return (index<[self.cards count]) ? self.cards[index] : nil;
}


static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;


-(void)chooseCardAtIndex:(NSUInteger)index {

   Card *card = [self cardAtIndex:index];

   if (!card.isMatched) {
      if (card.isChosen) {
         card.chosen = NO;
         self.results = @"";
      }
      else {
         // match against other chosen cards
         self.results = [NSString stringWithFormat:@"%@", card.contents];
         for (Card *otherCard in self.cards) {
            if (otherCard.isChosen && !otherCard.isMatched) {
               int matchScore = [card match:@[otherCard]];
               if (matchScore) {
                  self.score += matchScore * MATCH_BONUS;
                  otherCard.matched = YES;
                  card.matched = YES;
                  self.results = [NSString stringWithFormat:@"%@ %@ Match! %d Points!",
                                  card.contents,otherCard.contents,(matchScore * MATCH_BONUS)];
               }
               else {
                  self.score -= MISMATCH_PENALTY;
                  otherCard.chosen = NO;
                  self.results = [NSString stringWithFormat:@"%@ %@ Don't Match! - %d Points!",
                                  card.contents,otherCard.contents,MISMATCH_PENALTY];
               }
               break; // can only choose 2 cards for now
            }
         }
         self.score -= COST_TO_CHOOSE;
         card.chosen = YES;
      }
   }
}



@end
