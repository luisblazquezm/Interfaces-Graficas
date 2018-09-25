//
//  NSPossesion.h
//  Possesion
//
//  Created by alumno5 on 24/9/18.
//  Copyright © 2018 USAL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSPossesion : NSObject
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
@property (readonly) NSDate *dateCreated;

-(id) initWithPossesionName: (NSString *) aName
               valueInEuros: (int) value
                 serialName: (NSString *) sNumber;

+(id) randomPosession;

@end
