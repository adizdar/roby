//
//  HomeViewController.m
//  cardTestNew
//
//  Created by Ahmed Dizdar on 07/06/15.
//  Copyright (c) 2015 Ahmed Dizdar. All rights reserved.
//

#import "HomeViewController.h"
#import "PlayingCardViewController.h"

@interface HomeViewController ()
    
@end

@implementation HomeViewController

/**
 * View specific events
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // for setting back button without text on the next screen
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"RobyCardGame"]){
        PlayingCardViewController *cardGameView = (PlayingCardViewController *)segue.destinationViewController;
    cardGameView.gameType = self.gameTypeCollection.gameTypeIndentificator;
    }
    
}

@end



//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
///*
// #pragma mark - Navigation
// 
// // In a storyboard-based application, you will often want to do a little preparation before navigation
// - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
// // Get the new view controller using [segue destinationViewController].
// // Pass the selected object to the new view controller.
// }
// */