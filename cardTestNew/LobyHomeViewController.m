//
//  LobyHomeViewController.m
//  cardTestNew
//
//  Created by Ahmed Dizdar on 02/10/15.
//  Copyright © 2015 Ahmed Dizdar. All rights reserved.
//

#import "LobyHomeViewController.h"
#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface LobyHomeViewController ()
//@property (strong, nonatomic) IBOutletCollection(CardGameType) NSArray *tempGameTypeCollection;

@end

@implementation LobyHomeViewController

// need to hide navbar everytime we return to home page
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
    // reset tab bar color
//    self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
////    [self.tabBarController.tabBar setAlpha:0.7];
////    self.tabBarController.tabBar.translucent = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // for setting back button without text on the next screen
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
//    self.tabBarController.tabBar.barTintColor = UIColorFromRGB(0x329EFE);
////    [self.tabBarController.tabBar setAlpha:0.7];
//    self.tabBarController.tabBar.translucent = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
