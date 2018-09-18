//
//  Model.h
//  EuroConversor
//
//  Created by Luis Blazquez Miñambres on 18/9/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject {
    float cambioEURO;
}

-(float) convertirEuros: (float) euros;
-(float) convertirPesetas: (float) pesetas;

@end
