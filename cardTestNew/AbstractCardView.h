//
//  PlayingCardView.h
//  cardTestNew
//
//  Created by Ahmed Dizdar on 30/12/15.
//  Copyright © 2015 Ahmed Dizdar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AbstractCardView : UIView

@property(nonatomic) BOOL faceUp;

- (id)initWithFrame:(CGRect)frame;

// @units
- (CGFloat)cornerScaleFactor;
- (CGFloat)cornerRadius;
- (CGFloat)cornerOffset;

// @virtual methods
- (UIColor *)getStrokeColor; // default black
- (UIColor *)getCardBacgroundColor; // default white
- (CGPoint) getCornerTextPosition; // default corrnerOffset
- (void) drawImageOnCard; // it use by default getFaceImageName method
- (void)drawImageOnCard: (NSString *)imageName;
- (void) drawCorners; // default text on left and lower right corner

// @override
- (NSString *)getCornerText;
- (NSString *)getFaceImageName; // NOTE needs to include faceDown image
- (NSString *)getFaceImageFormat;
- (void) drawOnFaceUpCard;
- (void) drawOnFaceDownCard;
@end
