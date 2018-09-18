//
//  Controller.m
//  contarLetras
//
//  Created by Luis Blazquez Miñambres on 18/9/18.
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

-(IBAction)contarPalabras:(id)sender
{
    NSString *texto;
    int contador;
    
    texto = [entrada stringValue];
    contador = [elModelo contadorPalabras:texto];
    [salida setIntegerValue:contador];
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
