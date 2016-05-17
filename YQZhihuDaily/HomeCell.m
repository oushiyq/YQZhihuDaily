//
//  HomeCell.m
//  WBZhiHuDailyPaper
//
//  Created by caowenbo on 15/12/19.
//  Copyright © 2015年 曹文博. All rights reserved.
//

#import "HomeCell.h"
#import "YQStoriesTool.h"
#import "UIImageView+WebCache.h"

@interface HomeCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UIImageView *multipicImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelConstraint;

@end

@implementation HomeCell

- (void)setYQStoriesTool:(YQStoriesTool *)YQStoriesTool{
    _YQStoriesTool = YQStoriesTool;
    
    self.titleLabel.text = YQStoriesTool.title;
    
    NSURL *url = [NSURL URLWithString:YQStoriesTool.images[0]];
    
    if (url) {
        self.titleLabelConstraint.constant = 15;
        self.iconImageView.hidden = NO;
        
        [self.iconImageView
         sd_setImageWithURL:[NSURL URLWithString:YQStoriesTool.images[0]]
         placeholderImage:[UIImage imageNamed:@"News_Avatar"]];
        
    }else{
        self.titleLabelConstraint.constant = -70;
        self.iconImageView.hidden = YES;
    }
    
    self.multipicImageView.hidden = !YQStoriesTool.isMutipic;
    
}




@end
