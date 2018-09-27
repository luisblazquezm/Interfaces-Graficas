//
//  main.m
//  Medicamento
//
//  Created by Luis Blazquez Miñambres on 25/9/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Medicamento.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *items = [[NSMutableArray alloc] init];
        for (int i = 0; i < 10; i++) {
            [items addObject:[Medicamento randomMedicine]];
        }
        
        for (Medicamento *item in items) {
            NSLog(@"%@\n", item);
        }
    }
    return 0;
}
