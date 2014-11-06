//
//  TopicTableViewController.h
//  BaerchenImmobilien
//
//  Created by Yixiang Chen on 10/27/14.
//  Copyright (c) 2014 App Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "TopicManager.h"
#import "TopicManagementDelegat.h"


@interface TopicTableViewController : UITableViewController <NSFetchedResultsControllerDelegate,TopicManagementDelegat, UIActionSheetDelegate>
@property (strong,nonatomic) NSFetchedResultsController *fetchResultsController;
@property (strong, nonatomic) NSMutableArray *topics;
@property (strong,nonatomic) TopicManager *topicManager;
- (IBAction)addBarButtonPressed:(id)sender;
@end
