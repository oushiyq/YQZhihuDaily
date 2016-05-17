//
//  YQHttpTool.m
//  YQZhihuDaily
//
//  Created by 羊琪 on 16/5/9.
//  Copyright © 2016年 user. All rights reserved.
//

#import "YQHttpTool.h"

@implementation YQHttpTool

+(void)get:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(id JSON))success failure:(void(^)(NSError * error))failure{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * task, id responseObject) {
        if (success) {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            failure(error);
        }
    }];
    
}

@end
