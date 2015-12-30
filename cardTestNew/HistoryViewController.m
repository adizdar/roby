//
//  HistoryViewController.m
//  cardTestNew
//
//  Created by Ahmed Dizdar on 14/10/15.
//  Copyright © 2015 Ahmed Dizdar. All rights reserved.
//

#import "HistoryViewController.h"
#import "AppDelegate.h"

@interface HistoryViewController ()
    @property (weak, nonatomic) IBOutlet UILabel *historyLabel;
@end

@implementation HistoryViewController

/**
  * View specific events
  */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    if ([UIAppDelegate.historyData isKindOfClass:[NSString class]]) {
        self.historyLabel.text = UIAppDelegate.historyData;
    } else if ([UIAppDelegate.historyData isKindOfClass:[NSAttributedString class]]){
      [self.historyLabel setAttributedText: UIAppDelegate.historyData];
    } else {
        // @todo change with NSError
        NSLog(@"Conversion of historyData not supported, @Source: HistriyViewController - viewDidAppear");
    }
}

#pragma mark - View events



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
