//
//  Topic.h
//  BaerchenImmobilien
//
//  Created by Yixiang Chen on 10/28/14.
//  Copyright (c) 2014 App Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Topic : NSManagedObject

@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSNumber * isForRent;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * content;

@end
