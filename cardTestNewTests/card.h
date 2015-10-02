//
//  card.h
//  cardGameTest
//
//  Created by Ahmed Dizdar on 09/05/15.
//
//

#import <Foundation/Foundation.h>

#ifndef cardGameTest_card_h
#define cardGameTest_card_h

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) bool chosen;
@property (nonatomic, getter=isMatched) bool matched;

- (int)match:(NSArray *)otherCards;

@end


#endif
