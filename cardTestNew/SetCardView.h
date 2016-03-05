//
//  SetCardView.h
//  cardTestNew
//
//  Created by Ahmed Dizdar on 29/02/16.
//  Copyright © 2016 Ahmed Dizdar. All rights reserved.
//

#import "AbstractCardView.h"

@interface SetCardView : AbstractCardView

@property(nonatomic, strong) NSNumber* shape;
@property(nonatomic, strong) NSNumber* shapeType; // outline, fill, shade ...
@property(nonatomic, strong) UIColor* color;
@property(nonatomic, strong) NSNumber* shapeNumber; // need pointer becaus of SET

@end


//- (NSDictionary* ) createAtributesfromCardProperties: (SetCard *) card
//{
//    int shapeTypeValue = [card.shapeType intValue];
//    float alpha = (shapeTypeValue == Shade) ? ALPHA :
//    (shapeTypeValue == Outline) ? 0 : 1;
//    UIColor* color = [self getColorWithShadingFromString: [card.color intValue] alpha: alpha];
//
//    return @{
//             NSForegroundColorAttributeName: color,
//             NSStrokeWidthAttributeName: STROKE_OUTLINE,
//             NSStrokeColorAttributeName: [self getColorWithShadingFromString: [card.color intValue] alpha: 1]
//             };
//}