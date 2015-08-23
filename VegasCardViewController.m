//
//  VegasCardViewController.m
//  CS63AMatch
//
//  Created by Chris on 7/19/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import "VegasCardViewController.h"
#import "VegasDeck.h"

@interface VegasCardViewController ()

@end

@implementation VegasCardViewController

-(Deck *)createDeck {
   return [[VegasDeck alloc] init];
}

@end
