//
//  SetCardGameViewController.m
//  cardTestNew
//
//  Created by Ahmed Dizdar on 28/06/15.
//  Copyright (c) 2015 Ahmed Dizdar. All rights reserved.
//

////////////////////////////////////////
#import "SetCardGameViewController.h"
#import "CardGameType.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]
////////////////////////////////////////

@interface SetCardGameViewController ()

@end

@implementation SetCardGameViewController

/**
 * Override parent methods
 */


/**
 * View specific events
 */

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : UIColorFromRGB(0x329EFE)};
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * Methods
 */



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
