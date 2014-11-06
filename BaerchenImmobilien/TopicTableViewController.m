//
//  TopicTableViewController.m
//  BaerchenImmobilien
//
//  Created by Yixiang Chen on 10/27/14.
//  Copyright (c) 2014 App Chen. All rights reserved.
//

#import "TopicTableViewController.h"
#import "TopicManager.h"
#import "TopicTableViewCell.h"
#import "Topic.h"
#import "AddTopicViewController.h"
#import "TopicDetailViewController.h"

@interface TopicTableViewController ()

@end

@implementation TopicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"Forum";
    
    TopicManager *topicManager = [TopicManager new];
    self.topicManager = topicManager;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Topic"];
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES];
    request.sortDescriptors = @[descriptor];
    self.fetchResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.topicManager.context sectionNameKeyPath:@"City" cacheName:@"Topic"];
    self.fetchResultsController.delegate = self;
    [self.fetchResultsController performFetch:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return self.fetchResultsController.sections.count;
    //return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    //return self.topicManager.topics.count;
    //return self.fetchResultsController.sections.count;
    
    if ([[self.fetchResultsController sections] count] > 0) {
        id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchResultsController sections] objectAtIndex:section];
        return [sectionInfo numberOfObjects];
    } else
        return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    Topic *topic = [self.fetchResultsController objectAtIndexPath:indexPath];
    //topic = self.topicManager.topics[indexPath.row];
    cell.lblTitle.text = topic.title;
    cell.lblAuthor.text = topic.author;
    cell.lblDate.text = topic.date;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"addTopic"]) {
        AddTopicViewController *add = segue.destinationViewController;
        add.delegate = self;

    } else if ([segue.identifier isEqualToString:@"showTopicDetail"]) {
        TopicDetailViewController *topicDetail = segue.destinationViewController;
        topicDetail.delegate = self;
        NSIndexPath * indexPath = [self.tableView indexPathForCell:sender];
        Topic * topic = [self.fetchResultsController objectAtIndexPath:indexPath];
        topicDetail.topic = topic;
    }
}

#pragma mark - NSFetchedResultsControllerDelegate Methods
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
            

        default:
            break;
    }
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [tableView reloadRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

#pragma mark - TopicManagementDelegate
-(void) addTopic:(NSDictionary *)topic {
    [self.topicManager addTopic:topic];
    NSLog(@"%@",topic);
}

-(void)updateTopic:(Topic *)topic atIndex:(int)index {
    
}

-(void)showSelectedTopic:(NSDictionary *)topic atSelectedIndex:(int)index {
    
}

- (IBAction)addBarButtonPressed:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Filter",@"Add Topic", nil];
    [actionSheet showInView:self.view];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
        {
            NSLog(@"Filter button is clicked");
            break;
        }
        case 1:
        {
            NSLog(@"Add Topic button is clicked");
            [self performSegueWithIdentifier:@"addTopic" sender:self];
            break;
        }
        case 2:
            NSLog(@"Cancel is clicked");
            break;
        default:
            break;
    }
}


@end
