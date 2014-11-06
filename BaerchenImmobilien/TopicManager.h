//
//  TopicManager.h
//  BaerchenImmobilien
//
//  Created by Yixiang Chen on 10/27/14.
//  Copyright (c) 2014 App Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>
#import "Topic.h"

@interface TopicManager : NSObject
@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong,nonatomic) NSMutableArray *topics;
-(void) fetchAllTopics;

-(void)addTopic: (NSDictionary *) topic;
-(void)deleteTopic:(NSDictionary *) topic;
-(void)updateTopic;
-(void)selectTopic:(NSDictionary *) topic atIndex:(int) index;
@end
