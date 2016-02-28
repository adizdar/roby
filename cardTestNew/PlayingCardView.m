//
//  PlayingCardView.m
//  cardTestNew
//
//  Created by Ahmed Dizdar on 02/01/16.
//  Copyright © 2016 Ahmed Dizdar. All rights reserved.
//

#import "PlayingCardView.h"
#import "PlayingCard.h"

@interface PlayingCardView ()
@end

@implementation PlayingCardView

#pragma mark PRIVATE

#pragma mark OVERRIDE_PARENT_METHODS

- (NSString *)getCornerText
{
    return @"A";
    //return [NSString stringWithFormat:@"%@\n%@", @(self.rank), self.suit];
}

- (NSString *)getFaceImageFormat
{
    return @"%@";
}

- (NSString *)getFaceImageName
{
    return @"1";
    //return self.faceUp ? [NSString stringWithFormat:@"%@", @(self.rank)] : @"cardTop";
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
