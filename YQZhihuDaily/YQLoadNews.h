//
//  YQLoadNews.h
//  YQZhihuDaily
//
//  Created by 羊琪 on 16/5/13.
//  Copyright © 2016年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^callback)(id obj);
typedef void(^updateFormer)(void);

@interface YQLoadNews : NSObject

//加载最新数据
- (void)loadNewStoriesWithCallback: (callback)callback;

//刷新数据
- (void)updateNewStoriesWithCallback: (callback)callback;

//加载以前数据
- (void)loadFormerStoriesWithUpdateFormer: (updateFormer)former;




@end
