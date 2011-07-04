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
        operand = waitingOperand + operand;
    } else if ([@"*" isEqualToString:waitingOperation]) {
        operand = waitingOperand * operand;
    } else if ([@"-" isEqualToString:waitingOperation]) {
        operand = waitingOperand - operand;
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
        if (operand) {
            operand = -operand;
        } // else operand is zero, don't retun "-0"
    } else if ([operation isEqualToString:@"cos"]) {
        operand = cos(operand);
    } else if ([operation isEqualToString:@"sin"]) {
            operand = sin(operand);
    } else if ([operation isEqualToString:@"Store"]) {
        memoryValue = operand;
    } else if ([operation isEqualToString:@"Recall"]) {
        operand = memoryValue;
    } else {
        [self performWaitingOperation];
        waitingOperation = operation;
        waitingOperand = operand;
    }
    return operand;
}

@end
