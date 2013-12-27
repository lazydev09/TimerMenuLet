//
//  TIMERAppDelegate.h
//  TimerMenuLet
//
//  Created by picmondlion on 27/12/13.
//  Copyright (c) 2013 chaitu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TIMERAppDelegate : NSObject <NSApplicationDelegate>{
    __unsafe_unretained NSWindow *_window;
    IBOutlet NSMenu *statusMenu;
    NSStatusItem * statusItem;
}


@end
