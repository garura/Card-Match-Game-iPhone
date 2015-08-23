//
//  ViewController.h
//  CS63AMatch
//
//  Created by Chris on 6/29/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

// Abstract Class

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface ViewController : UIViewController

-(Deck *)createDeck; // abstract

@end

