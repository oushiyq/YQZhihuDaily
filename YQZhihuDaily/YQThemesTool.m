//
//  YQThemesTool.m
//  YQZhihuDaily
//
//  Created by 羊琪 on 16/5/9.
//  Copyright © 2016年 user. All rights reserved.
//

#import "YQThemesTool.h"

@implementation YQThemesTool

+ (void)getThemesWithSuccessfulBlock:(SuccessfulBlock )block{
    [YQHttpTool get:@"http://news-at.zhihu.com/api/4/themes" parameters:nil success:^(id JSON) {
        NSArray *array = [NSArray array];
        array = [Theme mj_objectArrayWithKeyValuesArray: JSON[@"others"]];
        block(array);
    } failure:^(NSError *error) {
        nil;
    }];
}



@end
