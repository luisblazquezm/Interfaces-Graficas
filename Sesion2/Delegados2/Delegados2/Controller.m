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
        voices = [NSSpeechSynthesizer availableVoices];
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
    [voiceTable setEnabled:NO];
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
    [voiceTable setEnabled:YES];
    NSLog(@"Terminado: %d", finishedSpeaking);
}

-(BOOL)windowShouldClose:(NSWindow *)sender
{
    NSInteger respuesta;
    
    respuesta = NSRunAlertPanel(@"Atencion",
                               @"¿Está seguro de que desea cerrar la ventana?.Esta accion finalizará la ejecución de la aplicación ",
                               @"No",
                               @"Si",
                               nil);
    if(respuesta == NSAlertDefaultReturn)
        return NO;
    else
        [NSApp terminate:self];
        return YES;
    
}

-(void) awakeFromNib
{
    NSString *defaultVoice = [NSSpeechSynthesizer defaultVoice];
    NSInteger defaultRow = [voices indexOfObject:defaultVoice];
    NSIndexSet *defaultRowIndex = [[NSIndexSet alloc]
                                   initWithIndex:defaultRow];
    
    [voiceTable selectRowIndexes:defaultRowIndex
            byExtendingSelection:NO];
    [voiceTable scrollRowToVisible:defaultRow];
}

-(NSInteger) numberOfRowsInTableView:(NSTableView *)tableView
{
    return [voices count];
}

-(id) tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row
{
    NSString *v = [voices objectAtIndex:row];
    NSDictionary *dict = [NSSpeechSynthesizer attributesForVoice:v];
    return [dict objectForKey:NSVoiceAge];
}

-(void) tableViewSelectionDidChange:(NSNotification *)notification
{
    NSInteger row = [voiceTable selectedRow];
    if (row == -1)
        return;
    
    NSString *selectedVoice = [voices objectAtIndex:row];
    [speechSynth setVoice:selectedVoice];
    NSLog(@"Voz seleccionada = %@\r", selectedVoice);
}
@end
