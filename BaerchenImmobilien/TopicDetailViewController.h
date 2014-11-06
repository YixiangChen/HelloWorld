//
//  TopicDetailViewController.h
//  BaerchenImmobilien
//
//  Created by Yixiang Chen on 10/29/14.
//  Copyright (c) 2014 App Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicManagementDelegat.h"
#import "Topic.h"

@interface TopicDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lblTtitle;
@property (strong, nonatomic) IBOutlet UILabel *lblDate;
@property (strong, nonatomic) IBOutlet UILabel *lblNumberOfLikes;
@property (strong, nonatomic) IBOutlet UILabel *lblContent;

@property (weak, nonatomic) id <TopicManagementDelegat>delegate;
@property (strong, nonatomic) Topic *topic;
- (IBAction)contactButtonPressed:(id)sender;
- (IBAction)likeButtonPressed:(id)sender;

@end
