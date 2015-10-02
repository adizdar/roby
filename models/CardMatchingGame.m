//
//  CardMatchingGame.m
//  cardTestNew
//
//  Created by Ahmed Dizdar on 23/05/15.
//  Copyright (c) 2015 Ahmed Dizdar. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property(nonatomic, readwrite) NSUInteger score;
@property(nonatomic, strong) NSMutableArray *cards;

@end

@implementation CardMatchingGame

// var

    static const int MATCH_POINTS = 4;
    static const int MISMATCH_POINTS = 2;
    static const int COST_TO_CHOOSE = 1;

// init

- (instancetype) initWithCardCount:(NSInteger)count
                         usingDeck:(Deck *)deck
                       matchNumber:(NSUInteger)matchNumber
{
    self = [super init];
    
    if (self) {
        Card *card;
        self.cardMatchNumber = matchNumber;
        
        for (int i = 0; i < count; i++) {
            card = [deck drawRandomCard];
            
            if(card) [self.cards addObject:card];
            else {
                self = nil; // we are returnig nil if we cant initialize
                break;
            }
        }
    }
    
    return self;
}

- (instancetype) init
{
    return nil;
}

// geters & seters

- (NSMutableArray *) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(NSUInteger) cardMatchNumber
{
    if(!_cardMatchNumber) _cardMatchNumber = 2;
    return _cardMatchNumber;
}

// methods

- (Card *)cardAtIndex:(NSUInteger)index
{
    return index < [self.cards count] ? self.cards[index] : nil;
}

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    NSMutableArray *matchCards = [[NSMutableArray alloc] init];
    NSUInteger cardMatchNumber = self.cardMatchNumber - 1; // substratct chosen card

    if(card.isMatched || !(card.chosen = !card.isChosen)) return;

    // filter out matched cards
    for (Card *c in self.cards) {
        if(matchCards.count == cardMatchNumber) break;
        if(c.isChosen && !c.isMatched && c != card) {
            c.chosen = YES;
            [matchCards addObject:c];
        }
    }
    
    // if number of matched cards is same as choosen cards number
    // get match points
    if(matchCards.count == cardMatchNumber) {
        NSUInteger matchPoints = [card match: matchCards];
        
        self.score += (matchPoints) ?
        matchPoints * MATCH_POINTS :
        MISMATCH_POINTS * (-1);
        
        // set matched card status
        for(Card *c in matchCards) {
            c.matched = c.chosen = (BOOL)matchPoints;
        }
        
        card.matched = (BOOL)matchPoints;
    }
    
    self.score -= COST_TO_CHOOSE;

}


//NSArray * filtered = [matchCards filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"aProperty = %@", @"someValue"]];
//NSLog(@"number of items where aProperty = someValue: %d", [filtered count]);

//- (void)chooseCardAtIndex:(NSUInteger)index
//{
//    Card *card = [self cardAtIndex:index];
//    
//    if(card.isMatched) return;
//    if(!(card.chosen = !card.isChosen)) return;
//    
//    for (Card *c in self.cards) {
//        if(c.isChosen && !c.isMatched && c != card) {
//            
//            NSUInteger matchPoints = [card match: @[c]];
//            
//            self.score += (matchPoints) ?
//            matchPoints * MATCH_POINTS :
//            MISMATCH_POINTS * (-1);
//            
//            card.matched = c.matched = c.chosen = (BOOL)matchPoints;
//            break;
//        }
//    }
//    
//    self.score -= COST_TO_CHOOSE;
//    
//}

@end
