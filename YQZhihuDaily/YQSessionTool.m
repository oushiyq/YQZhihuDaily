//
//  YQSessionTool.m
//  YQZhihuDaily
//
//  Created by 羊琪 on 16/5/13.
//  Copyright © 2016年 user. All rights reserved.
//

#import "YQSessionTool.h"
#import "YQStoriesTool.h"

@implementation YQSessionTool

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"stories" : [YQStoriesTool class],
             @"top_stories" : [YQStoriesTool class],
             };
}


@end
