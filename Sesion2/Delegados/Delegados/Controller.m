//
//  Controller.m
//  Delegados
//
//  Created by Luis Blazquez Miñambres on 28/9/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "Controller.h"
#import "Model.h"

@implementation Controller

-(id) init
{
    self = [super init];
    if (self){
        elModelo = [[Model alloc]init];
    }
    
    return self;
}

-(IBAction)respuestaText:(id)sender
{
    NSString *texto;
    int contador;
    
    texto = [entradaTexto stringValue];
    contador = [elModelo contadorPalabras:texto];
    [salida setIntegerValue:contador];
}

-(IBAction)respuestaText2:(id)sender
{
    NSDate *date = [sender objectValue];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EEEE d MMMM, YYYY"];
    NSString *dateStr = [dateFormat stringFromDate:date];
    
    NSString *title = [[NSString alloc] initWithFormat:@"La fecha escrita es: %@", dateStr];
    [salida setStringValue:title];
}

-(IBAction)findSelectedButton:(id)sender
{
    NSString *texto = [sender title];
    [salida setStringValue:texto];
}

-(IBAction)checkedButton:(id)sender
{
    NSString *texto;
    texto = [sender title];
    
    NSString *title = [[NSString alloc] initWithFormat:@"%@ (Tag %ld)", texto, [sender tag]];
    [salida setStringValue:title];
}

-(IBAction)respuestaSlider:(id)sender
{
    float valor = [sender floatValue];
    
    [salida setFloatValue:valor];
    [rueda setFloatValue:valor];
    
}

@end
