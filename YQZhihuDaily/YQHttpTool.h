//
//  YQHttpTool.h
//  YQZhihuDaily
//
//  Created by 羊琪 on 16/5/9.
//  Copyright © 2016年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YQHttpTool : NSObject

+(void)get:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(id JSON))success failure:(void(^)(NSError * error))failure;
@end
