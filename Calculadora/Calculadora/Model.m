//
//  Model.m
//  Calculadora
//
//  Created by Luis Blazquez Miñambres on 23/9/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "Model.h"

@implementation Model

-(id) init {
    self = [super init];
    if (self){
        array = [[NSMutableArray alloc]init];
    }
    
    return self;
}


-(float) addPromptNumber: (int) number
{
    
}
-(float) addPromptSymbol: (char) symbol
{
    
}
-(float) calculateOperation
{
    NSNumber *num1, *num2;
    NSString *symbol;
    char aritmeticSymbol;
    float result = 0;
    
    num1 = [[NSNumber alloc] init];
    num2 = [[NSNumber alloc] init];
    symbol = [[NSString alloc] init];
    
    num1 = [array objectAtIndex:0];
    symbol = [array objectAtIndex:1];
    num2 = [array objectAtIndex:2];
    
    if(symbol.string)
    
    switch (aritmeticSymbol) {
        case '+':
                result = num1.intValue + num2.intValue;
            break;
            
            
        default:
            break;
    }
    
    return result;
    
}


@end
