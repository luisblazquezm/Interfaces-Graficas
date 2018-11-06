//
//  main.m
//  Ejemplo
//
//  Created by alumno5 on 24/9/18.
//  Copyright © 2018 USAL. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        NSMutableArray *instanciaArray;
        NSArray *otroArray;
        NSString *instanciaString, *otraInstancia = @"Cadena numero: 3";
        int i;
        
        instanciaArray = [[NSMutableArray alloc] init];
        
        for (i = 0; i < 10; i++) {
            instanciaString = [[NSString alloc]
                              initWithFormat:@"Cadena numero: %d", i];
            
            [instanciaArray addObject:instanciaString];
        }
        
        for (i = 0; i < [instanciaArray count]; i++) {
            instanciaString = [instanciaArray objectAtIndex:i];
            NSLog(@"El valor en la posicion %d es %@", i, instanciaString);
            
            if ([instanciaString isEqual:otraInstancia]){
                NSLog(@"La cadena %@ (%p) es igual a la cadena %@(%p)",
                      instanciaString, instanciaString,
                      otraInstancia, otraInstancia);
            }
            
            if (instanciaString == otraInstancia) {
                NSLog(@"La instancia %@ (%p) es igual a la instancia %@ (%p)",
                      instanciaString, instanciaString,
                      otraInstancia, otraInstancia);
            }
            
        }
        
        otraInstancia = instanciaString;
        for (i = 0; i < [instanciaArray count]; i++) {
            instanciaString = [instanciaArray objectAtIndex:i];
            NSLog(@"El valor en la posicion %d es %@", i, instanciaString);
            
            if ([instanciaString isEqual:otraInstancia]) {
                NSLog(@"La cadena %@ (%p) es igual a la cadena %@ (%p)",
                      instanciaString, instanciaString,
                      otraInstancia, otraInstancia);
            }
            
            if (instanciaString == otraInstancia) {
                NSLog(@"La instancia %@ (%p) es igual a la instancia %@ (%p)",
                      instanciaString, instanciaString,
                      otraInstancia, otraInstancia);
            }
        }
    }
    return 0;
}
