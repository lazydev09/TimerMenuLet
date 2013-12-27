//
//  TIMERAppDelegate.m
//  TimerMenuLet
//
//  Created by picmondlion on 27/12/13.
//  Copyright (c) 2013 chaitu. All rights reserved.
//  Referece : https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/MenuList/MenuList.html#//apple_ref/doc/uid/10000032-SW1
//
//

#import "TIMERAppDelegate.h"

@implementation TIMERAppDelegate{
        NSStatusItem * statusItem2;
}





- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

-(void)awakeFromNib{
            statusItem2 = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
      statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];

    [statusItem setHighlightMode:YES];
    [statusItem setTarget:self];
    [statusItem setAction:@selector(restartTimer:)];
    
   // [statusItem2 setMenu:statusMenu];
    [statusItem2 setTitle:@"R"];
    [statusItem2 setTarget:self];
    [statusItem2 setAction:@selector(resetTimer:)];

    
    [self startTimer:NULL];
    
    
    
}

    static int min = 24;
    static int sec = 60;
    static int today = 0;
    static NSTimer *nsTimer;

- (void)decrement;
{
 

    if(min<0){
        NSDictionary *titleAttributes = [NSDictionary dictionaryWithObject:[NSColor redColor] forKey:NSForegroundColorAttributeName];
        
        NSAttributedString* blueTitle = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%.2f",0.00] attributes:titleAttributes];
        [statusItem setAttributedTitle:blueTitle];
        
            [nsTimer invalidate];

        return ;

    }

    if(sec==0){
        sec = 60;
        min = min -1;
    }
    
    NSDictionary *titleAttributes = [NSDictionary dictionaryWithObject:[NSColor blueColor] forKey:NSForegroundColorAttributeName];
    
    NSAttributedString* blueTitle = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%02d.%02d  | %d",min, sec-- , today] attributes:titleAttributes];
    [statusItem setAttributedTitle:blueTitle];


}



-(void) startTimer :(id)sender{
    
    [nsTimer invalidate];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:
                                [self methodSignatureForSelector:@selector(decrement)]];
    [invocation setTarget:self];
    [invocation setSelector:@selector(decrement)];
    nsTimer = [NSTimer timerWithTimeInterval:1 invocation:invocation repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:nsTimer forMode:NSRunLoopCommonModes];

}

-(void) restartTimer :(id)sender{
    NSLog(@"in stop timer");

    if([nsTimer isValid]){
                [nsTimer invalidate];
    }
    else{
        [self startTimer:self];
    }
    
}

-(void) resetTimer :(id)sender{
    min=24;
    sec=60;
    [statusItem setTitle:@"25.00"];
}


@end
