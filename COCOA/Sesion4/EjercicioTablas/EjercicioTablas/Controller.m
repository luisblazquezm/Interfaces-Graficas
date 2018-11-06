//
//  Controller.m
//  EjercicioTablas
//
//  Created by alumno5 on 8/10/18.
//  Copyright © 2018 USAL. All rights reserved.
//

#import "Controller.h"

@implementation Controller

-(id) init
{
    self = [super init];
    if (self) {
        NSLog(@"En init\r");
        arrayLeftTable = [[NSMutableArray alloc] init];
        arrayRightTable = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(IBAction) addIt:(id)sender
{
    NSString *texto = [textField stringValue];
    [arrayLeftTable addObject:texto];
    NSLog(@"Cadena añadida a la tabla: %@\r", texto);
    [tableLeft reloadData];
    
}

-(IBAction) deleteIt:(id)sender
{
    NSIndexSet *indexArray = [[NSIndexSet alloc] init]; // Para eliminar varios a la vez!!!!!!!!!!
    
    if (sender == deleteLeftButton){
        indexArray = [tableLeft selectedRowIndexes];
        NSMutableArray *indices = [indexArray mutableCopy];
        [tableLeft abortEditing];
        for(NSInteger int in indices){
            if (aSelectedRowLeft == -1)
                return;
        }
        
        [arrayLeftTable removeObjectsAtIndexes:indexArray];
        NSLog(@"Cadenas eliminadas en array DERECHA en pos %ld\r", [indexArray firstIndex);
        [tableLeft reloadData];
    } else {
        indexArray = [tableRight selectedRowIndexes];
        [tableRight abortEditing];
        if (aSelectedRowRight == -1)
            return;
        
        [arrayRightTable removeObjectsAtIndexes:indexArray];
        NSLog(@"Cadenas eliminadas en array IZQUIERDA en pos %ld\r", index);
        [tableRight reloadData];
    }
}

-(IBAction) passIt:(id)sender
{
    if(sender == LeftToRightButton){
        aSelectedRowLeft = [tableLeft selectedRow];
        NSString *cadena = [arrayLeftTable objectAtIndex:aSelectedRowLeft];
        [arrayLeftTable removeObjectAtIndex:aSelectedRowLeft];
        [arrayRightTable addObject:cadena];
        NSLog(@"Cadena pasada de izquierda a derecha: %@\r", cadena);
        [tableLeft reloadData];
        [tableRight reloadData];
    } else {
        aSelectedRowRight = [tableRight selectedRow];
        NSString *cadena = [arrayRightTable objectAtIndex:aSelectedRowRight];
        [arrayRightTable removeObjectAtIndex:aSelectedRowRight];
        [arrayLeftTable addObject:cadena];
        NSLog(@"Cadena pasada de derecha a izquierda: %@\r", cadena);
        [tableLeft reloadData];
        [tableRight reloadData];
    }
}

-(void) tableViewSelectionDidChange:(NSNotification *)notification
{
    if ([notification object] == tableLeft){
        [deleteLeftButton setEnabled:YES];
        [deleteRightButton setEnabled:NO];
        [LeftToRightButton setEnabled:YES];
        [RightToLeftButton setEnabled:NO];
    } else if ([notification object] == tableRight) {
        [deleteLeftButton setEnabled:NO];
        [deleteRightButton setEnabled:YES];
        [LeftToRightButton setEnabled:NO];
        [RightToLeftButton setEnabled:YES];
    } else {
        [deleteLeftButton setEnabled:NO];
        [deleteRightButton setEnabled:NO];
        [LeftToRightButton setEnabled:NO];
        [RightToLeftButton setEnabled:NO];
    }

}

-(void) controlTextDidChange:(NSNotification *)obj
{
    if ([[textField stringValue] length] == 0){
        [addButton setEnabled:NO];
    } else {
        [addButton setEnabled:YES];
    }
}

-(NSInteger) numberOfRowsInTableView:(NSTableView *)tableView
{
    if (tableView == tableLeft){
        return [arrayLeftTable count];
    } else {
        return [arrayRightTable count];
    }
}

-(id)tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
           row:(NSInteger)row
{
    if (tableView == tableLeft){
        NSString *cadena = [arrayLeftTable objectAtIndex:row];
        NSLog(@"Fila %ld - Texto (%@)\r", row, cadena);
        return cadena;
    } else {
        NSString *cadena = [arrayRightTable objectAtIndex:row];
        NSLog(@"Fila %ld - Texto (%@)\r", row, cadena);
        return cadena;
    }
}

               
-(void)tableView:(NSTableView *)tableView
  setObjectValue:(id)object
  forTableColumn:(NSTableColumn *)tableColumn
             row:(NSInteger)row
{
    if(tableView == tableLeft){
        NSString *cadena = [arrayLeftTable objectAtIndex:row];
        [arrayLeftTable setObject:object atIndexedSubscript:row];
        NSLog(@"DERECHA: Texto Antiguo (%@) - Texto nuevo(%@)\r", cadena, object);
    } else {
        NSString *cadena = [arrayRightTable objectAtIndex:row];
        [arrayRightTable setObject:object atIndexedSubscript:row];
        NSLog(@"IZQUIERDA: Texto Antiguo (%@) - Texto nuevo(%@)\r", cadena, object);
    }
}

-(BOOL)windowShouldClose:(NSWindow *)sender
{
    NSInteger respuesta;
    
    respuesta = NSRunAlertPanel(@"Aviso",
                                @"¿Está seguro de que desea cerrar esta ventana?",
                                @"No",
                                @"Si",
                                nil);
    
    if (respuesta == NSAlertDefaultReturn){
        return NO;
    } else {
        [NSApp terminate:self];
        return YES;
    }
}

/*
-(void)windowWillStartLiveResize:(NSNotification *)notification
{
    
}
*/
@end
