//
//  CardMatchingGame.h
//  CS63AMatch
//
//  Created by Chris on 7/18/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

// designated initializer
-(instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck*)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;


@property (nonatomic, readonly) NSString *results;
@property (nonatomic, readonly) NSInteger score;


@end
