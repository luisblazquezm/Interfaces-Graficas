//
//  PanelWindowModel.m
//  Tablas
//
//  Created by Luis Blazquez Miñambres on 12/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "PanelWindowModel.h"

@implementation PanelWindowModel
@synthesize anArray;

-(id)init
{
    self = [super init];
    if (self){
        NSLog(@"En init ModeloPanel");
        anArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}



@end
