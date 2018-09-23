//
//  Model.h
//  Calculadora
//
//  Created by Luis Blazquez Miñambres on 23/9/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
{
    NSMutableArray *array;
}

-(float) addPromptNumber: (int) number;
-(float) addPromptSymbol: (char) symbol;
-(float) calculateOperation;


@end
