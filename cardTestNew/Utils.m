//
//  Utils.m
//  cardTestNew
//
//  Created by Ahmed Dizdar on 01/03/16.
//  Copyright © 2016 Ahmed Dizdar. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (UIColor *) UIColorFromRGB: (NSUInteger) rgbValue
{
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                           green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
                            blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
                           alpha:1.0];
}

@end
