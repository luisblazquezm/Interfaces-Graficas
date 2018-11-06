//
//  Controller.h
//  EjercicioTablas
//
//  Created by alumno5 on 8/10/18.
//  Copyright © 2018 USAL. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Controller : NSObject <NSWindowDelegate,
                                  NSTableViewDelegate,
                                  NSTableViewDataSource>
{
    IBOutlet NSTextField *textField;
    IBOutlet NSButton *addButton;
    IBOutlet NSButton *deleteLeftButton;
    IBOutlet NSButton *deleteRightButton;
    IBOutlet NSTableView *tableLeft;
    IBOutlet NSTableView *tableRight;
    IBOutlet NSButton *LeftToRightButton;
    IBOutlet NSButton *RightToLeftButton;
    NSMutableArray *arrayLeftTable, *arrayRightTable;
    NSInteger aSelectedRowLeft, aSelectedRowRight;
}

-(IBAction)addIt:(id)sender;
-(IBAction)deleteIt:(id)sender;
-(IBAction)passIt:(id)sender;

@end
