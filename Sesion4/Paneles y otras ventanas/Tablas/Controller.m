//
//  Controller.m
//  Tablas
//
//  Created by Luis Blazquez Miñambres on 5/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "Controller.h"
#import "PanelWindowController.h"
#import "Model.h"

@implementation Controller

extern NSString *PanelChangeTableNotification;

-(id)init
{
    self = [super init];
    if (self){
        NSLog(@"En init");
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(handlePanelChange:)
                   name:PanelChangeTableNotification
                 object:nil];
        //anArrayLeft = [[NSMutableArray alloc] init];
        //anArrayRight = [[NSMutableArray alloc] init];
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


-(IBAction)buttonAdd:(id)sender
{
    NSString *cadena = [textField stringValue];
    [[elModelo anArrayLeft] addObject:cadena];
    NSLog(@"Cadena guardada en array: %@\r", cadena);
    [aTableViewLeft reloadData];
    
}

-(IBAction)buttonDelete:(id)sender
{
    if(sender == buttonDeleteLeft){                                 // Tabla Izquierda
        aRowSelectedLeft = [aTableViewLeft selectedRow];
        [aTableViewLeft abortEditing]; // Orden que deniega la edición al usuario (Es necesrio en el caso en el que el usuario intente editar un campo y pulse el botón eliminar (produce un bug)
        if (aRowSelectedLeft == -1)
            return;
        
        [[elModelo anArrayLeft] removeObjectAtIndex:aRowSelectedLeft];
        NSLog(@"Cadena eliminada en array en pos %ld\r", aRowSelectedLeft);
        [aTableViewLeft reloadData];
    } else {
        aRowSelectedRight = [aTableViewRight selectedRow];
        [aTableViewRight abortEditing]; // Orden que deniega la edición al usuario (Es necesrio en el caso en el que el usuario intente editar un campo y pulse el botón eliminar (produce un bug)
        if (aRowSelectedRight == -1)
            return;
        
        [[elModelo anArrayRight] removeObjectAtIndex:aRowSelectedRight];
        NSLog(@"Cadena eliminada en array en pos %ld\r", aRowSelectedLeft);
        [aTableViewLeft reloadData];
    }
    
}

-(IBAction)buttonPass:(id)sender
{
    if(sender == buttonRight){                // Boton para pasar de Tabla Izquierda a tabla Derecha
        aRowSelectedLeft = [aTableViewLeft selectedRow];
        NSString *cadena = [[elModelo anArrayLeft] objectAtIndex:aRowSelectedLeft];
        [[elModelo anArrayLeft] removeObjectAtIndex:aRowSelectedLeft];
        [[elModelo anArrayRight] addObject:cadena];
        NSLog(@"Cadena pasada de izquierda a derecha: %@\r", cadena);
        [aTableViewLeft reloadData];
        [aTableViewRight reloadData];
    } else {                             // Boton para pasar de Tabla Derecha a tabla Izquierda
        aRowSelectedRight = [aTableViewRight selectedRow];
        NSString *cadena = [[elModelo anArrayRight] objectAtIndex:aRowSelectedRight];
        [[elModelo anArrayRight] removeObjectAtIndex:aRowSelectedRight];
        [[elModelo anArrayLeft] addObject:cadena];
        NSLog(@"Cadena pasada de derecha a izquierda: %@\r", cadena);
        [aTableViewLeft reloadData];
        [aTableViewRight reloadData];
    }
        
    
}

// Si selecciona alguna fila, se habilita el botón eliminar. En caso contrario se deshabilita
-(void) tableViewSelectionDidChange:(NSNotification *)notification
{
    //aRowSelectedLeft = [aTableViewLeft selectedRow];
    //aRowSelectedRight = [aTableViewRight selectedRow];
    

    if ([notification object] == aTableViewLeft){     // Fila seleccionada en la tabla Izquierda
        [buttonDeleteLeft setEnabled:YES];
        [buttonDeleteRight setEnabled:NO];
        [buttonRight setEnabled:YES];
        [buttonLeft setEnabled:NO];
    } else if ([notification object] == aTableViewRight) {  // Fila seleccionada en la tabla Derecha
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
    if(tableView == aTableViewLeft){                                 // Tabla Izquierda
        NSString *cadena = [[elModelo anArrayLeft] objectAtIndex:row];
        NSLog(@"Fila %ld - Texto (%@)\r", row, cadena);
        return cadena;
    } else {                                                  // Tabla Derecha
        NSString *cadena = [[elModelo anArrayRight] objectAtIndex:row];
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
    if(tableView == aTableViewLeft){
        NSString *cadena = [[elModelo anArrayLeft] objectAtIndex:row];
        [[elModelo anArrayLeft] setObject:object atIndexedSubscript:row];
        NSLog(@"Texto Antiguo (%@) - Texto nuevo(%@)\r", cadena, object);
    } else {
        NSString *cadena = [[elModelo anArrayRight] objectAtIndex:row];
        [[elModelo anArrayRight] setObject:object atIndexedSubscript:row];
        NSLog(@"Texto Antiguo (%@) - Texto nuevo(%@)\r", cadena, object);
    }
}

// Devuelve el numero de columnas de la tabla
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    if(tableView == aTableViewLeft) // Tabla Izquierda
        return [[elModelo anArrayLeft] count];
    else                      // Tabla Derecha
        return [[elModelo anArrayRight] count];
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

-(IBAction)showPanel:(id)sender
{
    if(!panelController)
        panelController = [[PanelWindowController alloc] init];
    
    NSLog(@"panel %@\r", panelController);
    [panelController showWindow:self];
}

-(void)handlePanelChange:(NSNotification*)aNotification
{
    NSLog(@"Notificacion %@ recibida en handlePanelChange\r", aNotification);
    NSDictionary *notificationInfo = [aNotification userInfo];
    
    NSColor *colorLeft = [notificationInfo objectForKey:@"tableLeftColor"];
    NSNumber *numberStateLeft = [notificationInfo objectForKey:@"tableLeftState"];
    NSColor *colorRight = [notificationInfo objectForKey:@"tableRightColor"];
    NSNumber *numberStateRight = [notificationInfo objectForKey:@"tableRightState"];
    
    if (colorLeft != nil){
        [aTableViewLeft setBackgroundColor:colorLeft];
    }
    
    if (colorRight != nil){
        [aTableViewRight setBackgroundColor:colorRight];
    }
    
    if (numberStateLeft != nil){
        aRowSelectedLeft = -1;
        [aTableViewLeft deselectAll:self];
        [aTableViewLeft setEnabled:[numberStateLeft integerValue]];
    }
    
    if (numberStateRight != nil){
        aRowSelectedRight = -1;
        [aTableViewRight deselectAll:self];
        [aTableViewRight setEnabled:[numberStateRight integerValue]];
    }
    
}

-(void)dealloc
{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self];
}

@end
