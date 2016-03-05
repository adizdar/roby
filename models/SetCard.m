//
//  SetCard.m
//  cardTestNew
//
//  Created by Ahmed Dizdar on 04/10/15.
//  Copyright © 2015 Ahmed Dizdar. All rights reserved.
//

#import "SetCard.h"

#define POINTS 6

@interface SetCard()

@end

@implementation SetCard

-(int)match:(NSArray *)otherCards
{
    SetCard* card = nil;
    int score = 0, length = 0;
    
    //  shape, color, type & number, is common stuff so we can use it if we make a unique set game
    //  Dictionary with set as value, because set doesn't allow duplicate items
    NSDictionary* counter = @{@"shape": [[NSMutableSet alloc] initWithObjects:self.shape, nil],
                              @"color": [[NSMutableSet alloc] initWithObjects:self.color, nil],
                              @"type": [[NSMutableSet alloc] initWithObjects:self.shapeType, nil],
                              @"number": [[NSMutableSet alloc] initWithObjects:self.shapeNumber, nil]};
    
    // sort cards by type to dictionary
    for (id c in otherCards) {
        
        if([c isKindOfClass: [SetCard class]]) {
            card = (SetCard *) c;
            
            [counter[@"shape"] addObject: card.shape];
            [counter[@"color"] addObject: card.color];
            [counter[@"type"] addObject: card.shapeType];
            [counter[@"number"] addObject: card.shapeNumber];
        }
        
    }
    
    // @todo make this logic below better
    
    // check if we have a set
    for (NSString* key in counter) {
        if ([counter[key] count] == 1 || [counter[key] count] == [otherCards count] + 1) {
            length += 1;
        }
    }

    // if length is same as the number of items it is a set
    if(length == [counter count]) {
        score += POINTS;
    }
    
    return score;
}

#pragma mark - Properties

- (NSString *) contents
{
    return @"";
}

+ (NSArray*) validShapes
{
    return @[@0, @1, @2];
}

+ (NSArray *) validGameFeatures
{
   return @[@0, @1, @2];
}

+ (NSDictionary*) combinedPropertiesInDictionary
{
    return @{@"shape":  [self validShapes],
             @"color": [self validColor],
             @"type": [self validShapeType],
             @"number": [self validNumber]};
}

+ (NSArray*) validNumber
{
    return @[@1, @2, @3];
}

// OBSOLATE, just for referanace
+ (NSArray*) validShapeType
{
    return @[@0, @1, @2];
}

+ (NSArray*) validColor
{
    return @[@0, @1, @2];
}






@end
