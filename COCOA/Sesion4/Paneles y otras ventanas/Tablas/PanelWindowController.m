//
//  PanelWindowController.m
//  Tablas
//
//  Created by Luis Blazquez Miñambres on 9/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "PanelWindowController.h"
#import "PanelWindowModel.h"


@interface PanelWindowController ()

@end

@implementation PanelWindowController

NSString *PanelChangeTableNotification = @"PanelChangeTable";

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
        NSLog(@"En init Panel");
        elPanelModelo = [[PanelWindowModel alloc] init];
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
    NSColor *backgroundColorTableLeft = [colorWellLeft color];
    NSColor *backgroundColorTableRight = [colorWellRight color];
    NSLog(@"Color seleccionado Izquierda: %@", backgroundColorTableLeft);
    NSLog(@"Color seleccionado Derecha: %@", backgroundColorTableRight);
    NSDictionary *notificationInfo = [NSDictionary dictionaryWithObjectsAndKeys:backgroundColorTableLeft,@"tableLeftColor",
                                     backgroundColorTableRight,@"tableRightColor",
                                     nil];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:PanelChangeTableNotification
                      object:self
                    userInfo:notificationInfo];
}

-(void)activateTable:(id)sender
{
    NSNumber *tableStateLeft = [[NSNumber alloc] initWithInteger:[checkButtonLeft state]];
    NSNumber *tableStateRight = [[NSNumber alloc] initWithInteger:[checkButtonRight state]];
    NSLog(@"Tabla activada Izquierda: %@", tableStateLeft);
    NSLog(@"Tabla activada Derecha: %@", tableStateRight);
    NSDictionary *notificationInfo = [NSDictionary dictionaryWithObjectsAndKeys:tableStateLeft,@"tableLeftState",
                                      tableStateRight,@"tableRightState",
                                      nil];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:PanelChangeTableNotification
                      object:self
                    userInfo:notificationInfo];
}

-(IBAction)buttonAddPanel:(id)sender
{
    NSString *cadena = [field stringValue];
    [[elPanelModelo anArray] addObject:cadena];
    NSLog(@"Cadena guardada en array: %@\r", cadena);
    [aTableView reloadData];
    
}

-(IBAction)buttonDeletePanel:(id)sender
{

    
}

// Añade el contenido del array en la fila correspondiente de la tabla
-(id) tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row
{
        NSString *cadena = [[elPanelModelo anArray] objectAtIndex:row];
        NSLog(@"PANEL: Fila %ld - Texto (%@)\r", row, cadena);
        return cadena;
}

// Permite editar los campos de las filas de la tabla
-(void) tableView:(NSTableView *)tableView
   setObjectValue:(nullable id)object
   forTableColumn:(nullable NSTableColumn *)tableColumn
              row:(NSInteger)row
{
        NSString *cadena = [[elPanelModelo anArray] objectAtIndex:row];
        [[elPanelModelo anArray] setObject:object atIndexedSubscript:row];
        NSLog(@"PANEL: Texto Antiguo (%@) - Texto nuevo(%@)\r", cadena, object);
}

// Devuelve el numero de columnas de la tabla
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
        return [[elPanelModelo anArray] count];
}

// En cuanto el usuario meta un solo carácter, el boton añadir se hará visible
-(IBAction)controlTextDidChange:(NSNotification *)obj;
{
    NSString *cadena = [field stringValue];
    if([cadena length] > 0)
        [addB setEnabled:YES];
    else
        [addB setEnabled:NO];
    
}




@end
