//
//  Possesion.h
//  PosessionGraphic_Interface
//
//  Created by Luis Blazquez Miñambres on 27/9/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Possesion : NSObject
{ // Declaracion de variables
    NSString *possesionName;
    NSString *serialNumber;
    int valueInEuros;
    NSDate *dateCreated;
}

// Declaracion de metodos
@property (nonatomic, copy) NSString *possesionName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInEuros;
@property (readonly) NSDate *dateCreated;// readonly = solo getter

// Inicializador = Constructor
-(id) initWithPossesionName: (NSString *) aName
               valueInEuros: (int) value
                 serialName: (NSString *) sNumber;

// Metodo de clase equivalente a un factoryMethod en JAVA
+(id) randomPosession;


@end
