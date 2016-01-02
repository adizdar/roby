//
//  PlayingCardView.m
//  cardTestNew
//
//  Created by Ahmed Dizdar on 02/01/16.
//  Copyright © 2016 Ahmed Dizdar. All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView


#pragma mark OVERRIDE_PARENT_METHODS

- (NSString *)getCornerTextFormat
{
    return @"4";
}

- (NSString *)getFaceImageFormat
{
    return @"%@";
}

- (NSString *)getFaceImageName
{
    return @"4";
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
