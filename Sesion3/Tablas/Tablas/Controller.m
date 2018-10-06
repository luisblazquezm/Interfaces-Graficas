//
//  Controller.m
//  Tablas
//
//  Created by Luis Blazquez Miñambres on 5/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "Controller.h"

@implementation Controller

-(id)init
{
    self = [super init];
    if (self){
        NSLog(@"En init");
        anArray = [[NSMutableArray alloc] init];
        elModelo = [[Model alloc] init];
    }
    
    return self;
}

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
    NSString *cadena = [textField stringValue];
    [anArray addObject:cadena];
    NSLog(@"Cadena guardada en array: %@\r", cadena);
    [aTableView reloadData];
    
}

-(IBAction)buttonDelete:(id)sender
{
    aRowSelected = [aTableView selectedRow];
    [aTableView abortEditing]; // Orden que deniega la edición al usuario (Es necesrio en el caso en el que el usuario intente editar un campo y pulse el botón eliminar (produce un bug)
    if (aRowSelected == -1)
        return;
    
    [anArray removeObjectAtIndex:aRowSelected];
    NSLog(@"Cadena eliminada en array en pos %ld\r", aRowSelected);
    [aTableView reloadData];
}

// Si selecciona alguna fila, se habilita el botón eliminar. En caso contrario se deshabilita
-(void) tableViewSelectionDidChange:(NSNotification *)notification
{
    aRowSelected = [aTableView selectedRow];
    if(aRowSelected == -1)
        [buttonDelete setEnabled:NO];
    else
        [buttonDelete setEnabled:YES];
}


// Añade el contenido del array en la fila correspondiente de la tabla
-(id) tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row
{
    NSString *cadena = [anArray objectAtIndex:row];
    NSLog(@"Fila %ld - Texto (%@)\r", row, cadena);
    return cadena;
}

// Permite editar los campos de las filas de la tabla
-(void) tableView:(NSTableView *)tableView
setObjectValue:(nullable id)object
 forTableColumn:(nullable NSTableColumn *)tableColumn
            row:(NSInteger)row
{
    NSString *cadena = [anArray objectAtIndex:row];
    [anArray setObject:object atIndexedSubscript:row];
    NSLog(@"Texto Antiguo (%@) - Texto nuevo(%@)\r", cadena, object);
}

// Devuelve el numero de columnas de la tabla
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [anArray count];
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
