//
//  PolynomialController.m
//  Polynomials
//
//  Created by Luis Blazquez Miñambres on 19/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "PolynomialController.h"
#import "Polynomial.h"
#import "PolynomialView.h"

@implementation PolynomialController

extern NSString *PolynomialControllerSendViewNotification;

-(id) init
{
    self = [super init];
    if(self){
        polynomials = [[NSMutableArray alloc] init];
        polynomialView = [[PolynomialView alloc] init];
        NSNotificationCenter *nc =[NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(handlePolynomialReceived:)
                   name:PolynomialControllerSendViewNotification
                 object:nil];
    }
    return self;
}

-(IBAction) createNewPolynomial:(id)sender
{
    Polynomial *p = [[Polynomial alloc] init];
    [polynomials addObject:p];
    [polynomialView setNeedsDisplay:YES];
}

-(IBAction) deleteRandomPolynomial:(id)sender
{
    if ([polynomials count] == 0) {
        NSBeep();
        return;
    }
    NSInteger i = random() % [polynomials count];
    [polynomials removeObjectAtIndex:i];
    [polynomialView setNeedsDisplay:YES];
    
}
     
-(void) handlePolynomialReceived:(NSNotification*)aNotification
{
    NSDictionary *info = [aNotification userInfo];
    NSNumber *oX = [info objectForKey:@"OrigenX"];
    NSNumber *oY = [info objectForKey:@"OrigenY"];
    NSNumber *alt = [info objectForKey:@"Altura"];
    NSNumber *anch = [info objectForKey:@"Ancho"];
    NSGraphicsContext *ctx = [info objectForKey:@"ContextoGrafico"];
    NSRect bounds;
    bounds.origin.x = [oX integerValue];
    bounds.origin.y = [oY integerValue];
    bounds.size.height = [alt integerValue];
    bounds.size.width = [anch integerValue];
    
    for (Polynomial *p in polynomials){
        [p drawInRect:bounds withGraphicsContext:ctx];
    }
}
@end
