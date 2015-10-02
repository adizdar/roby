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
/////////////////////////

@interface AbstractCardGameViewContoller : UIViewController

    // -- Properties
    @property(nonatomic) NSUInteger gameType;
    @property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtonCollection;
    @property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
    @property (strong, nonatomic) Deck *pcDeck;
    @property (nonatomic, strong) CardMatchingGame *game;

    // -- Public methods
    - (void)updateUi;
    - (NSString *)titleForCard:(Card *)card;
    - (UIImage *)imageForCard:(Card *)card;

    /// ! -- Abstract/Protected
    - (Deck*) createDeck;

@end
