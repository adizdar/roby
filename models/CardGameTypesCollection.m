//
//  CardGameTypesCollection.m
//  cardTestNew
//
//  Created by Ahmed Dizdar on 08/06/15.
//  Copyright (c) 2015 Ahmed Dizdar. All rights reserved.
//

#import "CardGameTypesCollection.h"

@implementation CardGameTypesCollection

-(instancetype) initWithCollection: (NSArray *)gameTypeCollection
{
    self = [super init];
    
    if(!self) return nil;
    
    self.gameTypeCollection = gameTypeCollection;
    
    return self;
    
}

-(NSUInteger) gameTypeIndentificator
{
    return !_gameTypeIndentificator ? 2 : _gameTypeIndentificator;
}

-(BOOL) toggleGameTypes: (NSUInteger) index
{
    CardGameType *gameType = [self.gameTypeCollection objectAtIndex: index];
    
    if(!gameType) return NO;
    
    gameType.isChosen = YES;
    self.gameTypeIndentificator = gameType.gameType;
    
    for (CardGameType *type in self.gameTypeCollection) {
        if(type != gameType) type.isChosen = false;
    }
    
    return YES;
}

@end
