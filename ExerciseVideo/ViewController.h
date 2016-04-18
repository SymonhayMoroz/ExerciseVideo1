//
//  ViewController.h
//  ExerciseVideo
//
//  Created by dev on 2016. 3. 26..
//  Copyright © 2016 Symonhay M. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalVar.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

