//
//  SetCardDeck.m
//  cardTestNew
//
//  Created by Ahmed Dizdar on 09/10/15.
//  Copyright © 2015 Ahmed Dizdar. All rights reserved.
//

#import "SetCardDeck.h"

@implementation SetCardDeck

-(instancetype) init
{
    self = [super init];
    
    if (self) {
        SetCard *card;
        
        // we use ID because the deck shouldnt care about the type, the controller should handle the type case
        // "duck typing", if it quacks like a duck it is a duck
        for (id shape in [SetCard validShapes]) {
            for (id color in [SetCard validGameFeatures]) {
                for (id type in [SetCard validGameFeatures]) {
                    for (id number in [SetCard validNumber]) {
                        card = [[SetCard alloc] init];
                        
                        card.shape = shape;
                        card.color = color;
                        card.shapeType = type;
                        card.shapeNumber = number;
                        
                        [self addCard:card atTop:YES];
                    }
                }
            }
        }
        
        
    }
    
    return self;
}


@end
