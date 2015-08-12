//
//  ViewController.m
//  SimpleCalculator
//
//  Created by Ivan Tran on 7/22/15.
//  Copyright (c) 2015 Ivan Tran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    char op; //operator
    BOOL operatorPressed;
    double currentNumber;
    double total;
    BOOL isFirstOperand;
    BOOL negativeSign;
    BOOL isPercentPressed;
    int method;
    BOOL isDotPressed;
    //    NSMutableString *displayStr;
}
@synthesize display;

-(IBAction) clickDigit:(UIButton *)sender{
    int digit = (int)sender.tag;
    
    [self processDigit:digit];
}

-(void) processDigit:(int) digit{
    if (negativeSign == TRUE) {
       /* if (isDotPressed) {
            display.text = [display.text stringByAppendingString:[NSString stringWithFormat:@"-%i",digit]];
            currentNumber = [display.text doubleValue];
        }
        else{*/
            if (currentNumber==0) {
                currentNumber = currentNumber - digit;
            }
            else if (currentNumber < 0){
                if (isDotPressed) {
                    display.text = [display.text stringByAppendingString:[NSString stringWithFormat:@"%i",digit]];
                    currentNumber = [display.text doubleValue];
                }
                else{
                    currentNumber = currentNumber * 10 - digit;
                }
            }
            else
                if (isPercentPressed == FALSE)
                    currentNumber = currentNumber * 10 + digit;
      //  }
    }
    else{
        if (isDotPressed) {
            display.text = [display.text stringByAppendingString:[NSString stringWithFormat:@"%i",digit]];
            currentNumber = [display.text doubleValue];
        }
        else
            currentNumber = currentNumber * 10 + digit;
    }
    display.text = [NSString stringWithFormat:@"%g",currentNumber];
}

-(IBAction) clickEqual:(UIButton *)sender {
    if (isFirstOperand) {
        total = currentNumber;
        isFirstOperand = FALSE;
    }
    else {
        switch (method) {
            case 1:
                total = total + currentNumber;
                negativeSign=FALSE;
                break;
            case 2:
                total = total - currentNumber;
                negativeSign = FALSE;
                break;
            case 3:
                total = total * currentNumber;
                negativeSign = FALSE;
                break;
            case 4:
                total = total / currentNumber;
                negativeSign = FALSE;
                break;
            default:
                break;
        }
    }
    method = 0;
    currentNumber = 0;
    isDotPressed = FALSE;
    display.text = [NSString stringWithFormat:@"%g",total];
    
}

-(int) safeAdd:(int) left :(int ) right {
    /*    if (right > 0 ? left > INT_MAX - right : left < INT_MIN - right) {
     NSException *e = [NSException exceptionWithName:@"Overflow" reason:@"Integer Overflow" userInfo:nil];
     @throw e;
     }
     
     return left + right;*/
    return 0;
}

- (IBAction)clickClear:(UIButton *)sender {
    operatorPressed = FALSE;
    currentNumber = 0;
    total = 0;
    isDotPressed = FALSE;
    isFirstOperand = TRUE;
    negativeSign = FALSE;
    method = 0;
    isPercentPressed = FALSE;
    display.text = @"0";
}

- (IBAction)clickNegativeSign:(UIButton *)sender {
    if (isFirstOperand == FALSE && method == 0) {
        total = -(total);
        display.text = [NSString stringWithFormat:@"%g", total];
    }
    else{
        currentNumber = -(currentNumber);
        negativeSign = TRUE;
        display.text =[NSString stringWithFormat:@"%g", currentNumber];
    }
}

- (IBAction)cickPercent:(UIButton *)sender {
    if (isFirstOperand) {
        total = currentNumber / 100;
        isFirstOperand = FALSE;
        currentNumber = 0;
        display.text = [NSString stringWithFormat:@"%g",total];
    }
    else{
        if (method == 0) {
            total = total /100;
            currentNumber = 0;
            display.text = [NSString stringWithFormat:@"%g",total];
        }
        else{
            currentNumber  = currentNumber / 100;
            display.text = [NSString stringWithFormat:@"%g", currentNumber];
            isPercentPressed = TRUE;
            negativeSign = FALSE;
        }
    }
    
}

- (IBAction)clickDecimalPart:(UIButton *)sender {
    if (isDotPressed == FALSE) {
        isDotPressed = TRUE;
        display.text = [display.text stringByAppendingString:@"."];
    }
}

- (IBAction)clickDivide:(UIButton *)sender {
    if (isFirstOperand) {
        total = currentNumber;
        isFirstOperand = FALSE;
    }
    else {
        switch (method) {
            case 1:
                total = total + currentNumber;
                negativeSign = FALSE;
                break;
            case 2:
                total = total - currentNumber;
                negativeSign = FALSE;
                break;
            case 3:
                total = total * currentNumber;
                negativeSign = FALSE;
                break;
            case 4:
                if (currentNumber != 0) {
                    total = total / currentNumber;
                    negativeSign = FALSE;
                }
                else
                    total = NAN;
                break;
            default:
                break;
        }
    }
    method = 4;
    currentNumber = 0;
    display.text = [NSString stringWithFormat:@"%g",total];
    
}

- (IBAction)clickMultiply:(UIButton *)sender {
    if (isFirstOperand) {
        total = currentNumber;
        isFirstOperand = FALSE;
    }
    else {
        switch (method) {
            case 1:
                total = total + currentNumber;
                break;
            case 2:
                total = total - currentNumber;
                break;
            case 3:
                total = total * currentNumber;
                break;
            case 4:
                if (currentNumber != 0) {
                    total = total / currentNumber;
                }
                else
                    total = NAN;
                break;
            default:
                break;
        }
    }
    method = 3;
    currentNumber = 0;
    isDotPressed = FALSE;
    negativeSign= FALSE;
    display.text = [NSString stringWithFormat:@"%g",total];
    
}

- (IBAction)clickMinus:(UIButton *)sender {
    if (isFirstOperand) {
        total = currentNumber;
        isFirstOperand = FALSE;
    }
    else {
        switch (method) {
            case 1:
                total = total + currentNumber;
                break;
            case 2:
                total = total - currentNumber;
                break;
            case 3:
                total = total * currentNumber;
                break;
            case 4:
                if (currentNumber != 0) {
                    total = total / currentNumber;
                }
                else
                    total = NAN;

                break;
            default:
                break;
        }
    }
    method = 2;
    currentNumber = 0;
    isDotPressed = FALSE;
    negativeSign = FALSE;
    display.text = [NSString stringWithFormat:@"%g",total];
    
}

- (IBAction)clickAdd:(UIButton *)sender {
    if (isFirstOperand) {
        total = currentNumber;
        isFirstOperand = FALSE;
    }
    else {
        switch (method) {
            case 1:
                total = total + currentNumber;
                break;
            case 2:
                total = total - currentNumber;
                break;
            case 3:
                total = total * currentNumber;
                break;
            case 4:
                if (currentNumber != 0) {
                    total = total / currentNumber;
                }
                else
                    total = NAN;
                break;
            default:
                break;
        }
    }
    method = 1;
    currentNumber = 0;
    isDotPressed = FALSE;
    negativeSign = FALSE;
    display.text = [NSString stringWithFormat:@"%g",total];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    operatorPressed = FALSE;
    negativeSign = FALSE;
    isFirstOperand = TRUE;
    currentNumber = 0;
    total = 0;
    isDotPressed = FALSE;
    isPercentPressed = FALSE;
    display.text = @"0";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end