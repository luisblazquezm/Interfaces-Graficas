//
//  PanelWindowController.h
//  Tablas
//
//  Created by Luis Blazquez Miñambres on 9/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PanelWindowController : NSWindowController
{
    IBOutlet NSColorWell *colorWellLeft;
    IBOutlet NSButton *checkButtonLeft;
    IBOutlet NSColorWell *colorWellRight;
    IBOutlet NSButton *checkButtonRight;
}

-(IBAction)changeTableColor:(id)sender;
-(IBAction)activateTable:(id)sender;

@end
