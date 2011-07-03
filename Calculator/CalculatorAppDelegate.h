//
//  CalculatorAppDelegate.h
//  Calculator
//
//  Created by Steve Baker on 7/2/11.
//  Copyright 2011 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CalculatorViewController;

@interface CalculatorAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CalculatorViewController *viewController;

@end
