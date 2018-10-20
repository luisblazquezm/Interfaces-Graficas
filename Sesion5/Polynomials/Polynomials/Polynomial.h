//
//  Polynomial.h
//  Polynomials
//
//  Created by Luis Blazquez Miñambres on 19/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Polynomial : NSObject
{
    float *terms;
    int termCount;
    NSColor *color;
    NSBezierPath *poly;
}

-(float) valueAt:(float)x;
-(void) drawInRect:(NSRect)b
withGraphicsContext:(NSGraphicsContext*)ctx;

@end
