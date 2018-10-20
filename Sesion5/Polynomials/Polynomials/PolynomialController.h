//
//  PolynomialController.h
//  Polynomials
//
//  Created by Luis Blazquez Miñambres on 19/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class Polynomial;
@class PolynomialView;

@interface PolynomialController : NSObject
{
    NSMutableArray *polynomials;
    IBOutlet NSButton *addPolynomial;
    IBOutlet NSButton *deletePolynomial;
    IBOutlet PolynomialView *polynomialView;
}

-(void) handlePolynomialReceived:(NSNotification*)aNotification;


@end
