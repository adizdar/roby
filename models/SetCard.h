//
//  SetCard.h
//  cardTestNew
//
//  Created by Ahmed Dizdar on 04/10/15.
//  Copyright © 2015 Ahmed Dizdar. All rights reserved.
//

#import "card.h"

@interface SetCard : Card
@property(nonatomic, strong) NSString* shape;
@property(nonatomic, strong) NSNumber* shapeType; // outline, fill, shade ...
@property(nonatomic, strong) NSNumber* color;
@property(nonatomic, strong) NSNumber* shapeNumber; // need pointer becaus of SET

+ (NSArray*) validShapes;
+ (NSArray *) validGameFeatures;
+ (NSDictionary*) combinedPropertiesInDictionary;

// OBSOLATE, changed with one property validGameFeatures
+ (NSArray*) validShapeType;
+ (NSArray*) validColor;
+ (NSArray*) validNumber;

@end
