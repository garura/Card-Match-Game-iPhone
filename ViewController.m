//
//  ViewController.m
//  CS63AMatch
//
//  Created by Chris on 6/29/15.
//  Copyright (c) 2015 Chris. All rights reserved.
//

#import "ViewController.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *DealBarButton;
@property (weak, nonatomic) IBOutlet UILabel *ResultsLabel;
@end

@implementation ViewController

-(CardMatchingGame *)game {
   if (!_game) {
      _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                usingDeck:[self createDeck]];
   }
   return _game;
}

- (IBAction)touchDealBarButton:(UIBarButtonItem *)sender {
   // re allocate game. (does doing it this way cause memory leak??)
   _game = nil;
   _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                             usingDeck:[self createDeck]];
   [self updateUI];
}

-(Deck *)createDeck {
   return nil;
}



- (IBAction)touchCardButton:(UIButton *)sender {
   int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
   [self.game chooseCardAtIndex:chosenButtonIndex];
   [self updateUI];
}


-(void)updateUI {
   for (UIButton *cardButton in self.cardButtons) {
      int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
      Card *card = [self.game cardAtIndex:cardButtonIndex];
      [cardButton setTitle:[self titleForCard:card]  forState:UIControlStateNormal];
      [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
      cardButton.enabled = !card.isMatched;
      self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
      self.ResultsLabel.text = self.game.results;
   }


}


-(NSString *)titleForCard:(Card *)card {
   return card.isChosen ? card.contents : @"";
}

-(UIImage *)backgroundImageForCard:(Card *)card {
   return [UIImage imageNamed:card.isChosen ? @"CardFront" : @"CardBack"];
}



@end
