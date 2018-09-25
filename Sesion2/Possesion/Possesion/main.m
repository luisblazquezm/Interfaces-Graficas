//
//  main.m
//  Possesion
//
//  Created by alumno5 on 24/9/18.
//  Copyright © 2018 USAL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSPossesion.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*   //Ejercicio Parte 1
        NSPossesion *myPossesion;
        
        myPossesion = [[NSPossesion alloc] initWithPossesionName:@"Mesa roble" valueInEuros:1200 serialName:@"12129VW5"];

        NSLog(@"La clase %@ tiene nombre: %@\t número de serie: %@\t y cuesta: %d y la fecha: %@",
              myPossesion,
              [myPossesion possesionName],
              [myPossesion serialNumber],
              [myPossesion valueInEuros],
              [myPossesion dateCreated]);
        
        NSLog(@"La posesión %@ \n\n", myPossesion);
         */
        
                //Ejercicio Parte 2
        NSMutableArray *items = [[NSMutableArray alloc] init];
        for (int i = 0; i < 10; i++) {
            [items addObject:[NSPossesion randomPosession]];
        }
        
        for (NSPossesion *item in items) {
            NSLog(@"%@", item);
        }
    }
    return 0;
}


