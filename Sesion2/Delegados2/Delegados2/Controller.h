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

@interface Controller : NSObject <NSSpeechSynthesizerDelegate,
                                  NSWindowDelegate,
                                  NSTableViewDelegate,
                                  NSTableViewDataSource>
{
    IBOutlet NSTextField *entrada;
    NSSpeechSynthesizer *speechSynth;
    IBOutlet NSButton *stopButton;
    IBOutlet NSButton *sayButton;
    IBOutlet NSTableView *voiceTable;
    NSArray *voices;
}

// Comportamiento speak line
-(IBAction)sayIt:(id)sender;
-(IBAction)stopIt:(id)sender;
-(void)speechSynthesizer:(NSSpeechSynthesizer *)sender
       didFinishSpeaking:(BOOL)finishedSpeaking;

// Comportamiento cierre ventana
-(BOOL)windowShouldClose:(NSWindow *)sender;

// Comportamiento diferentes voces

@end
