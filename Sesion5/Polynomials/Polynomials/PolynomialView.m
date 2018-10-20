//
//  PolynomialView.m
//  Polynomials
//
//  Created by Luis Blazquez Miñambres on 19/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "PolynomialView.h"
#import "Polynomial.h"

@implementation PolynomialView

NSString *PolynomialControllerSendViewNotification = @"PolynomialControllerSendView";

-(instancetype)initWithFrame:(NSRect)frameRect
{
    NSLog(@"En init with frame");
    self = [super initWithFrame:frameRect];
    if (self) {
        
    }
    
    return self;
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    NSLog(@"En drawRect");
    NSRect bounds = [self bounds];
    [[NSColor blackColor] set];
    [NSBezierPath fillRect:bounds];
    NSGraphicsContext *ctx = [NSGraphicsContext currentContext];
    
    NSInteger origenX = bounds.origin.x;
    NSInteger origenY = bounds.origin.y;
    float altura = bounds.size.height;
    float ancho = bounds.size.width;
    
    NSNumber *oX = [[NSNumber alloc]initWithInteger:origenX];
    NSNumber *oY = [[NSNumber alloc]initWithInteger:origenY];
    NSNumber *alt = [[NSNumber alloc]initWithFloat:altura];
    NSNumber *anch = [[NSNumber alloc]initWithFloat:ancho];
    
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:ctx,@"ContextoGrafico",
                                                                     oX,@"OrigenX",
                                                                     oY,@"OrigenY",
                                                                    alt,@"Altura",
                                                                   anch,@"Ancho",
                                                                   nil];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:PolynomialControllerSendViewNotification
                      object:self
                    userInfo:info];

}



@end
