//
//  Controller.m
//  Delegados2
//
//  Created by Luis Blazquez Miñambres on 2/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "Controller.h"

@implementation Controller

-(id)init
{
    self = [super init];
    if (self){
        NSLog(@"En init\r");
        speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil]; // Se inicia con la voz e idioma por defecto de mi sistema
        [speechSynth setDelegate:self]; // Convierte el Controlador en el delegado del objeto NSSpeechSynthesizer
    }
    NSLog(@"Self en init es: %@", self);
    return self;
}

-(IBAction)sayIt:(id)sender
{
    NSString *string = [entrada stringValue];
    
    if ([string length] == 0) {
        NSLog(@"La cadena %@ tiene longitud 0", string);
        return;
    }
    [stopButton setEnabled:YES];
    [sayButton setEnabled:NO];
    [speechSynth startSpeakingString:string];
    NSLog(@"Comienza el dictado de la cadena %@\r", string);
}

-(IBAction)stopIt:(id)sender
{
    NSLog(@"Parando el dictado...\r");
    [speechSynth stopSpeaking];
}

-(void)speechSynthesizer:(NSSpeechSynthesizer *)sender
       didFinishSpeaking:(BOOL)finishedSpeaking
{
    [stopButton setEnabled:NO];
    [sayButton setEnabled:YES];
    NSLog(@"Terminado: %d", finishedSpeaking);
}

@end
