//
//  StretchView.h
//  Graficas
//
//  Created by Luis Blazquez Miñambres on 19/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface StretchView : NSView
{
    NSBezierPath *myPath;
    NSGraphicsContext *ctx;
}

-(IBAction) addRect:(id)sender;
-(NSPoint) randomPoint;

@end
