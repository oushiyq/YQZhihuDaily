//
//  YQStoriesTool.h
//  YQZhihuDaily
//
//  Created by 羊琪 on 16/5/13.
//  Copyright © 2016年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YQStoriesTool : NSObject

/** title 新闻标题 */
@property (nonatomic,copy) NSString *title;

/** images 图像地址 */
@property (nonatomic, strong) NSArray *images;

/** image  界面顶部的图片 */
@property (nonatomic, strong) NSString *image;

/** id  内容id */
@property (nonatomic, strong) NSNumber *id;

/** multipic   是否多图 */
@property (nonatomic, assign, getter=isMutipic) BOOL multipic;


@end
