//
//  PlayingCard.h
//  cardTestNew
//
//  Created by Ahmed Dizdar on 10/05/15.
//  Copyright (c) 2015 Ahmed Dizdar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "card.h"

#ifndef cardTestNew_PlayingCard_h
#define cardTestNew_PlayingCard_h

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end


#endif
