//
//  KLineView.m
//  CustomCombineChart
//
//  Created by qi.gao on 2018/8/15.
//  Copyright © 2018 qi.gao. All rights reserved.
//

#import "KLineView.h"
#import "CustomCombineChart-Swift.h"


@interface KLineView()

@property(nonatomic, strong)CustomCombineChart *priceChart;
@property(nonatomic, strong)CustomCombineChart *valumeChart;



@end



@implementation KLineView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    
    return self;
}

-(void)setupUI
{
    
}



@end
