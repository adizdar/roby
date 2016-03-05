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
#import "SetCardDeck.h"
#import "SetCardView.h"

#pragma mark - Macros

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

#define ALPHA 0.2
#define STROKE_OUTLINE @-7

typedef NS_ENUM(NSUInteger, ShapeTypeEnum) {
    Shade = 0,
    Fill,
    Outline
};

////////////////////////////////////////

@interface SetCardGameViewController ()
@property(strong, nonatomic) NSArray* supportedShapes;
@property(strong, nonatomic) IBOutlet SetCardView *setView;

@end

@implementation SetCardGameViewController

#pragma mark - Override

- (SetCardDeck*) createDeck
{
    return [[SetCardDeck alloc] init];
}

#pragma mark - Lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : UIColorFromRGB(0x329EFE)};
    
    [self updateUi];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SetCard *test = (SetCard *)[self.game cardAtIndex: 1];
    [self.setView setColor: [UIColor redColor]];
    [self.setView setShape: test.shape];
    [self.setView setShapeNumber: test.shapeNumber];
    [self.setView setShapeType: @0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Custom Accessors (GET & SET)
- (NSArray*) supportedShapes
{
    if (!_supportedShapes) {
        _supportedShapes = @[@"▲", @"●", @"■"];
    }
    
    return _supportedShapes;
}

#pragma mark - IBActions
#pragma mark - Public
#pragma mark - Private

// @TODO out of the bounds handling
- (NSString*) getShapeForCard: (id)shape
{
    if ([shape isKindOfClass:[NSNumber class]]) {
        return [self.supportedShapes objectAtIndex: [(NSNumber *) shape integerValue]];
    }
    
    return [self.supportedShapes objectAtIndex: [[shape description] integerValue]];
}

- (void) updateUi
{
    SetCard * card = [[SetCard alloc] init];
    NSUInteger cardButtonIndex;
    
    for (UIButton *cardButton in self.cardButtonCollection) {
        cardButtonIndex = [self.cardButtonCollection indexOfObject:cardButton];
        
        card = (SetCard *)[self.game cardAtIndex: cardButtonIndex];
        
        [cardButton setAttributedTitle: [self attachAtributsToShape:card] forState: UIControlStateNormal];

        if (card.isChosen) {
            [cardButton.layer setBorderWidth: 1.0];
            [cardButton.layer setBorderColor:[UIColorFromRGB(0x3498DB) CGColor]];
             cardButton.layer.cornerRadius = 10;
        } else {
            [cardButton.layer setBorderWidth: 0];
        }
        
        cardButton.hidden = card.isMatched;
    }
    
    self.navigationController.navigationBar.topItem.title = [NSString stringWithFormat:@"Score: %d", (int)self.game.score];
}

- (NSAttributedString *) attachAtributsToShape: (SetCard *)card
{
    return [[NSAttributedString alloc] initWithString: [self shapeForCard: [card.shapeNumber intValue] shape:[self getShapeForCard: card.shape]] attributes: [self createAtributesfromCardProperties:card]];
}

- (NSDictionary* ) createAtributesfromCardProperties: (SetCard *) card
{
    int shapeTypeValue = [card.shapeType intValue];
    float alpha = (shapeTypeValue == Shade) ? ALPHA :
                  (shapeTypeValue == Outline) ? 0 : 1;
    UIColor* color = [self getColorWithShadingFromString: [card.color intValue] alpha: alpha];
    
    return @{
             NSForegroundColorAttributeName: color,
             NSStrokeWidthAttributeName: STROKE_OUTLINE,
             NSStrokeColorAttributeName: [self getColorWithShadingFromString: [card.color intValue] alpha: 1]
            };
}

- (NSString *) shapeForCard: (int) numberOfShapes shape:(NSString *) shape
{
    return [@"" stringByPaddingToLength: numberOfShapes * [shape length] withString:shape startingAtIndex: 0];
}

- (UIColor *) getColorWithShadingFromString: (int) color alpha: (float) alpha
{
    return color == 0 ? [UIColorFromRGB(0xCF000F) colorWithAlphaComponent:alpha] :
           color == 1 ? [UIColorFromRGB(0x36D7B7) colorWithAlphaComponent:alpha] :
           color == 2 ? [UIColorFromRGB(0x3498DB) colorWithAlphaComponent:alpha] : nil;
}

- (NSMutableAttributedString *) playedMovesHistory
{
    if (![super playedMovesHistory] && ![[super playedMovesHistory] length]) {
        [super setPlayedMovesHistory: [[NSMutableAttributedString alloc] initWithString:@""]];
    }
    
    return [super playedMovesHistory];
}


// @Override
- (NSString *)titleForCard:(SetCard *)card
{
    return [self shapeForCard: [card.shapeNumber intValue] shape: [self getShapeForCard: card.shape]];
}

- (void) updateMoveHistory: (SetCard *) card
{
    NSMutableAttributedString* title = [[NSMutableAttributedString alloc] initWithString: [self createMoveHistory: card]];
    
    // so the style won't be applyed on the line number
    [title addAttributes:[self createAtributesfromCardProperties:card] range: NSMakeRange(1, [title length]-1)];
    
    [self.playedMovesHistory appendAttributedString: (NSAttributedString *)title];
}

#pragma mark - NSCopying
#pragma mark - NSObject
#pragma mark - Navigation

/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
