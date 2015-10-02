//
//  CardGameType.h
//  cardTestNew
//
//  Created by Ahmed Dizdar on 07/06/15.
//  Copyright (c) 2015 Ahmed Dizdar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardGameType : UIButton

@property(nonatomic) NSUInteger gameType;
@property(nonatomic) BOOL isChosen;
@property(nonatomic, strong) NSArray *optionalCollection;
@property(nonatomic, strong) NSString *stateChosen;
@property(nonatomic, strong) NSString *stateNotChosen;

@end
