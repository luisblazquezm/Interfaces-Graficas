//
//  PanelWindowController.m
//  Tablas
//
//  Created by Luis Blazquez Miñambres on 9/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "PanelWindowController.h"

@interface PanelWindowController ()

@end

@implementation PanelWindowController

-(id)init
{
    if (![super initWithWindowNibName:@"PanelWindowController"])
        return nil;
    
    return self;
}

-(instancetype)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self){
        //Inicialization code here
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

-(void)changeTableColor:(id)sender
{
    NSColor *backgroundColorTable = [colorWell color];
    NSLog(@"Color seleccionad: %@", backgroundColorTable);
}

-(void)activateTable:(id)sender
{
    NSInteger tableState = [checkButton state];
    NSLog(@"Tabla activada: %ld", tableState);
}
@end
