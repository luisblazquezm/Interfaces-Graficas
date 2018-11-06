//
//  MisControlesController.m
//  MisControles
//
//  Created by alumno5 on 1/10/18.
//  Copyright © 2018 USAL. All rights reserved.
//

#import "MisControlesController.h"

@implementation MisControlesController

// Cada vez que el usuario teclee un caracter
// envia una notificación del target al action
// actualizando la longitud de la cadena en una unidad.

-(IBAction)respuestaText:(NSNotification *)obj
{
    NSString *cadena = [entrada stringValue];
    NSString *texto = [[NSString alloc] initWithFormat:@"La longitud de la cadena es %ld", [cadena length]];
    
    [salida setStringValue:texto];
    [salida sizeToFit];
    
}

// Metodo normal

/*
-(IBAction)respuestaText:(id)sender
{
    
    NSString *cadena = [sender stringValue];
    NSString *texto = [[NSString alloc] initWithFormat:@"La longitud de la cadena es %ld", [cadena length]];
    
    [salida setStringValue:texto];
    [salida sizeToFit];
     
}
 */

-(IBAction)respuestaButton:(id)sender
{
    NSString *titulo = [sender title];
    
    [salida setStringValue:titulo];
    [salida sizeToFit];
}

-(IBAction)respuestaSlider:(id)sender
{
    float valor = [sender floatValue];
    
    [salida setFloatValue:valor];
    [salida sizeToFit];
    [slider setFloatValue:valor];
    [slider sizeToFit];
}

-(IBAction)respuestaText2:(id)sender
{
    NSDate *date = [sender objectValue];
    NSDateFormatter *dateFormat =  [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EEEE d MMMM, YYYY"];
    NSString *dateStr = [dateFormat stringFromDate:date];
    NSString *title = [[NSString alloc]initWithFormat:@"La fecha escrita es: %@", dateStr];
    
    [salida setStringValue:title];
    [salida sizeToFit];
}

-(IBAction)checkedButton:(NSButton *)sender
{
    NSString *titulo = [sender title];
    NSInteger tag = [sender tag];
    
    NSMutableString *mutTitulo = [titulo mutableCopy]; // Conversion de NSString a NSMutableString
    
    if (([sender state]) == NSOnState){
        [mutTitulo appendFormat:@" (Tag %ld) Encendido",tag];
    }else{
        [mutTitulo appendFormat:@" (Tag %ld) Apagado",tag];
    }
    
    [salida setStringValue:mutTitulo];
    [salida sizeToFit];
}


@end
