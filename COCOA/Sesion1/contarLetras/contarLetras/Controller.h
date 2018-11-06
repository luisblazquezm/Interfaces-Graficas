//
//  Controller.h
//  contarLetras
//
//  Created by Luis Blazquez Miñambres on 18/9/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class Model;

@interface Controller : NSObject
{
    IBOutlet NSTextField *entrada;
    IBOutlet NSTextField *salida;
    Model *elModelo;
}

-(IBAction)contarPalabras:(id)sender;

@end
