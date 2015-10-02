//
//  AbstractHomeController.m
//  cardTestNew
//
//  Created by Ahmed Dizdar on 02/10/15.
//  Copyright © 2015 Ahmed Dizdar. All rights reserved.
//

#import "AbstractHomeController.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface AbstractHomeController ()

@end

@implementation AbstractHomeController

- (CardGameTypesCollection *) gameTypeCollection
{
    if (!_gameTypeCollection) {
        _gameTypeCollection = [[CardGameTypesCollection alloc] initWithCollection: self.gameTypeButtonCollection];
    }
    return _gameTypeCollection;
}

- (IBAction)changeGameType:(CardGameType *)sender
{
    
    [self.gameTypeCollection toggleGameTypes: [self.gameTypeButtonCollection indexOfObject:sender]];
    [self updateUI];
    
}

- (void) updateUI
{
    for (CardGameType *cardType in self.gameTypeButtonCollection) {
        [cardType setBackgroundImage:[self imageForType:cardType] forState:UIControlStateNormal];
    }
}

- (UIImage *)imageForType: (CardGameType *) gameType
{
    
    return [UIImage imageNamed: gameType.isChosen ? gameType.stateChosen : gameType.stateNotChosen];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
