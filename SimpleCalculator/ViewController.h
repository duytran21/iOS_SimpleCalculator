//
//  ViewController.h
//  SimpleCalculator
//
//  Created by Ivan Tran on 7/22/15.
//  Copyright (c) 2015 Ivan Tran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *display;

-(IBAction) clickDigit:(UIButton *)sender;
-(IBAction) clickEqual:(UIButton *)sender;
-(IBAction) clickClear:(UIButton *)sender;
- (IBAction)clickNegativeSign:(UIButton *)sender;
- (IBAction)cickPercent:(UIButton *)sender;
- (IBAction)clickDecimalPart:(UIButton *)sender;
- (IBAction)clickDivide:(UIButton *)sender;
- (IBAction)clickMultiply:(UIButton *)sender;
- (IBAction)clickMinus:(UIButton *)sender;
- (IBAction)clickAdd:(UIButton *)sender;


-(int) safeAdd:(int) left :(int ) right;
-(void) processDigit:(int) digit;
//-(void) storeMemory;

@end

