//
//  Controller.h
//  Tablas
//
//  Created by Luis Blazquez Miñambres on 5/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Model.h"

@interface Controller : NSObject <NSWindowDelegate,
                                  NSTextFieldDelegate,
                                  NSTableViewDelegate,
                                  NSTableViewDataSource,
                                  NSControlTextEditingDelegate>
{
    IBOutlet NSTextField *textField;
    IBOutlet NSButton *buttonDeleteLeft;
    IBOutlet NSButton *buttonDeleteRight;
    IBOutlet NSButton *buttonAdd;
    IBOutlet NSButton *buttonLeft;
    IBOutlet NSButton *buttonRight;
    IBOutlet NSTableView *aTableViewLeft;
    IBOutlet NSTableView *aTableViewRight;
    NSMutableArray *anArrayLeft, *anArrayRight;
    NSInteger aRowSelectedLeft, aRowSelectedRight;
    Model *elModelo;
}

    


// Comportamiento cierre ventana
-(BOOL)windowShouldClose:(NSWindow *)sender;
//-(NSSize)windowWillResize:(NSWindow *)sender toSize:(NSSize)frameSize;

-(IBAction)buttonAdd:(id)sender;
-(IBAction)buttonDelete:(id)sender;
-(IBAction)buttonPass:(id)sender;

@end
