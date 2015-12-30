//
//  ViewController.m
//  cardTestNew
//
//  Created by Ahmed Dizdar on 10/05/15.
//  Copyright (c) 2015 Ahmed Dizdar. All rights reserved.
//

//////////////////////////////////////////
#import "AbstractCardGameViewContoller.h"
#import "AppDelegate.h"
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

//- (NSString *) playedMovesHistory
//{
//    if (!_playedMovesHistory) {
//        _playedMovesHistory = @"";
//    }
//    
//    return _playedMovesHistory;
//}

/**
  * Methods
  */

- (IBAction)cardTouchButton:(UIButton *)sender {
    NSUInteger choosenButtonIndex = [self.cardButtonCollection indexOfObject:sender];
    
    [self.game chooseCardAtIndex: choosenButtonIndex];
    [self updateMoveHistory: [self.game cardAtIndex: choosenButtonIndex]];
    [self updateUi];
    
}

- (IBAction)resetCardGame:(id)sender {
    self.game = [self createCardMatchingGame];
    self.playedMovesHistory = nil;
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
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", (int)self.game.score];
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)imageForCard:(Card *)card
{
    return [UIImage imageNamed: card.isChosen ? @"cardMain" : @"cardTop"];
}

/** 
  * This class can be Overided or used like this
 */
- (void) updateMoveHistory: (Card *) card
{
    self.playedMovesHistory = [self.playedMovesHistory stringByAppendingString: [self createMoveHistory:card]];
}

- (NSString *) createMoveHistory: (Card *)card
{
    // to be sure that history of moves is always string
    NSString* tempMoves = ![self.playedMovesHistory isKindOfClass:[NSString class]] ? [self.playedMovesHistory string] : self.playedMovesHistory;
    NSInteger moveCounter = [[tempMoves componentsSeparatedByCharactersInSet:
                              [NSCharacterSet newlineCharacterSet]] count];
    NSInteger chosenCardsCounter = [self.game getChosenCardsCounter];
    
    // add the move counter if the chosen card is one
    NSString* history = (chosenCardsCounter == 1) ? [NSString stringWithFormat:@"%ld%s", moveCounter, "."] : @"";
    
    // if the card is matched don't add the card for the next move
    if (card.isMatched) {
        history = [NSString stringWithFormat: @"%@ %s\n", [self titleForCard:card], "MATCHED"];
    } else {
        // if moves are equal to game type add next card to next move
        // if the moves are equal to game type add counter+1 for the next move
        history = [history stringByAppendingString: (chosenCardsCounter != self.gameType) ?
        [NSString stringWithFormat:@" %@", [self titleForCard:card]] :
        [NSString stringWithFormat:@" %@ \n %ld%s %@", [self titleForCard:card], moveCounter + 1, ".", [self titleForCard:card]]];
    }
    
    return history;
}

#pragma mark - View events

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    UIAppDelegate.historyData = self.playedMovesHistory;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
