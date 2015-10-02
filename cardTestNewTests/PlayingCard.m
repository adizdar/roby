//
//  PlayingCard.m
//  cardTestNew
//
//  Created by Ahmed Dizdar on 10/05/15.
//  Copyright (c) 2015 Ahmed Dizdar. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

// override parent

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    BOOL isSuit = NO;
    BOOL isRank = NO;
    PlayingCard *card = nil;
    
    // match cards only if all cards have suit or rank in common & if they are playingCard type
    for (id c in otherCards) {
        
        // introspection
        if([c isKindOfClass:[PlayingCard class]]) {
            
            card = (PlayingCard *) c;
            
            if( card.suit == self.suit && !isRank ) {
                score = 1;
                isSuit = YES;
            }
            else if( card.rank == self.rank && !isSuit ) {
                score = 4;
                isRank = YES;
            }
            else {
                score = 0;
                break;
            }
        }

    }
    
    return score;
}

// getters & setters

@synthesize suit = _suit; // because we provide geter & seter

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

// methods

+ (NSArray *)validSuits
{
    return @[@"♥", @"♠︎", @"◆", @"♣︎"];
}

+ (NSArray *)rankStrings
{
    return @[@"?", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank
{
    return [[self rankStrings] count] - 1;
}

- (void) setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end