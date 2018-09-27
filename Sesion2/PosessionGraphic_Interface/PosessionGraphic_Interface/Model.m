//
//  Model.m
//  PosessionGraphic_Interface
//
//  Created by Luis Blazquez Miñambres on 27/9/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "Model.h"
#import "Possesion.h"

@implementation Model


-(NSMutableArray *) showPossesions
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    [items addObject:@"Hola, esto es un texto"];
    
    for (int i = 0; i < 10; i++) {
        [items addObject:[Possesion randomPosession]];
    }
    
    return items;
}

@end
