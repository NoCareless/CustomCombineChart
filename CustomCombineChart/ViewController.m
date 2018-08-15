//
//  ViewController.m
//  CustomCombineChart
//
//  Created by qi.gao on 2018/8/15.
//  Copyright © 2018 qi.gao. All rights reserved.
//

#import "ViewController.h"

#import "BGGNetworkInterfaceManager.h"

#import "BGGCandleStickResult.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self requestCandleData];
}

-(void)requestCandleData
{
    [BGGNetworkInterfaceManager candleStickWithProductSimbol:@"ETH"
                                           andCurrencySimbol:@"BTC"
                                                andGETParams:@{
                                                               @"zoom":@"24hr",
                                                               @"candlestick":@"1hr"
                                                               }
                                           completionHandler:^(id  _Nullable responseObject, NSError * _Nullable error) {
                                               
                                               BGGCandleStickResult *result = [[BGGCandleStickResult alloc] initWithDictionary:responseObject error:nil];
                                               
                                               [result resetChartFormatData:3600];
                                               
                                               NSLog(@"%@",result);
                                               
                                           }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
