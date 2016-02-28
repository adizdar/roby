//
//  PlayingCardView.h
//  cardTestNew
//
//  Created by Ahmed Dizdar on 30/12/15.
//  Copyright © 2015 Ahmed Dizdar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AbstractCardView : UIView

@property(strong, nonatomic) NSString* suit;
@property(nonatomic) NSUInteger rank;
@property(nonatomic) BOOL faceUp;

- (id)initWithFrame:(CGRect)frame;

// @virtual methods
- (UIColor *)getCardBacgroundColor; // default white
- (UIColor *)getStrokeColor; // default black
- (CGPoint) getCornerTextPosition; // default corrnerOffset

// @override
- (NSString *)getCornerText;
- (NSString *)getFaceImageFormat;
- (NSString *)getFaceImageName; // NOTE needs to include faceDown image

@end
