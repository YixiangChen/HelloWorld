//
//  TopicManager.m
//  BaerchenImmobilien
//
//  Created by Yixiang Chen on 10/27/14.
//  Copyright (c) 2014 App Chen. All rights reserved.
//

#import "TopicManager.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@implementation TopicManager


-(id) init {
    if (self == [super init]) {
        id delegate = [UIApplication sharedApplication].delegate;
        self->_context = [delegate valueForKey:@"managedObjectContext"];
    }
    return  self;
}
-(void)fetchAllTopics {
    AppDelegate * delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext * context = delegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Topic"];
    NSError *error = nil;
    self.topics = [[NSMutableArray alloc] initWithCapacity:10];
    self.topics = [[context executeFetchRequest:request error:&error] mutableCopy];
    
}

-(void)addTopic: (NSDictionary *) topic {
    
    Topic *newTopic = [NSEntityDescription insertNewObjectForEntityForName:@"Topic" inManagedObjectContext:self.context];
    
    newTopic.title = topic[@"title"];
    newTopic.content = topic[@"content"];
    newTopic.author = topic[@"author"];
    newTopic.date = topic[@"date"];
    newTopic.city = topic[@"city"];
    
    [self.context save:nil];
    
}
-(void)deleteTopic:(Topic *) topic {
    [self.context deleteObject:topic];
    [self.context save:nil];
    
}
-(void)updateTopic {
    [self.context save:nil];
}

-(void)selectTopic:(NSDictionary *) topic atIndex:(int) index {
    
}

@end
