//
//  TopicTableViewCell.h
//  BaerchenImmobilien
//
//  Created by Yixiang Chen on 10/27/14.
//  Copyright (c) 2014 App Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblAuthor;
@property (strong, nonatomic) IBOutlet UILabel *lblDate;

@end
