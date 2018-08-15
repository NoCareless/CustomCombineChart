//
//  BGGCandleStickResult.h
//  BggExchange
//
//  Created by shiguorui on 2018/8/9.
//  Copyright © 2018年 BGG. All rights reserved.
//

#import <Charts/Charts-Swift.h>
@import JSONModel;


@interface BGGCandleStickResult :JSONModel

@property(nonatomic, strong) NSArray<NSArray *> *candlesticks;

@property(nonatomic, strong) NSArray<CandleChartDataEntry *> *chatFormatData;

#pragma mark - Data Formatter


/**
 请求下来数据直接调用一次，将格式转换为 FormatData
 */
-(void)resetChartFormatData:(NSInteger)granularity;

@end
