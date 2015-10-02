//
//  CardGameTypesCollection.h
//  cardTestNew
//
//  Created by Ahmed Dizdar on 08/06/15.
//  Copyright (c) 2015 Ahmed Dizdar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardGameType.h"

@interface CardGameTypesCollection : NSObject

@property(nonatomic) NSUInteger gameTypeIndentificator;
@property(nonatomic, strong) NSArray *gameTypeCollection;

- (instancetype) initWithCollection: (NSArray *)gameTypeCollection;
- (BOOL) toggleGameTypes: (NSUInteger) index;


@end
