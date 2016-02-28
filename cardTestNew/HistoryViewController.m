//
//  HistoryViewController.m
//  cardTestNew
//
//  Created by Ahmed Dizdar on 14/10/15.
//  Copyright © 2015 Ahmed Dizdar. All rights reserved.
//

#import "HistoryViewController.h"
#import "AppDelegate.h"

@interface HistoryViewController()
    @property (weak, nonatomic, readwrite) IBOutlet UILabel *historyLabel;
@end

@implementation HistoryViewController

/**
  * View specific events
  */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveHistoryData:)
                                                 name:@"HistoryDataNotification"
                                               object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// viewWillAppear is called before viewWillDisapear,
// so to recive data from the other view we use viewDidAppear
// because it is called after viewWillDisapear
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    // history can consume string and attributes
    if ([self.historyData isKindOfClass:[NSString class]]) {
        self.historyLabel.text = self.historyData;
    } else if ([self.historyData isKindOfClass:[NSAttributedString class]]){
      [self.historyLabel setAttributedText: self.historyData];
    } else {
        // @todo change with NSError
        NSLog(@"Conversion of historyData not supported, @Source: HistriyViewController - viewDidAppear");
    }
}

- (void) receiveHistoryData:(NSNotification *) notification
{
    // [notification name] should always be @"HistoryDataNotification"
    // unless you use this method for observation of other notifications
    // as well.
    
    if ([[notification name] isEqualToString:@"HistoryDataNotification"]) {
        self.historyData = notification.object;
    }
        
}

@end
