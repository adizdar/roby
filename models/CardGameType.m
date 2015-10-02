//
//  CardGameType.m
//  cardTestNew
//
//  Created by Ahmed Dizdar on 07/06/15.
//  Copyright (c) 2015 Ahmed Dizdar. All rights reserved.
//

#import "CardGameType.h"

@implementation CardGameType

-(void) setGameType:(NSUInteger)gameType
{
     // don't allow negative game type
    _gameType = (gameType < 1) ? 0 : gameType;
}

@end
