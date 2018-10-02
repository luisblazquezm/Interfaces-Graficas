//
//  MisControlesController.h
//  MisControles
//
//  Created by alumno5 on 1/10/18.
//  Copyright © 2018 USAL. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MisControlesController : NSObject
{
    IBOutlet NSTextField *entrada;
    IBOutlet NSSlider *slider;
    IBOutlet NSTextField *salida;
}

-(IBAction)respuestaText:(id)sender;
-(IBAction)respuestaButton:(id)sender;
-(IBAction)respuestaText2:(id)sender;
-(IBAction)respuestaSlider:(id)sender;
-(IBAction)checkedButton:(NSButton *)sender;

@end
