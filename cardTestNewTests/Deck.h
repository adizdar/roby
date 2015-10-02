//
//  Deck.h
//  cardGameTest
//
//  Created by Ahmed Dizdar on 09/05/15.
//
//

#import <Foundation/Foundation.h>
#import "card.h"

#ifndef cardGameTest_Deck_h
#define cardGameTest_Deck_h

@interface Deck : NSObject

- (void)addCard: (Card *)card atTop:(BOOL)atTop;
- (void)addCard: (Card *)card;

- (Card *)drawRandomCard;

@end

#endif
