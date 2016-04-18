//
//  GlobalVar.h
//  MurphyLifeCoaching
//
//  Created by dev on 2/9/16.
//  Copyright © 2016 dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalVar : NSObject {
    NSString *timeSet;
    int g_listNumber;
}

@property NSString *timeSet;
@property int g_listNumber;
+(GlobalVar *) getInstance;
@end
