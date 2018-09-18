//
//  Model.m
//  EuroConversor
//
//  Created by Luis Blazquez Miñambres on 18/9/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "Model.h"

@implementation Model

// El equivalente al constructor en Java
// El metodo intit permite inicializar y dar valor a las variables de instancia
// declaradas en Model.h
// self es equivalente a this

-(id) init {
    self = [super init];
    if (self){
        cambioEURO = 166.38;
    }
    
    return self;
}

// La variable euros es el argumento de tipo float que se pasa al metodo
// Y que será el valor que el usuario introduzca en la interfaz grafica de usuario
// en campo de texto de tipo NSTextField

-(float) convertirEuros:(float)euros
{
    float pesetas;
    
    pesetas = cambioEURO * euros;
    return pesetas;
}

-(float) convertirPesetas:(float)pesetas
{
    float euros;
    
    euros = pesetas / cambioEURO;
    return euros;
}
@end
