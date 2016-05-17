//
//  YQSessionTool.h
//  YQZhihuDaily
//
//  Created by 羊琪 on 16/5/13.
//  Copyright © 2016年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YQSessionTool : NSObject

/** date 日期 */
@property (nonatomic, copy) NSString *date;

/** stories  当日新闻*/
@property (nonatomic, strong) NSArray *stories;

/** top_stories  顶部新闻*/
@property (nonatomic, strong) NSArray *top_stories;


@end
