//
//  SetCardView.m
//  cardTestNew
//
//  Created by Ahmed Dizdar on 29/02/16.
//  Copyright © 2016 Ahmed Dizdar. All rights reserved.
//

#import "SetCardView.h"

@interface SetCardView()
@property(strong, nonatomic) NSArray *validShapesAsSelectors;
@property(strong, nonatomic) NSArray *spaceDividerBetweenPaths;
@end

@implementation SetCardView

#pragma mark - Units

#define ALPHA 0.2
#define STROKE_OUTLINE @-7
#define DEFAULT_UNIT [self cornerRadius]
#define MIDDLE_X self.bounds.size.height/2
#define MIDDLE_Y self.bounds.size.width/2

#pragma mark - Enums

typedef NS_ENUM(NSUInteger, ShapeTypeEnum) {
    Shade = 0,
    Fill,
    Outline
};

typedef NS_ENUM(NSUInteger, ShapeEnum) {
    Rectangle = 0,
    Circle,
    Triangle
};

#pragma mark - Override

- (void)drawOnFaceUpCard
{
    if ([self.shapeNumber intValue] == 0) return;
    
    UIBezierPath *bezierPath;
    int shapeNumber = [self.shapeNumber intValue];
    NSArray *divider = [self.spaceDividerBetweenPaths objectAtIndex: shapeNumber - 1];
    NSString *bezierPathToDraw = [self.validShapesAsSelectors objectAtIndex: shapeNumber - 1];

    for (int i = 0; i<shapeNumber; i++) {
        bezierPath = [self getBezierPathFromSelector: bezierPathToDraw
                                            shiftUnit: divider[i]];
        [self setAttributesToSetCard: bezierPath];
        [bezierPath stroke];
    }
}

#pragma mark - Lifecycle

- (void) awakeFromNib
{
    self.faceUp = YES;
}

#pragma mark - Custom Accessors

- (NSArray *) validShapesAsSelectors
{
    if (!_validShapesAsSelectors) {
        _validShapesAsSelectors = @[@"getBezierPathAsRectangle", @"getBezierPathAsCircle", @"getBezierPathAsTriangle"];
    }
    
    return _validShapesAsSelectors;
}

- (NSArray *) spaceDividerBetweenPaths
{
    // 2.0 as diameter, + 0.7 so we add a little gap between the paths
    if (!_spaceDividerBetweenPaths) {
        _spaceDividerBetweenPaths = @[ @[@0],
                                       @[@(1.4f * (-DEFAULT_UNIT)), @(1.4f * (DEFAULT_UNIT))],
                                       @[@(2.7f * (-DEFAULT_UNIT)), @0, @(2.7f * (DEFAULT_UNIT))] ];
    }
    
    return _spaceDividerBetweenPaths;
}

- (void) setAttributesToSetCard: (UIBezierPath *)bezierPath
{
    int shapeType = [self.shapeType intValue];
    float alpha = (shapeType == Shade) ? ALPHA :
                  (shapeType == Outline) ? 0 : 1;
    [self setBezierPathColor: bezierPath
                       alpha: alpha];
    [self.color setStroke];
    
}

- (void) setBezierPathColor:(UIBezierPath *)bezierPath alpha:(float)alpha
{
    [[self.color colorWithAlphaComponent: alpha] setFill];
    [bezierPath fill];
}

#pragma mark - IBActions

#pragma mark - Public

#pragma mark - Private

- (UIBezierPath *)getBezierPathAsRectangle: (NSNumber *) unitAsNumber
{
    float unit = [unitAsNumber floatValue];
    // MIDDLE_? - DEFAULT_UNIT = to position the rectangle in the middle
    // because the center is the top line of the rect.
    return [UIBezierPath bezierPathWithRect: CGRectMake(MIDDLE_Y + unit - DEFAULT_UNIT,
                                                        MIDDLE_X - DEFAULT_UNIT,
                                                        DEFAULT_UNIT*2,
                                                        DEFAULT_UNIT*2)];
}

- (UIBezierPath *)getBezierPathAsCircle: (NSNumber *) unitAsNumber
{
    float unit = [unitAsNumber floatValue];

    return [UIBezierPath bezierPathWithArcCenter: CGPointMake(MIDDLE_Y + unit, MIDDLE_X)
                                          radius: DEFAULT_UNIT
                                      startAngle: 0
                                        endAngle: 2 * M_PI
                                       clockwise: YES];
}

- (UIBezierPath *)getBezierPathAsTriangle: (NSNumber *) unitAsNumber
{
    UIBezierPath* trianglePath = [UIBezierPath bezierPath];
    float unit = [unitAsNumber floatValue];
    
    [trianglePath moveToPoint:CGPointMake(MIDDLE_Y + unit, MIDDLE_X - DEFAULT_UNIT)];
    [trianglePath addLineToPoint:CGPointMake(MIDDLE_Y - DEFAULT_UNIT + unit, MIDDLE_X + DEFAULT_UNIT)];
    [trianglePath addLineToPoint:CGPointMake(MIDDLE_Y + DEFAULT_UNIT + unit, MIDDLE_X + DEFAULT_UNIT)];
    [trianglePath closePath];
    
    return trianglePath;
}

// to supress the @warning "performSelector may cause a leak because its selector is unknown"
// http://stackoverflow.com/questions/7017281/performselector-may-cause-a-leak-because-its-selector-is-unknown
- (UIBezierPath *)getBezierPathFromSelector:(NSString*) selectorName shiftUnit:(NSNumber *)shiftUnit
{
    SEL bezierPathSelector = NSSelectorFromString([NSString stringWithFormat:@"%@%@", selectorName, @":"]);
    IMP imp;
    
    if (![self respondsToSelector: bezierPathSelector]) {
        NSLog(@"@ERROR: selector with name %@ is not defined.", selectorName);
        return Nil;
    }
    
    imp = [self methodForSelector: bezierPathSelector];
    UIBezierPath* (*func)(id, SEL, NSNumber*) = (void *)imp;

    return func(self, bezierPathSelector, shiftUnit);
}

#pragma mark - NSCopying

#pragma mark - NSObject


@end
