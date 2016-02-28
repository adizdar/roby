//
//  ViewController.h
//  cardTestNew
//
// * Abstract class for roby card game
//
//  Created by Ahmed Dizdar on 10/05/15.
//  Copyright (c) 2015 Ahmed Dizdar. All rights reserved.
//

/////////////////////////
#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardMatchingGame.h"
#import "HistoryController.h"
/////////////////////////

@interface AbstractCardGameViewContoller : UIViewController

    // -- Properties
    @property(nonatomic) NSUInteger gameType;
    @property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtonCollection;
    @property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
    @property (strong, nonatomic) Deck *pcDeck;
    @property (nonatomic, strong) CardMatchingGame *game;
//    @property (nonatomic, strong) id <HistoryController> historyController; // genric controller option for history implementation, the protocol definition needs to be implemented in the historyViewController

    // -- Public methods
    - (void)updateUi;
    - (NSString *)titleForCard:(Card *)card;
    - (UIImage *)imageForCard:(Card *)card;
    - (NSString *) createMoveHistory: (Card *)card;


    /// ! -- Abstract/Protected/Override
    @property(nonatomic, strong) id playedMovesHistory; // because it can be NSString or NSAttributedString ...
    - (Deck*) createDeck;
    - (void) updateMoveHistory: (Card *) card;


@end
