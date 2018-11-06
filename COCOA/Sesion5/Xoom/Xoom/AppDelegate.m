//
//  AppDelegate.m
//  Xoom
//
//  Created by Luis Blazquez Miñambres on 26/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSView *view;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    _view.layer.backgroundColor = NSColor.redColor.CGColor;
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)magnifyView:(NSMagnificationGestureRecognizer*)sender
{
    double mag = sender.magnification + 1.0;
    NSView *v = _view;
    [[v layer] setAffineTransform:(CGAffineTransformScale(v.layer.affineTransform, mag, mag))];
    sender.magnification = 0;
}


@end
