//
//  TopicManagementDelegat.h
//  BaerchenImmobilien
//
//  Created by Yixiang Chen on 10/28/14.
//  Copyright (c) 2014 App Chen. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol TopicManagementDelegat <NSObject>
@optional
-(void) addTopic:(NSDictionary *)topic ;
-(void) updateTopic:(NSDictionary *)topic atIndex:(int) index;
-(void) showSelectedTopic:(NSDictionary *) topic atSelectedIndex:(int) index;
@end
