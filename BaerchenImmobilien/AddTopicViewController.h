//
//  AddTopicViewController.h
//  BaerchenImmobilien
//
//  Created by Yixiang Chen on 10/27/14.
//  Copyright (c) 2014 App Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicTableViewController.h"
#import "TopicManagementDelegat.h"

@interface AddTopicViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtTitle;
@property (strong, nonatomic) IBOutlet UITextField *content;
@property (strong, nonatomic) IBOutlet UITextField *txtCity;
@property (strong, nonatomic) IBOutlet UITextField *txtAuthor;
@property (strong, nonatomic) IBOutlet UITextField *txtDate;

@property (weak, nonatomic) TopicTableViewController *topicViewController;
@property (weak, nonatomic) id <TopicManagementDelegat>delegate;
- (IBAction)cancelButtonPressed:(id)sender;

- (IBAction)saveButtonPressed:(id)sender;
@end
