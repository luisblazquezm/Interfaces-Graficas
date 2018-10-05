//
//  Controller.h
//  Tablas
//
//  Created by Luis Blazquez Miñambres on 5/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Controller : NSObject <NSWindowDelegate,
                                  NSTableViewDelegate,
                                  NSTableViewDataSource>

    


// Comportamiento cierre ventana
-(BOOL)windowShouldClose:(NSWindow *)sender;
-(NSSize)windowWillResize:(NSWindow *)sender toSize:(NSSize)frameSize;

@end
