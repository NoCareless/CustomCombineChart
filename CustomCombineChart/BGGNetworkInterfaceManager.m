//
//  BGGNetworkInterfaceManager.m
//  CustomCombineChart
//
//  Created by qi.gao on 2018/8/15.
//  Copyright © 2018 qi.gao. All rights reserved.
//

#import "BGGNetworkInterfaceManager.h"
#import "BGGSessionManager.h"

@implementation BGGNetworkInterfaceManager

+(void)candleStickWithProductSimbol: (NSString *)productSimbol
                  andCurrencySimbol: (NSString *)currencySimbol
                       andGETParams: (NSDictionary *)params
                  completionHandler: (TaskCompletionHandler)completionHandler
{
    // 1. URL: 包括路径参数、get参数、公共参数
    NSString *fullURLStr = [BGGNetworkInterfaceManager candlesticksURLStringProductSimbol: productSimbol
                                                               andCurrencySimbol: currencySimbol];
    
    [BGGNetworkInterfaceManager getRequestWithFullURLStr: fullURLStr
                                          params: params
                               completionHandler: completionHandler];
    
}

+(NSString *)candlesticksURLStringProductSimbol: (NSString *)productSimbol
                              andCurrencySimbol: (NSString *)currencySimbol
{
    //orderID as path
    NSString *interfaceName = [[NSString alloc] initWithFormat: @"/api/candlesticks/%@/%@", productSimbol, currencySimbol];
    
    NSString *fullURLStr = [NSString stringWithFormat:@"https://bgogo.com%@",interfaceName];
    
    return fullURLStr;
    
}

+(void)getRequestWithFullURLStr: (NSString *)fullURLStr
                         params: (NSDictionary *)params
              completionHandler: (TaskCompletionHandler)completionHandler
{
    //check info
    if (params == nil)              return;
    if (completionHandler == nil)   return;
    
    NSError *error = nil;
    // GET
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod: @"GET"
                                                  URLString: fullURLStr
                                                 parameters: params
                                                      error: &error];
    

    //3.headers
    [request setValue: @"application/json" forHTTPHeaderField: @"Content-Type"];
    [request setValue: @"application/json" forHTTPHeaderField: @"Accept"];
    

    AFHTTPSessionManager *manager = [BGGSessionManager bggHTTPSessionManager];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress: nil downloadProgress: nil completionHandler: ^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        completionHandler(responseObject, nil);
    }];
    
    [dataTask resume];
}


@end
