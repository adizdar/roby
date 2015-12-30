//
//  PlayingCardDeck.m
//  cardTestNew
//
//  Created by Ahmed Dizdar on 11/05/15.
//  Copyright (c) 2015 Ahmed Dizdar. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype) init
{
    self = [super init];
    
    if (self) {
        PlayingCard *card = nil;
        NSUInteger maxRank = [PlayingCard maxRank];
        
        for (NSString *suits in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank < maxRank ; rank++) {
                card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suits;
                
                [self addCard:card];
            }
        }
        
    }
    
    return self;
}

@end

