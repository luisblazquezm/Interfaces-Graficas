//
//  Controller.h
//  EuroConversor
//
//  Created by Luis Blazquez Miñambres on 18/9/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

// La diferencia entre @class e import es
// que el primero evita coger todos los metodos y variables dentro de Model
// y solo coge lo necesario (esto puede ser de utilidad en el ahorro de recursos
// en programas más grandes).
// El segundo, en cambio, hace todo lo contrario.

#import <Cocoa/Cocoa.h>
@class Model;

// El controlador hereda de la clase NSObject al tener los :

@interface Controller : NSObject {
    
    // Creamos las variables de instancia de tipo puntero de los objetos
    // La caja de entrada donde introduciremos el valor a convertir
    // Y la caja de salida que mostrará el valor convertido
    // En cualquier caso trataremos con punteros
    
    IBOutlet NSTextField *entrada;
    IBOutlet NSTextField *salida;
    Model *elModelo;
    
}

// Declaración de los metodos de instancia para convertir de euros a pesetas y viceversa
// Serán invocados por objetos de la interfaz grafica de usuario

-(IBAction)euroPesetas:(id)sender;
-(IBAction)pesetaEuros:(id)sender;

@end
