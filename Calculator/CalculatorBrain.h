//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Steve Baker on 7/2/11.
//  Copyright 2011 Beepscore LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CalculatorBrain : NSObject {
    double operand;
    double waitingOperand;
    NSString *waitingOperation;
}

-(void)setOperand:(double)aDouble;
// use NSString* parameter for simplicity
-(double)performOperation:(NSString *)operation;


@end
