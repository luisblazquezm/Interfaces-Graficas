//
//  Model.m
//  RandomApp
//
//  Created by Luis Blazquez Miñambres on 19/9/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "Model.h"
#import <stdlib.h>

@implementation Model

-(int)generarAleatorio
{
    int aleatorio;
    
    aleatorio = rand() % 101;
    
    return aleatorio;
}

-(NSString*)generarSemilla
{
    NSString* semilla;
    NSDate* date = [NSDate date];
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    
    formatter.dateFormat = @"EEEE, dd MMMM yyyy HH:mm:ss zzzz";
    semilla = [formatter stringFromDate:date];
    
    return semilla;
}


@end
