//
//  PlayingCardViewController.m
//  cardTestNew
//
//  Created by Ahmed Dizdar on 23/06/15.
//  Copyright (c) 2015 Ahmed Dizdar. All rights reserved.
//

///////////////////////////////////////
#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCardView.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]
///////////////////////////////////////

@interface PlayingCardViewController ()

@end

@implementation PlayingCardViewController

/**
  * Override parent methods
  */

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (NSString *) playedMovesHistory
{
    if (![super playedMovesHistory]) {
        [super setPlayedMovesHistory: @""];
    }
    
    return [super playedMovesHistory];
}

- (void)updateUi
{
    NSUInteger cardButtonIndex;
    Card *card;
    
    for (UIButton *cardButton in self.cardButtonCollection) {
        cardButtonIndex = [self.cardButtonCollection indexOfObject:cardButton];
        card = [self.game cardAtIndex:cardButtonIndex];

        [cardButton setTitle: [self titleForCard:card]
                    forState: UIControlStateNormal];
        
        [cardButton setBackgroundImage: [self imageForCard:card]
                              forState: UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;
    }

    self.navigationController.navigationBar.topItem.title = [NSString stringWithFormat:@"Score: %d", (int)self.game.score];
}

/**
  * View specific events
  */

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : UIColorFromRGB(0x329EFE)};
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) receiveTestNotification:(NSNotification *) notification
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
    
    if ([[notification name] isEqualToString:@"TestNotification"])
        NSLog (@"Successfully received the test notification!");
}

//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
////    UIAppDelegate.historyData = self.playedMovesHistory;
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
