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


- (IBAction)constantSymbolPressed:(UIButton *)sender{
    
    // approximate constants such as pi and e
    // the calculator brain accuracy is only double.
    NSString *constantSymbol = [[sender titleLabel] text];
    // In Xcode, the pi character caused warning input conversion stopped due to an input byte that does not belong to the input codeset UTF-8.
    // Change text encoding for CalculatorViewController.m from default Western (Mac OS Roman) to Unicode (UTF-8)
    // This fixed the problem.
    // Reference: http://stackoverflow.com/questions/5133606/handling-special-charaters-o-a-in-objective-c-iphone
    if ([@"π" isEqualToString:constantSymbol]) {
        [display setText:[NSString stringWithFormat:@"%g", M_PI]];
    }
    userIsInTheMiddleOfTypingANumber = YES;                                           
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
