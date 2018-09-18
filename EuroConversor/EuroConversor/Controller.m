//
//  Controller.m
//  EuroConversor
//
//  Created by Luis Blazquez Miñambres on 18/9/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "Controller.h"
#import "Model.h"


@implementation Controller

// En este metodo de inicialización init
// se reserva memoria para la instancia del Model de tipo puntero
// id es un puntero generico, aunque no es lo mismo que void*

-(id) init {
    self = [super init];
    if (self){
        elModelo = [[Model alloc]init];
    }
    
    return self;
}

-(IBAction)euroPesetas:(id)sender
{
    float euros, pesetas;
    
    euros = [entrada floatValue];
    pesetas = [elModelo convertirEuros:euros];
    [salida setFloatValue:pesetas];
}

-(IBAction)pesetaEuros:(id)sender
{
    float euros, pesetas;
    
    pesetas = [entrada floatValue];
    euros = [elModelo convertirPesetas:pesetas];
    [salida setFloatValue:euros];
}

@end
