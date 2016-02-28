//
//  HistoryController.h
//  cardTestNew
//
//  Created by Ahmed Dizdar on 28/02/16.
//  Copyright © 2016 Ahmed Dizdar. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HistoryController <NSObject>
@property (strong, nonatomic) id historyData;

@optional
- (void) receiveHistoryData:(NSNotification *) notification;
@end
