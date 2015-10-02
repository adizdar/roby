//
//  CardMatchingGame.h
//  cardTestNew
//
//  Created by Ahmed Dizdar on 23/05/15.
//  Copyright (c) 2015 Ahmed Dizdar. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Deck.h"

@interface CardMatchingGame : NSObject

@property(nonatomic, readonly) NSUInteger score;
@property(nonatomic) NSUInteger cardMatchNumber;

- (instancetype)initWithCardCount: (NSInteger) count
                        usingDeck:(Deck *) deck
                      matchNumber:(NSUInteger) matchNumber;

- (void)chooseCardAtIndex: (NSUInteger) index;
- (Card *)cardAtIndex: (NSUInteger) index;

@end
