//
//  Controller.m
//  RandomApp
//
//  Created by Luis Blazquez Miñambres on 19/9/18.
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

-(IBAction)generarNumerosAleatorios:(id)sender
{
    int aleatorio;
    
    aleatorio = [elModelo generarAleatorio];
    [salida setIntegerValue:aleatorio];
}

-(IBAction)establecerSemillaFecha:(id)sender
{
    NSString * texto;
    
    texto = [elModelo generarSemilla];
    [salida setStringValue:texto];
}

// En caso de querer utilizar awakeFromNib y que cuente las palabras
// de una cadena desde el inicio

/*
 -(void) awakeFromNib
 {
 NSString *texto;
 
 texto = [elModelo generarSemilla];
 [salida setStringValue:texto];
 }
 */

@end
