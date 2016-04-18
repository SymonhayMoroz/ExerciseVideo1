//
//  GlobalVar.m
//  MurphyLifeCoaching
//
//  Created by dev on 2/9/16.
//  Copyright © 2016 dev. All rights reserved.
//

#import "GlobalVar.h"

@implementation GlobalVar

@synthesize timeSet;
@synthesize g_listNumber;

static GlobalVar *instance = nil;

+(GlobalVar *)getInstance
{
    
    
    @synchronized(self) {
        if (instance==nil) {
            instance=[GlobalVar new];
        }
    }
    return instance;
}

@end
