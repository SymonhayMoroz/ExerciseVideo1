//
//  VideoViewController.h
//  ExerciseVideo
//
//  Created by dev on 2016. 3. 26..
//  Copyright © 2016 Symonhay M. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalVar.h"

@interface VideoViewController : UIViewController

@property GlobalVar *g_listNumber;

@property (weak, nonatomic) IBOutlet UILabel *second;
@property (weak, nonatomic) IBOutlet UIProgressView *progress;

-(void)timeSetting;


    


@end
