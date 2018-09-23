//
//  Controller.h
//  Calculadora
//
//  Created by Luis Blazquez Miñambres on 23/9/18.
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

-(IBAction)Button0:(id)sender;
-(IBAction)Button1:(id)sender;
-(IBAction)Button2:(id)sender;
-(IBAction)Button3:(id)sender;
-(IBAction)Button4:(id)sender;
-(IBAction)Button5:(id)sender;
-(IBAction)Button6:(id)sender;
-(IBAction)Button7:(id)sender;
-(IBAction)Button8:(id)sender;
-(IBAction)Button9:(id)sender;
-(IBAction)ButtonPlus:(id)sender;
-(IBAction)ButtonMinus:(id)sender;
-(IBAction)ButtonMultiply:(id)sender;
-(IBAction)ButtonDivide:(id)sender;
-(IBAction)ButtonEqual:(id)sender;
-(IBAction)ButtonNegative_Positive:(id)sender;
-(IBAction)ButtonReset:(id)sender;
-(IBAction)ButtonPercentage:(id)sender;
-(IBAction)ButtonPoint:(id)sender;

@end
