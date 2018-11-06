//
//  Model.m
//  Tablas
//
//  Created by Luis Blazquez Miñambres on 6/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "Model.h"

@implementation Model
@synthesize anArrayRight, anArrayLeft;

-(id)init
{
    self = [super init];
    if (self){
        NSLog(@"En init Modelo");
        anArrayLeft = [[NSMutableArray alloc] init];
        anArrayRight = [[NSMutableArray alloc] init];
    }
    
    return self;
}

@end
