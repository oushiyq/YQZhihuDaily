//
//  YQLoadNews.m
//  YQZhihuDaily
//
//  Created by 羊琪 on 16/5/13.
//  Copyright © 2016年 user. All rights reserved.
//

#import "YQLoadNews.h"
#import "YQHttpTool.h"
#import "YQSessionTool.h"
#import <objc/runtime.h>
@interface YQLoadNews()

@property (assign, nonatomic, getter=isloaded) BOOL loaded;
@property (strong, nonatomic) NSMutableArray *contents;


@end



@implementation YQLoadNews


//加载最新数据
- (void)loadNewStoriesWithCallback: (callback)callback{
    [YQHttpTool get:@"http://news-at.zhihu.com/api/4/news/latest" parameters:nil success:^(id json){
        YQSessionTool *session = [YQSessionTool mj_objectWithKeyValues:json];
        [self.contents addObject:session];
        objc_setAssociatedObject([self class], @selector(contents), session.date, OBJC_ASSOCIATION_COPY_NONATOMIC);
        callback(self.contents);
        
    } failure:^(NSError *error) {
        nil;
    }];
}

- (NSMutableArray *)contents{
    if (!_contents) {
        _contents = [NSMutableArray array];
    }
    return _contents;
}


//刷新数据
- (void)updateNewStoriesWithCallback: (callback)callback{

}


//加载以前数据
- (void)loadFormerStoriesWithUpdateFormer: (updateFormer)updateFormer{
    id date = objc_getAssociatedObject([self class], @selector(contents));
    if (self.isloaded) {
        return;
    }
    self.loaded = !self.isloaded;
    NSString *url = [NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/news/before/%@",date];
    [YQHttpTool get:url parameters:nil success:^(id JSON) {
        YQSessionTool *session = [YQSessionTool mj_objectWithKeyValues:JSON];
        [self.contents addObject:session];
        objc_setAssociatedObject([self class], @selector(contents), session.date, OBJC_ASSOCIATION_COPY_NONATOMIC);
        updateFormer();
        self.loaded = !self.isloaded;
    } failure:^(NSError *error) {
        nil;
    }];
    
}

@end
