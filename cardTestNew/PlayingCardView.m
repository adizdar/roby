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

#pragma mark - Override

#pragma mark NEEDS_TO_OVERRIDE_TITLE_FOR_CARD_&_IMAGE_FOR_CARD

- (NSString *)getCornerText
{
//    return [NSString stringWithFormat:@"%@\n%@", @(self.rank), self.suit];
    
    return [NSString stringWithFormat: @"%@", self.contents];
}

- (NSString *)getFaceImageFormat
{
    return @"%@";
}

- (NSString *)getFaceImageName
{
    return self.faceUp ? [NSString stringWithFormat:@"%@", @(self.rank)] : @"cardTop";
}

- (void)drawOnFaceUpCard
{
    [self drawImageOnCard];
     [self drawCorners];
}

- (void)drawOnFaceDownCard
{
    [self drawImageOnCard];
}

#pragma mark - Custom Accessors

- (void)setSuit:(NSString *)suit
{
    _suit = suit;
    [self setNeedsDisplay];
}

- (void)setRank:(NSUInteger)rank
{
    _rank = rank;
    [self setNeedsDisplay];
}

#pragma mark PRIVATE

- (void)awakeFromNib
{
    self.faceUp = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
