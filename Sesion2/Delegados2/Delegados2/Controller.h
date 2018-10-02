//
//  Controller.h
//  Delegados2
//
//  Created by Luis Blazquez Miñambres on 2/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// Convierte el Controlador en el delegado del objeto NSSpeechSynthesizer
// Añadiendo NSSpeechSynthesizerDelegate

@interface Controller : NSObject <NSSpeechSynthesizerDelegate,NSWindowDelegate>
{
    IBOutlet NSTextField *entrada;
    NSSpeechSynthesizer *speechSynth;
    IBOutlet NSButton *stopButton;
    IBOutlet NSButton *sayButton;
}

-(IBAction)sayIt:(id)sender;
-(IBAction)stopIt:(id)sender;
-(void)speechSynthesizer:(NSSpeechSynthesizer *)sender
       didFinishSpeaking:(BOOL)finishedSpeaking;

@end
