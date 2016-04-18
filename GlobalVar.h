//
//  GlobalVar.h
//  MurphyLifeCoaching
//
//  Created by dev on 2/9/16.
//  Copyright © 2016 dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalVar : NSObject {
    BOOL checkedBook;
    int cartBook;
    int cartTshirt;
    int coachNum;
}

@property BOOL checkedBook;
@property int cartBook;
@property int cartTshirt;
@property int coachNum;
+(GlobalVar *) getInstance;
@end
