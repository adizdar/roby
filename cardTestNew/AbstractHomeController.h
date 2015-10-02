//
//  AbstractHomeController.h
//  cardTestNew
//
//  Created by Ahmed Dizdar on 02/10/15.
//  Copyright © 2015 Ahmed Dizdar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardGameTypesCollection.h"

@interface AbstractHomeController : UIViewController

    // -- Properties
    @property (nonatomic, strong) CardGameTypesCollection *gameTypeCollection;
    @property (nonatomic, strong) IBOutletCollection(UIButton) NSArray *gameTypeButtonCollection;

    // -- Public methods
    - (IBAction)changeGameType:(CardGameType *)sender;
    - (void) updateUI;
    - (UIImage *)imageForType: (CardGameType *) gameType;

    // ! -- Abstract/Protected

@end
