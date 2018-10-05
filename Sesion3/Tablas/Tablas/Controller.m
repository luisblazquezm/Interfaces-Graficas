//
//  Controller.m
//  Tablas
//
//  Created by Luis Blazquez Miñambres on 5/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "Controller.h"

@implementation Controller

-(BOOL)windowShouldClose:(NSWindow *)sender
{
    NSInteger respuesta;
    
    respuesta = NSRunAlertPanel(@"Atencion",
                                @"¿Está seguro de que desea cerrar la ventana?.Esta accion finalizará la ejecución de la aplicación ",
                                @"No",
                                @"Si",
                                nil);
    if(respuesta == NSAlertDefaultReturn)
        return NO;
    else
        [NSApp terminate:self];
    return YES;
    
}

/*
-(NSSize)windowWillResize:(NSWindow *)sender
                   toSize:(NSSize)frameSize
{
    NSRect frame = [sender frame];
    NSSize newSize;
    frame.origin.y += frame.size.height; // origin.y is top Y coordinate now
    frame.origin.y -= frameSize.height; // new Y coordinate for the origin
    newSize = frame.size;
    
    return newSize;
    
}
*/

-(IBAction)buttonAdd:(id)sender
{
    
}

-(IBAction)buttonDelete:(id)sender
{
    
}

// En cuanto el usuario meta un solo carácter, el boton añadir se hará visible
-(IBAction)controlTextDidChange:(NSNotification *)obj;
{
    NSString *cadena = [textField stringValue];
    if([cadena length] > 0)
        [buttonAdd setEnabled:YES];
    else
        [buttonAdd setEnabled:NO];
        
    
}

@end
