//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Steve Baker on 7/2/11.
//  Copyright 2011 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"

@interface CalculatorViewController : UIViewController {
    // In Objective-C, if an object inherits from NSObject 
    // it's instance variables are automatically initialized to zero.
    // default ivar access is @protected (class and subclass can access).
    // Teacher recommends mark all ivars @private, use other classes access via properties.
@private
    IBOutlet UILabel *display;
    CalculatorBrain *brain;
    BOOL userIsInTheMiddleOfTypingANumber;
}

- (IBAction)constantSymbolPressed:(UIButton *)sender;
- (IBAction)decimalPressed:(UIButton *)sender;
- (IBAction)digitPressed:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;

@end
