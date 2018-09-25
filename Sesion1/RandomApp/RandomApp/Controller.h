//
//  Controller.h
//  RandomApp
//
//  Created by Luis Blazquez Miñambres on 19/9/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class Model;

@interface Controller : NSObject
{
    IBOutlet NSTextField *salida;
    Model *elModelo;
}

-(IBAction)generarNumerosAleatorios:(id)sender;
-(IBAction)establecerSemillaFecha:(id)sender;

@end
