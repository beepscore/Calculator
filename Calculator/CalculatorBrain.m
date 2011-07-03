//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Steve Baker on 7/2/11.
//  Copyright 2011 Beepscore LLC. All rights reserved.
//

#import "CalculatorBrain.h"


@implementation CalculatorBrain

-(void)setOperand:(double)aDouble{
    operand = aDouble;
}


-(void)performWaitingOperation{
    if ([@"+" isEqualToString:waitingOperation]) {
        operand += waitingOperand;
    } else if ([@"*" isEqualToString:waitingOperation]) {
        operand *= waitingOperand;
    } else if ([@"-" isEqualToString:waitingOperation]) {
        operand -= waitingOperand;
    } else if ([@"/" isEqualToString:waitingOperation]) {        
        if (operand) {
            operand = waitingOperand / operand; 
        }
        // else operand is zero.
        // Don't attempt to divide by zero, just fail silently for simplicity.
    }
}


-(double)performOperation:(NSString *)operation{
    if ([operation isEqualToString:@"sqrt"]) {
        if (operand >= 0.) {
            operand = sqrt(operand);
        }
    } else if ([operation isEqualToString:@"1/x"]) {
        if (operand) {
            operand = 1 / operand;
        }        
    } else if ([@"+/-" isEqualToString:operation]) {
        operand = -operand;
    } else {
        [self performWaitingOperation];
        waitingOperation = operation;
        waitingOperand = operand;
    }
    return operand;
}

@end
