//
//  ViewController.m
//  ExerciseVideo
//
//  Created by dev on 2016. 3. 26..
//  Copyright © 2016 Symonhay M. All rights reserved.
//   info@materin.ag     s.haemmerle@easybreadcompany.com

#import "ViewController.h"
#import "VideoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableview.delegate = self;
    _tableview.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"nextSegue" sender:nil];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifer = @"celllist";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
    }
    //      NSString *imageName = [NSString stringWithFormat:@"list%d.png", i];
    NSString *imageName = [NSString stringWithFormat:@"list%ld.png", indexPath.row + 1];
    UIImageView *personImage = (UIImageView*)[cell viewWithTag:1];
    personImage.image = [UIImage imageNamed:imageName];
    
    
    return cell;
}

- (IBAction)nextButton:(id)sender {
    [self performSegueWithIdentifier:@"nextSegue" sender:nil];
}


@end
