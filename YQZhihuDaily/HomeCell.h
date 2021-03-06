//
//  HomeCell.h
//  WBZhiHuDailyPaper
//
//  Created by caowenbo on 15/12/19.
//  Copyright © 2015年 曹文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StoryModel,HomeCell,YQStoriesTool;

@protocol HomeCellDelegate <NSObject>

@optional

- (UIViewController *)getViewControllerWithId:(NSNumber *)storyId;

@end

@interface HomeCell : UITableViewCell//<UIViewControllerPreviewingDelegate>

@property (nonatomic, strong) YQStoriesTool *YQStoriesTool;

@property (nonatomic, strong) id <HomeCellDelegate>delegate;

@end
