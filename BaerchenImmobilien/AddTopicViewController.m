//
//  AddTopicViewController.m
//  BaerchenImmobilien
//
//  Created by Yixiang Chen on 10/27/14.
//  Copyright (c) 2014 App Chen. All rights reserved.
//

#import "AddTopicViewController.h"
#import <CoreData/CoreData.h>
#import "Topic.h"
#import "AppDelegate.h"

@interface AddTopicViewController ()

@end

@implementation AddTopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]);
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

- (IBAction)cancelButtonPressed:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)saveButtonPressed:(id)sender {
//    NSLog(@"%@",NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]);
//    
//    UIApplication *app = [UIApplication sharedApplication];
//    AppDelegate * delegate = app.delegate;
//    NSManagedObjectContext * context = delegate.managedObjectContext;
//    Topic *topic = [NSEntityDescription insertNewObjectForEntityForName:@"Topic" inManagedObjectContext:context];
//    topic.title = self.txtTitle.text;
//    topic.author = @"Kevin Chan";
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
//    topic.date = [dateFormatter stringFromDate:[NSDate date ]];
//    topic.city = @"Stuttgart";
//    topic.isForRent = [[NSNumber alloc] initWithInt:1];
//    
//    
//    NSError *error = nil;
//    [context save:&error];
//    if (error != nil) {
//        NSLog(@"Failed !! %@",error);
//    } else {
//        NSLog(@"Successful!!");
//        [self.navigationController popViewControllerAnimated:YES];
    
//    }
    NSDictionary *topicInfo = @{
                                @"title":self.txtTitle.text,
                                @"author":self.txtAuthor.text,
                                @"date":self.txtDate.text,
                                @"city":self.txtCity.text,
                                @"content":self.content.text
                                };
    [self.delegate addTopic:topicInfo];
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
