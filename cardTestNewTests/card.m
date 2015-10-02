//
//  card.m
//  cardGameTest
//
//  Created by Ahmed Dizdar on 09/05/15.
//
//

#import "Card.h"

@interface Card()

@end

@implementation Card

- (int)match:(NSArray *)otherCards
{
    
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score ++;
        }
    }
    
    return score;
}

@end