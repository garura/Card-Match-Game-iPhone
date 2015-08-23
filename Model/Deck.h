//
//  Deck.h
//  CS63AMatch
//
//  Created by Chris on 7/6/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card*)drawRandomCard;




@end
