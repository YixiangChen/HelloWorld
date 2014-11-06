//
//  TopicDetailViewController.m
//  BaerchenImmobilien
//
//  Created by Yixiang Chen on 10/29/14.
//  Copyright (c) 2014 App Chen. All rights reserved.
//

#import "TopicDetailViewController.h"

@interface TopicDetailViewController ()

@end

@implementation TopicDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.lblTtitle.text = self.topic.title;
    self.lblNumberOfLikes.text = @"100";
    self.lblDate.text = self.topic.date;
    self.lblContent.text = self.topic.content;
    NSLog(@"%@",NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]);
    NSLog(@"%@",self.topic.content);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)contactButtonPressed:(id)sender {
}

- (IBAction)likeButtonPressed:(id)sender {
}
@end
