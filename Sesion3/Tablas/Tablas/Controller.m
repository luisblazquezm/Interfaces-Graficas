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
        anArrayLeft = [[NSMutableArray alloc] init];
        anArrayRight = [[NSMutableArray alloc] init];
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
    [anArrayLeft addObject:cadena];
    NSLog(@"Cadena guardada en array: %@\r", cadena);
    [aTableViewLeft reloadData];
    
}

-(IBAction)buttonDelete:(id)sender
{
    if([sender tag] == -6){                                 // Tabla Izquierda
        aRowSelectedLeft = [aTableViewLeft selectedRow];
        [aTableViewLeft abortEditing]; // Orden que deniega la edición al usuario (Es necesrio en el caso en el que el usuario intente editar un campo y pulse el botón eliminar (produce un bug)
        if (aRowSelectedLeft == -1)
            return;
        
        [anArrayLeft removeObjectAtIndex:aRowSelectedLeft];
        NSLog(@"Cadena eliminada en array en pos %ld\r", aRowSelectedLeft);
        [aTableViewLeft reloadData];
    } else {
        aRowSelectedRight = [aTableViewRight selectedRow];
        [aTableViewRight abortEditing]; // Orden que deniega la edición al usuario (Es necesrio en el caso en el que el usuario intente editar un campo y pulse el botón eliminar (produce un bug)
        if (aRowSelectedRight == -1)
            return;
        
        [anArrayRight removeObjectAtIndex:aRowSelectedRight];
        NSLog(@"Cadena eliminada en array en pos %ld\r", aRowSelectedLeft);
        [aTableViewLeft reloadData];
    }
}

-(IBAction)buttonPass:(id)sender
{
    if([sender tag] == 1){                // Boton para pasar de Tabla Izquierda a tabla Derecha
        aRowSelectedLeft = [aTableViewLeft selectedRow];
        NSString *cadena = [anArrayLeft objectAtIndex:aRowSelectedLeft];
        [anArrayLeft removeObjectAtIndex:aRowSelectedLeft];
        [anArrayRight addObject:cadena];
        NSLog(@"Cadena pasada de izquierda a derecha: %@\r", cadena);
        [aTableViewLeft reloadData];
        [aTableViewRight reloadData];
    } else {                             // Boton para pasar de Tabla Derecha a tabla Izquierda
        aRowSelectedRight = [aTableViewRight selectedRow];
        NSString *cadena = [anArrayRight objectAtIndex:aRowSelectedRight];
        [anArrayRight removeObjectAtIndex:aRowSelectedRight];
        [anArrayLeft addObject:cadena];
        NSLog(@"Cadena pasada de derecha a izquierda: %@\r", cadena);
        [aTableViewLeft reloadData];
        [aTableViewRight reloadData];
    }
        
    
}

// Si selecciona alguna fila, se habilita el botón eliminar. En caso contrario se deshabilita
-(void) tableViewSelectionDidChange:(NSNotification *)notification
{
    aRowSelectedLeft = [aTableViewLeft selectedRow];
    aRowSelectedRight = [aTableViewRight selectedRow];
    

    if (aRowSelectedLeft != -1 && aRowSelectedRight == -1){     // Fila seleccionada en la tabla Izquierda
        [buttonDeleteLeft setEnabled:YES];
        [buttonDeleteRight setEnabled:NO];
        [buttonRight setEnabled:YES];
        [buttonLeft setEnabled:NO];
    } else if (aRowSelectedLeft == -1 && aRowSelectedRight != -1) {  // Fila seleccionada en la tabla Derecha
        [buttonDeleteRight setEnabled:YES];
        [buttonDeleteLeft setEnabled:NO];
        [buttonLeft setEnabled:YES];
        [buttonRight setEnabled:NO];
    } else {                                                    // Fila no Seleccionada
        [buttonDeleteLeft setEnabled:NO];
        [buttonDeleteRight setEnabled:NO];
        [buttonLeft setEnabled:NO];
        [buttonRight setEnabled:NO];
    }
}


// Añade el contenido del array en la fila correspondiente de la tabla
-(id) tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row
{
    if([tableView tag] == -6){                                 // Tabla Izquierda
        NSString *cadena = [anArrayLeft objectAtIndex:row];
        NSLog(@"Fila %ld - Texto (%@)\r", row, cadena);
        return cadena;
    } else {                                                  // Tabla Derecha
        NSString *cadena = [anArrayRight objectAtIndex:row];
        NSLog(@"Fila %ld - Texto (%@)\r", row, cadena);
        return cadena;
    }
}

// Permite editar los campos de las filas de la tabla
-(void) tableView:(NSTableView *)tableView
setObjectValue:(nullable id)object
 forTableColumn:(nullable NSTableColumn *)tableColumn
            row:(NSInteger)row
{
    if([tableView tag] == -6){
        NSString *cadena = [anArrayLeft objectAtIndex:row];
        [anArrayLeft setObject:object atIndexedSubscript:row];
        NSLog(@"Texto Antiguo (%@) - Texto nuevo(%@)\r", cadena, object);
    } else {
        NSString *cadena = [anArrayRight objectAtIndex:row];
        [anArrayRight setObject:object atIndexedSubscript:row];
        NSLog(@"Texto Antiguo (%@) - Texto nuevo(%@)\r", cadena, object);
    }
}

// Devuelve el numero de columnas de la tabla
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    if([tableView tag] == -6) // Tabla Izquierda
        return [anArrayLeft count];
    else                      // Tabla Derecha
        return [anArrayRight count];
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
