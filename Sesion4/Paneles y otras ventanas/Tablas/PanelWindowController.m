//
//  PanelWindowController.m
//  Tablas
//
//  Created by Luis Blazquez Miñambres on 9/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "PanelWindowController.h"



@interface PanelWindowController ()

@end

@implementation PanelWindowController

NSString *PanelChangeTableNotification = @"PanelChangeTable";

-(id)init
{
    if (![super initWithWindowNibName:@"PanelWindowController"])
        return nil;
    
    return self;
}

-(instancetype)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self){
        //Inicialization code here
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

-(void)changeTableColor:(id)sender
{
    NSColor *backgroundColorTableLeft = [colorWellLeft color];
    NSColor *backgroundColorTableRight = [colorWellRight color];
    NSLog(@"Color seleccionado Izquierda: %@", backgroundColorTableLeft);
    NSLog(@"Color seleccionado Derecha: %@", backgroundColorTableRight);
    NSDictionary *notificationInfo = [NSDictionary dictionaryWithObjectsAndKeys:backgroundColorTableLeft,@"tableLeftColor",
                                     backgroundColorTableRight,@"tableRightColor",
                                     nil];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:PanelChangeTableNotification
                      object:self
                    userInfo:notificationInfo];
}

-(void)activateTable:(id)sender
{
    NSNumber *tableStateLeft = [[NSNumber alloc] initWithInteger:[checkButtonLeft state]];
    NSNumber *tableStateRight = [[NSNumber alloc] initWithInteger:[checkButtonRight state]];
    NSLog(@"Tabla activada Izquierda: %@", tableStateLeft);
    NSLog(@"Tabla activada Derecha: %@", tableStateRight);
    NSDictionary *notificationInfo = [NSDictionary dictionaryWithObjectsAndKeys:tableStateLeft,@"tableLeftState",
                                      tableStateRight,@"tableRightState",
                                      nil];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:PanelChangeTableNotification
                      object:self
                    userInfo:notificationInfo];
}




@end
