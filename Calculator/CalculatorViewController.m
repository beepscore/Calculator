//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Steve Baker on 7/2/11.
//  Copyright 2011 Beepscore LLC. All rights reserved.
//

#import "CalculatorViewController.h"

@implementation CalculatorViewController

- (CalculatorBrain *)brain{
    if (!brain) {
        brain = [[CalculatorBrain alloc] init];
    }
    return brain;
}


- (IBAction)digitPressed:(UIButton *)sender{
    
    NSString *digit = [[sender titleLabel] text];
    
    if (userIsInTheMiddleOfTypingANumber) {
        [display setText:[[display text] stringByAppendingString:digit]];
    } else {
        // first digit press
        [display setText:digit];
        userIsInTheMiddleOfTypingANumber = YES;
    }
}


- (IBAction)decimalPressed:(UIButton *)sender{
    
    NSString *decimalSeparator = [[sender titleLabel] text];
    BOOL displayContainsDecimalSeparator = ([[display text] rangeOfString:decimalSeparator].length > 0);
    if (!displayContainsDecimalSeparator) {
        // display text is either initial "0" or number user is in the middle of typing
        // append decimal separator
        [display setText:[[display text] stringByAppendingString:decimalSeparator]];
        userIsInTheMiddleOfTypingANumber = YES;
    }                                            
}


- (IBAction)operationPressed:(UIButton *)sender{
    if (userIsInTheMiddleOfTypingANumber) {
        [[self brain] setOperand:[[display text] doubleValue]];
        userIsInTheMiddleOfTypingANumber = NO;
    }    
    NSString *operation = [[sender titleLabel] text];
    double result = [[self brain] performOperation:operation];
    [display setText:[NSString stringWithFormat:@"%g", result]];
}

@end
