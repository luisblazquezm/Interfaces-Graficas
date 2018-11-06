//
//  PanelWindowController.h
//  Tablas
//
//  Created by Luis Blazquez Miñambres on 9/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class PanelWindowModel;

@interface PanelWindowController : NSWindowController <NSWindowDelegate,
                                                        NSTextFieldDelegate,
                                                        NSTableViewDelegate,
                                                        NSTableViewDataSource,
                                                        NSControlTextEditingDelegate>
{
    IBOutlet NSColorWell *colorWellLeft;
    IBOutlet NSButton *checkButtonLeft;
    IBOutlet NSColorWell *colorWellRight;
    IBOutlet NSButton *checkButtonRight;
    IBOutlet NSTextField *field;
    IBOutlet NSButton *addB;
    IBOutlet NSTableView *aTableView;
    PanelWindowModel *elPanelModelo;
}

-(IBAction)changeTableColor:(id)sender;
-(IBAction)activateTable:(id)sender;
-(IBAction)buttonAddPanel:(id)sender;
-(IBAction)buttonDeletePanel:(id)sender;

@end
