//
//  BGGCandleStickResult.m
//  BggExchange
//
//  Created by shiguorui on 2018/8/9.
//  Copyright © 2018年 BGG. All rights reserved.
//

#import "BGGCandleStickResult.h"

@implementation BGGCandleStickResult

+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}



#pragma mark - Data Formatter

-(void)resetChartFormatData:(NSInteger)granularity
{
    if (self.candlesticks == nil || self.candlesticks.count == 0) {
        
        [self setChatFormatData: nil];

        return;
    }
    
    NSMutableArray<CandleChartDataEntry *> *chartDataArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i <[self.candlesticks count] ;i ++)
    {
        NSArray *array  = self.candlesticks[i];
        NSString *x_ts = array[0];
//        NSDate *date = [NSDate dateWithTimeIntervalSince1970: x_ts.doubleValue];
        
        NSString *open_str = array[1];
        NSString *high_str = array[2];
        NSString *low_str = array[3];
        NSString *close_str = array[4];
//        NSString *volume_str = array[5];
        
        double timeStamp = x_ts.doubleValue;
        double open = open_str.doubleValue;
        double high = high_str.doubleValue;
        double low = low_str.doubleValue;
        double close = close_str.doubleValue;
//        double volume = volume_str.doubleValue;
        
        
        CandleChartDataEntry *chartDataEntry = [[CandleChartDataEntry alloc] initWithX: timeStamp/granularity
                                                                               shadowH: high
                                                                               shadowL: low
                                                                                  open: open
                                                                                 close: close
                                                                                  icon: nil];
        
        [chartDataArray addObject: chartDataEntry];
        
    }
    [self setChatFormatData: chartDataArray];
}


@end
