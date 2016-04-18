//
//  VideoViewController.m
//  ExerciseVideo
//
//  Created by dev on 2016. 3. 26..
//  Copyright © 2016 Symonhay M. All rights reserved.
//

#import "VideoViewController.h"
#import "MovieView.h"
#import "FRHyperLabel.h"

@interface VideoViewController (){
    IBOutlet MovieView *movieView;
    int play_flage;
    NSDictionary *videoList;
    int listNumber;
}
@property (weak, nonatomic) IBOutlet UILabel *listItem;
@property (weak, nonatomic) IBOutlet FRHyperLabel *hyperlink;
@property (weak, nonatomic) IBOutlet UIButton *playImage;
@property (weak, nonatomic) IBOutlet UILabel *secondView;
@property (weak, nonatomic) IBOutlet FRHyperLabel *userName;

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _g_listNumber = [GlobalVar getInstance];
    _g_listNumber.g_listNumber = 1;
    videoList = @{
                    @1 : @"1min",
                    @2 : @"2min",
                    @3 : @"3min",
                    @4 : @"4min",
                    @5 : @"5min",
                    @6 : @"6min",
                    @7 : @"7min",
                };
    listNumber = 1;
    play_flage = 0;
    
    FRHyperLabel *label = self.hyperlink;
    FRHyperLabel *userlabel = self.userName;
    
    NSString *string = @"click to visit on Instagram";
    NSString *usersting = @"@THE USER NAME";
    NSDictionary *attributes = @{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]};
    label.attributedText = [[NSAttributedString alloc]initWithString:string attributes:attributes];
    NSDictionary *attributes1 = @{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]};
    userlabel.attributedText = [[NSAttributedString alloc]initWithString:usersting attributes:attributes1];
    
    //Step 2: Define a selection handler block
    void(^handler)(FRHyperLabel *label, NSString *substring) = ^(FRHyperLabel *label, NSString *substring){
        if (play_flage == 1)
            play_flage = 3;
        [_playImage setBackgroundImage:[UIImage imageNamed:@"Media-Play.png"] forState:UIControlStateNormal];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://www.instagram.com/theusername/"]];
    };
    void(^userhandler)(FRHyperLabel *userlabel, NSString *substring) = ^(FRHyperLabel *label, NSString *substring){
        if (play_flage == 1)
            play_flage = 3;
        [_playImage setBackgroundImage:[UIImage imageNamed:@"Media-Play.png"] forState:UIControlStateNormal];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://www.instagram.com/theusername/"]];
    };
    
    //Step 3: Add link substrings
    [label setLinksForSubstrings:@[@"visit"] withLinkHandler:handler];
    [userlabel setLinksForSubstrings:@[@"@THE USER NAME"] withLinkHandler:userhandler];

    
//    NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:@"click to visit on Instagram"];
//    [str addAttribute: NSLinkAttributeName value: @"http://www.google.com" range: NSMakeRange(0, str.length)];
//    _hyperlink.attributedText = str;
//    _hyperlink.userInteractionEnabled = YES;
//    UITapGestureRecognizer *tapGesture =
//    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTap)];
//    [_hyperlink addGestureRecognizer:tapGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)BackButton:(id)sender {
    [movieView pauseMovie];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)play:(id)sender {
    if (play_flage == 0) {
        play_flage = 1;
        NSString* listName = [videoList objectForKey:@(_g_listNumber.g_listNumber)];
        _listItem.text = [NSString stringWithFormat:@"shows exercise %d of 7", _g_listNumber.g_listNumber];
    
        NSString* path = [[NSBundle mainBundle] pathForResource:listName ofType:@"mov"];
        NSURL *url = [NSURL fileURLWithPath:path];
        [_playImage setBackgroundImage:[UIImage imageNamed:@"Media-Pause.png"] forState:UIControlStateNormal];
    
        [movieView setLbShow:self.second];
        [movieView setList:self.listItem];
        [movieView setProgressShow:self.progress];
        [movieView playMovie:url];
    }
    else if (play_flage == 3){
        [_playImage setBackgroundImage:[UIImage imageNamed:@"Media-Pause.png"] forState:UIControlStateNormal];
        [movieView playMovie];
        play_flage = 1;
    }
    else{
        play_flage = 3;
        [_playImage setBackgroundImage:[UIImage imageNamed:@"Media-Play.png"] forState:UIControlStateNormal];
        [movieView pauseMovie];
    }
}
- (IBAction)nextPlay:(id)sender {
    listNumber++;
    if (listNumber >= 8) {
        listNumber = 1;
    }
    play_flage = 1;
    _g_listNumber.g_listNumber++;
    if (_g_listNumber.g_listNumber >= 8) {
        _g_listNumber.g_listNumber = 1;
    }
    
    NSString* listName = [videoList objectForKey:@(_g_listNumber.g_listNumber)];
    _listItem.text = [NSString stringWithFormat:@"shows exercise %d of 7", _g_listNumber.g_listNumber];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:listName ofType:@"mov"];
    NSURL *url = [NSURL fileURLWithPath:path];
    [_playImage setBackgroundImage:[UIImage imageNamed:@"Media-Pause.png"] forState:UIControlStateNormal];
    
    [movieView setLbShow:self.second];
    [movieView setList:self.listItem];
    [movieView setProgressShow:self.progress];
    [movieView playMovie:url];
}
- (IBAction)beforePlay:(id)sender {
    listNumber--;
    if (listNumber == 0) {
        listNumber = 1;
    }
    _g_listNumber.g_listNumber--;
    if (_g_listNumber.g_listNumber == 0) {
        _g_listNumber.g_listNumber = 1;
    }
    play_flage = 1;
    
    NSString* listName = [videoList objectForKey:@(_g_listNumber.g_listNumber)];
    _listItem.text = [NSString stringWithFormat:@"shows exercise %d of 7", _g_listNumber.g_listNumber];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:listName ofType:@"mov"];
    NSURL *url = [NSURL fileURLWithPath:path];
    [_playImage setBackgroundImage:[UIImage imageNamed:@"Media-Pause.png"] forState:UIControlStateNormal];
    
    [movieView setLbShow:self.second];
    [movieView setList:self.listItem];
    [movieView setProgressShow:self.progress];
    [movieView playMovie:url];
}


-(void)playFunction{
    if (play_flage == 0) {
        play_flage = 1;
        NSString* listName = [videoList objectForKey:@(_g_listNumber.g_listNumber)];
        _listItem.text = [NSString stringWithFormat:@"shows exercise %d of 7", _g_listNumber.g_listNumber];
        
        NSString* path = [[NSBundle mainBundle] pathForResource:listName ofType:@"mov"];
        NSURL *url = [NSURL fileURLWithPath:path];
        [_playImage setBackgroundImage:[UIImage imageNamed:@"Media-Pause.png"] forState:UIControlStateNormal];
        
        [movieView setLbShow:self.second];
        [movieView setProgressShow:self.progress];
        [movieView playMovie:url];
    }
    else if (play_flage == 2){
        [_playImage setBackgroundImage:[UIImage imageNamed:@"Media-Pause.png"] forState:UIControlStateNormal];
        play_flage = 1;
        [movieView playMovie];
    }
    else if (play_flage == 1){
        [_playImage setBackgroundImage:[UIImage imageNamed:@"Media-Play.png"] forState:UIControlStateNormal];
        play_flage = 2;
        [movieView pauseMovie];
    }
}

-(void)timeSetting{
    NSLog(@"for the people");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)labelTap{
    [self performSegueWithIdentifier:@"nextSegue" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([segue.identifier isEqualToString:@"webviewSegue"]) {
        

    }
}
@end
