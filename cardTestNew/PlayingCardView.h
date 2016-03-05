//
//  PlayingCardView.h
//  cardTestNew
//
//  Created by Ahmed Dizdar on 02/01/16.
//  Copyright © 2016 Ahmed Dizdar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractCardView.h"

@interface PlayingCardView : AbstractCardView
    @property (nonatomic, strong) NSString* contents;
    @property(strong, nonatomic) NSString* suit;
    @property(nonatomic) NSUInteger rank;
@end
