//
//  YQThemesTool.h
//  YQZhihuDaily
//
//  Created by 羊琪 on 16/5/9.
//  Copyright © 2016年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Theme.h"


typedef void(^SuccessfulBlock)(id obj);

@interface YQThemesTool : NSObject


+ (void)getThemesWithSuccessfulBlock:(SuccessfulBlock )block;



@end
