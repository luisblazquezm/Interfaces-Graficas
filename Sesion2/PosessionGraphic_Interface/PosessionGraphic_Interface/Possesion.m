//
//  Possesion.m
//  PosessionGraphic_Interface
//
//  Created by Luis Blazquez Miñambres on 27/9/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "Possesion.h"

@implementation Possesion
@synthesize possesionName, serialNumber, valueInEuros, dateCreated;

-(NSString *) description
{
    NSString *descriptionString;
    
    // Se rellenará los valores con lo que devuelva el getter de possesioName,...
    descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Precio €%d, Adquirido %@",
                         possesionName, serialNumber,
                         valueInEuros, dateCreated];
    
    // Devolvemos la instancia (como un stringBuilder)
    return descriptionString;
}

-(id) initWithPossesionName: (NSString *) aName
               valueInEuros: (int) value
                 serialName: (NSString *) sNumber
{
    
    // Siempre invocar al inicializador del padre o superclase (NSObject)
    self = [super init];
    
    if(!self)
        return nil;
    [self setPossesionName:aName];
    [self setValueInEuros:value];
    [self setSerialNumber:sNumber];
    
    dateCreated = [[NSDate alloc] init];
    
    return self;
}

+(id) randomPosession
{
    static NSString *randomAdjectiveList[] =
    {
        @"roble",
        @"cerezo",
        @"pino"
    };
    
    static NSString *randomNounList[] =
    {
        @"Mesa",
        @"Estantería",
        @"Silla"
    };
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomNounList[random() % 3],
                            randomAdjectiveList[random() % 3]];
    
    int randomValue = random() % 500 + 1;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    (char)('0' + random() % 10),
                                    (char)('0' + random() % 10),
                                    (char)('A' + random() % 26),
                                    (char)('A' + random() % 26),
                                    (char)('0' + random() % 10)];
    
    Possesion *newPossesion = [[Possesion alloc]
                                 initWithPossesionName:randomName
                                 valueInEuros:randomValue
                                 serialName:randomSerialNumber];
    
    
    return newPossesion;
}

@end
