//
//  PlayingCardView.m
//  cardTestNew
//
//  Created by Ahmed Dizdar on 30/12/15.
//  Copyright © 2015 Ahmed Dizdar. All rights reserved.
//

#import "AbstractCardView.h"

@implementation AbstractCardView

#pragma mark UNITS
////////////////////////////////

// Scale factor so it will addjust with the card size

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

#define CORNER_RADIUS 12.0
#define CORDNER_FONT_STANDARD_HEIGHT 180.0
#define DEFAULT_CARD_SCALE_FACTOR 0.8

- (CGFloat)cornerScaleFactor { return self.bounds.size.height / CORDNER_FONT_STANDARD_HEIGHT; }
- (CGFloat)cornerRadius { return CORNER_RADIUS * [self cornerScaleFactor]; }
- (CGFloat)cornerOffset { return [self cornerRadius] / 1.5; }

////////////////////////////////


#pragma mark INIT

// because initWithFrame: is NOT called for a UIView coming out of a storyboard!
// But awakeFromNib is.
- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
    }
    
    return self;
}

#pragma mark VIEW EVENTS

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *card = [UIBezierPath bezierPathWithRoundedRect: self.bounds
                                                    cornerRadius: [self cornerRadius]];
    CAShapeLayer *cornerMaskLayer = [CAShapeLayer layer];
    CAShapeLayer *borderStrokeLayer = [CAShapeLayer layer];
    
    [card addClip]; // so we don't draw outside of the rectangle

    // set card properties
    [[self getCardBacgroundColor] setFill];
    [[self getStrokeColor] setStroke];
    
    // mask the container view’s layer to round the corners
    // without it the border won't go around the card
    [cornerMaskLayer setPath:card.CGPath];
    self.layer.mask = cornerMaskLayer;
    
    // make a transparent, stroked layer which will dispay the stroke/border
    borderStrokeLayer.path = card.CGPath;
    borderStrokeLayer.fillColor = [UIColor clearColor].CGColor;
    borderStrokeLayer.strokeColor = UIColorFromRGB(0x95A5A6).CGColor;
    borderStrokeLayer.lineWidth = 0.5f; // the stroke splits the width evenly
                                        // inside and outside,
                                        // but the outside part will be clipped by
                                        // the containerView’s mask.
    
    [self.layer addSublayer: borderStrokeLayer];
    
    // apply properties to card
    [card stroke];
    UIRectFill(self.bounds);
    
    // don't draw on card if card is face down
    if(self.faceUp) {
        [self drawOnFaceUpCard];
    } else {
        [self drawOnFaceDownCard];
    }
    
//    [UIView animateWithDuration:1.5
//                          delay:2.0
//                        options:UIViewAnimationOptionBeginFromCurrentState
//                     animations:^{ self.alpha = 0.0; }
//                     completion:^(BOOL fin){ if(fin) self.alpha = 1.0; }];
    
}

#pragma mark GET & SET

- (void)setFaceUp:(BOOL)faceUp
{
    _faceUp = faceUp;
    [self setNeedsDisplay];
}

#pragma mark PUBLIC/VIRTUAL

- (UIColor *)getCardBacgroundColor
{
    return [UIColor whiteColor];
}

- (UIColor *)getStrokeColor
{
    return [UIColor blackColor];
}

- (CGPoint)getCornerTextPosition
{
    return CGPointMake([self cornerOffset], [self cornerOffset]);
}

- (void)drawImageOnCard
{
    [self drawImageOnCard: [self getFaceImageName]];
}

- (void)drawImageOnCard: (NSString *)imageName
{
    UIImage* faceImage = [UIImage imageNamed:[NSString stringWithFormat: [self getFaceImageFormat], imageName]];
    
    // @todo create ERROR_HANDLING macro
    if (!faceImage) {
        NSLog(@"%@", @"No Image with this name, used default image instead");
    }
    
    CGRect imageRect = CGRectInset(self.bounds,
                                   (self.bounds.size.width) * (1 - DEFAULT_CARD_SCALE_FACTOR),
                                   (self.bounds.size.height) * (1 - DEFAULT_CARD_SCALE_FACTOR));
    
    [faceImage drawInRect: imageRect];

}

- (void)drawCorners
{
    NSMutableParagraphStyle* paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    UIFont* cornerFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    cornerFont = [cornerFont fontWithSize:cornerFont.pointSize * [self cornerScaleFactor]];
    
    NSAttributedString* cornerText = [[NSAttributedString alloc] initWithString:[self getCornerText] attributes: @{ NSFontAttributeName: cornerFont, NSParagraphStyleAttributeName: paragraphStyle, NSForegroundColorAttributeName: UIColorFromRGB(0x329EFE) }];
    
    // text in right corner
    CGRect textBounds;
    
    textBounds.origin = [self getCornerTextPosition];
    textBounds.size = cornerText.size;
    
    [cornerText drawInRect: textBounds];
    
    // text in left down corner
    CGContextTranslateCTM(UIGraphicsGetCurrentContext(), self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(UIGraphicsGetCurrentContext(), M_PI);
    
    [cornerText drawInRect: textBounds];
    
}

#pragma mark OVERRIDE

- (NSString *)getCornerText
{
    return @"";
}

- (NSString *)getFaceImageFormat
{
    return @"%@";
}

- (NSString *)getFaceImageName
{
    return @"";
}

- (void)drawOnFaceUpCard
{
    // Override with card setup
    // @Example:
    // [self drawImageOnCard];
    // [self drawCorners];
}

- (void)drawOnFaceDownCard
{
    // Override with card setup
    // @Example:
    // [self drawImageOnCard];
    // [self drawCorners];
}

#pragma mark PRIVATE

- (void)setup
{
    self.backgroundColor = nil;
    
    // Be sure to set @property BOOL opaque to NO in a view which is partially transparent. If you don’t, results are unpredictable (this is a performance optimization property, by the way).
    self.opaque = NO;
    
    // This content mode calls drawRect: to redraw everything when the bounds changes
    self.contentMode = UIViewContentModeRedraw;
}

@end


















