//
//  ViewController.m
//  cardTestNew
//
//  Created by Ahmed Dizdar on 10/05/15.
//  Copyright (c) 2015 Ahmed Dizdar. All rights reserved.
//

//////////////////////////////////////////
#import "AbstractCardGameViewContoller.h"
/////////////////////////////////////////

@interface AbstractCardGameViewContoller ()

@end

@implementation AbstractCardGameViewContoller


/**
  * Abstract methods
  * - create deck
  */

- (Deck*) createDeck
{
    return nil;
}

/**
  * Geters & seters
  */

- (CardMatchingGame *) game
{
    if (!_game) {
        _game = [self createCardMatchingGame];
    }
    return _game;
}

- (NSUInteger) gameType
{
    return !_gameType ? 2 :_gameType;
}

- (CardMatchingGame *) createCardMatchingGame
{
    return [[CardMatchingGame alloc] initWithCardCount:[self.cardButtonCollection count]
                                             usingDeck: [self createDeck] matchNumber: self.gameType];
}

/**
  * Methods
  */

- (IBAction)cardTouchButton:(UIButton *)sender {
    
    NSUInteger choosenButtonIndex = [self.cardButtonCollection indexOfObject:sender];
    [self.game chooseCardAtIndex: choosenButtonIndex];
    [self updateUi];
    
}

- (void)updateUi
{
    for (UIButton *cardButton in self.cardButtonCollection) {
        NSUInteger cardButtonIndex = [self.cardButtonCollection indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        
        [cardButton setBackgroundImage:[self imageForCard:card]
                              forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %lu", (unsigned long)self.game.score];
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)imageForCard:(Card *)card
{
    return [UIImage imageNamed: card.isChosen ? @"cardMain" : @"cardTop"];
}

//Card *randomCard = [self.pcDeck drawRandomCard];
//
//if(!randomCard) return;
//
//if ([sender.currentTitle length]) {
//    
//    [sender setBackgroundImage:[UIImage imageNamed:@"cardBack"] forState: UIControlStateNormal];
//    [sender setTitle: @"" forState: UIControlStateNormal];
//    
//} else {
//    [sender setBackgroundImage:[UIImage imageNamed:@"cardFront"]
//                      forState: UIControlStateNormal];
//    [sender setTitle: randomCard.contents forState: UIControlStateNormal];
//}
//
//[NSString stringWithFormat:@"%d", randomCard.rank] stringByAppendingString: randomCard.suit
//
//- (void) setFlipCount:(int)flipCount
//{
//    _flipCount = flipCount;
//    self.flipsLabel.text = [NSString stringWithFormat: @"Flips: %d", flipCount];
//}

/*
- (void)viewDidLoad {
    [super viewDidLoad];
     Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
     Dispose of any resources that can be recreated.
}*/

@end
