//
//  Controller.m
//  PosessionGraphic_Interface
//
//  Created by Luis Blazquez Miñambres on 27/9/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "Controller.h"
#import "Model.h"
#import "Possesion.h"

@implementation Controller

-(id) init
{
    self = [super init];
    if (self){
        elModelo = [[Model alloc]init];
    }
    
    return self;
}

- (BOOL)textFieldShouldClear:(NSTextField *)textField
{
    return NO;
}


-(IBAction) mostrarPosesiones:(id)sender
{
    // Ojo trabajar siempre con MUTABLE ARRAYS para modificar su contenido y concatenar!!!!!!!!
    
    NSMutableArray *posesiones = [[NSMutableArray alloc] init];;
    NSMutableString *cadena = [[NSMutableString alloc] init];
    posesiones = [elModelo showPossesions];
    
    [salida setStringValue:cadena];
    
    for (Possesion *item in posesiones) {
        [cadena appendString: [NSMutableString stringWithFormat:@"%@\r",item]];
    }

    [salida setStringValue:cadena];
}

// En caso de querer utilizar awakeFromNib y que cuente las palabras
// de una cadena desde el inicio

/*
 -(void) awakeFromNib
 {
 NSString *texto;
 int contador;
 
 [entrada setStringValue:@"Hola amigo"];
 texto = [entrada stringValue];
 contador = [elModelo contadorPalabras:texto];
 [salida setIntegerValue:contador];
 }
 */

@end
