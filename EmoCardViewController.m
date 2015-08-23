//
//  EmoCardViewController.m
//  CS63AMatch
//
//  Created by Chris on 7/19/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import "EmoCardViewController.h"
#import "EmoDeck.h"

@interface EmoCardViewController ()

@end

@implementation EmoCardViewController

-(Deck *)createDeck {
   return [[EmoDeck alloc] init];
}



@end
