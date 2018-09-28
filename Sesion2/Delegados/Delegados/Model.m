//
//  Model.m
//  Delegados
//
//  Created by Luis Blazquez Miñambres on 28/9/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "Model.h"

@implementation Model

-(int)contadorPalabras:(NSString*)cadena
{
    int count = 0;
    
    // Tambien se podria con
    // count = (int) cadena.lengthhacer un casting a int
    
    for (int i = 0; i < cadena.length; i++) {
        count++;
    }
    
    return count;
}

@end
