//
//  Polynomial.m
//  Polynomials
//
//  Created by Luis Blazquez Miñambres on 19/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "Polynomial.h"
#define HOPS (500)
#define RANDFLOAT() (random()%128/128.0)
static NSRect funcRect = {-10, -10, 20 ,20};

@implementation Polynomial

-(id) init
{
    NSLog(@"En init");
    self = [super init];
    if (!self) {
        return nil;
    }
    color = [NSColor colorWithSRGBRed:RANDFLOAT()
                                green:RANDFLOAT()
                                 blue:RANDFLOAT()
                                alpha:1.0];
    termCount = (random() % 3) + 2;
    terms = malloc(termCount * sizeof(float));
    
    for (int i = 0; i < termCount; i++) {
        terms[i] = 5.0 - (random() % 100)/10.0;
    }
    poly = [[NSBezierPath alloc] init];
    
    return self;
}


-(float) valueAt:(float)x
{
    float result = 0;
    for (int i = 0; i < termCount; i++) {
        result = (result * x) + terms[i];
    }
    
    return result;
}

-(void) drawInRect:(NSRect)b
withGraphicsContext:(NSGraphicsContext*)ctx
{
    NSPoint aPoint;
    float distance = funcRect.size.width/HOPS; // Distancia entre las x
    
    [poly removeAllPoints];
    [ctx saveGraphicsState];
    
    NSAffineTransform *tf = [NSAffineTransform transform];
    [tf translateXBy:b.size.width/2 yBy:b.size.height/2];
    [tf scaleXBy:b.size.width/funcRect.size.width
             yBy:b.size.height/funcRect.size.height];
    [tf concat];
    
    [poly setLineWidth:0.1];
    [color setStroke];
    
    aPoint.x = funcRect.origin.x;
    aPoint.y = [self valueAt:aPoint.x];
    [poly moveToPoint:aPoint];
    while (aPoint.x <= funcRect.origin.x + funcRect.size.width) {
        aPoint.y = [self valueAt:aPoint.x];
        [poly lineToPoint:aPoint];
        aPoint.x += distance;
    }
    
    [poly stroke];
    [ctx restoreGraphicsState];
}


@end
