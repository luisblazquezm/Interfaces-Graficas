//
//  MisControlesController.h
//  MisControles
//
//  Created by alumno5 on 1/10/18.
//  Copyright © 2018 USAL. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MisControlesController : NSObject <NSTextFieldDelegate>
{
    //IBOutlet NSTextField *entrada;
    IBOutlet NSTextField *entradaTexto;
    IBOutlet NSSlider *slider;
    IBOutlet NSTextField *salida;
}

-(IBAction)controlTextDidChange:(NSNotification *)obj;
//-(IBAction)respuestaText:(id)sender;
-(IBAction)respuestaButton:(id)sender;
-(IBAction)respuestaText2:(id)sender;
-(IBAction)respuestaSlider:(id)sender;
-(IBAction)checkedButton:(NSButton *)sender;

@end
