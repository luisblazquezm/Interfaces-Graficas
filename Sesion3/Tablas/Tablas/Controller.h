//
//  Controller.h
//  Tablas
//
//  Created by Luis Blazquez Miñambres on 5/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Controller : NSObject <NSWindowDelegate,
                                  NSTextFieldDelegate,
                                  NSTableViewDelegate,
                                  NSTableViewDataSource,
                                  NSControlTextEditingDelegate>
{
    IBOutlet NSTextField *textField;
    IBOutlet NSButton *buttonDelete;
    IBOutlet NSButton *buttonAdd;
    IBOutlet NSTableView *aTableView;
    NSMutableArray *anArray;
    NSInteger aRowSelected;
}

    


// Comportamiento cierre ventana
-(BOOL)windowShouldClose:(NSWindow *)sender;
//-(NSSize)windowWillResize:(NSWindow *)sender toSize:(NSSize)frameSize;

-(IBAction)buttonAdd:(id)sender;
-(IBAction)buttonDelete:(id)sender;

@end
