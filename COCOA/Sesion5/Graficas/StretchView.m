//
//  StretchView.m
//  Graficas
//
//  Created by Luis Blazquez Miñambres on 19/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "StretchView.h"

@implementation StretchView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"En initWithFrame");
        srandom((int)time(NULL));
        myPath = [[NSBezierPath alloc] init];
        
        ctx = [NSGraphicsContext currentContext];
        
        [myPath setLineWidth:1.5]; // Ancho de la linea que quiero dibujar
        NSPoint aPoint = [self randomPoint];
        
        [myPath moveToPoint:aPoint];    // Marcamos el punto de origen del bezierPath (punto inicial)
        for (int i = 0; i < 15; i++) { // Dibuja los puntos en el BezierPath
            aPoint = [self randomPoint];
            NSLog(@"RANDOM POINT pos:%d",i);
            [myPath lineToPoint:aPoint];
        }
        [myPath closePath]; // Cierra la figura formada por la coleccion de puntos
    }
    return self;
}

-(NSPoint) randomPoint
{
    NSPoint result;
    NSRect r = [self bounds];
    result.x = r.origin.x + random() % (int)r.size.width;
    result.y = r.origin.y + random() % (int)r.size.height;
    return result;
}

- (void) drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    NSLog(@"En drawRect");
    NSRect bounds = [self bounds]; // Dimensiones de la vista
    [[NSColor greenColor] set];    // Ponemso el fonde de verde
    [NSBezierPath fillRect:bounds]; // Rellenamos el bezier path con lo que hemos rellenado de la vista
    // EL bezierPath marcara el camino de las lineas que pintemos
    [[NSColor whiteColor] setStroke] ;// Color de la linea de puntos
    [myPath stroke];
}

-(IBAction)addRect:(id)sender
{
    NSLog(@"Boton pulsado");
    [myPath removeAllPoints];
    NSRect r = [self bounds];
    float x, y, width, height;
    x = r.origin.x + random() % (int)(r.size.width-40);
    y = r.origin.y + random() % (int)(r.size.height-40);
    width = random() % 39 +1;
    height = random() % 39 +1;
    [myPath moveToPoint:NSMakePoint(x, y)];
    [myPath lineToPoint:NSMakePoint(x, y + height)];
    [myPath lineToPoint:NSMakePoint(x + width, y + height)];
    [myPath lineToPoint:NSMakePoint(x + width, y)];
    [myPath closePath];
    [self setNeedsDisplay:YES];
    
}

@end
