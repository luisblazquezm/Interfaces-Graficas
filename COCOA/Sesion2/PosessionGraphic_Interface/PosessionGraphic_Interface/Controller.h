//
//  Controller.h
//  PosessionGraphic_Interface
//
//  Created by Luis Blazquez Miñambres on 27/9/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class Model;

@interface Controller : NSObject
{
    IBOutlet NSTextField *salida;
    Model *elModelo;
}

-(BOOL)textFieldShouldClear:(NSTextField *)textField;
-(IBAction)mostrarPosesiones:(id)sender;

@end
