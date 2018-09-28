//
//  Controller.h
//  Delegados
//
//  Created by Luis Blazquez Miñambres on 28/9/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class Model;

@interface Controller : NSObject
{
    IBOutlet NSTextField *entradaTexto;
    IBOutlet NSTextField *salida;
    Model *elModelo;
}

-(IBAction)respuestaText:(id)sender;
-(IBAction)respuestaText2:(id)sender;
-(IBAction)findSelectedButton:(id)sender;
-(IBAction)checkedButton:(id)sender;
-(IBAction)respuestaButton:(id)sender;
-(IBAction)respuestaSlider:(id)sender;


@end
