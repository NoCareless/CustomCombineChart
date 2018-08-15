//
//  BGGNetworkInterfaceManager.h
//  CustomCombineChart
//
//  Created by qi.gao on 2018/8/15.
//  Copyright © 2018 qi.gao. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^TaskCompletionHandler)(id _Nullable responseObject, NSError *_Nullable error);
@interface BGGNetworkInterfaceManager : NSObject


/*
 *  Candle Sticks Data
 */
+(void)candleStickWithProductSimbol: (NSString *)productSimbol
                  andCurrencySimbol: (NSString *)currencySimbol
                       andGETParams: (NSDictionary *)params
                  completionHandler: (TaskCompletionHandler)completionHandler;

+(NSString *)candlesticksURLStringProductSimbol: (NSString *)productSimbol
                              andCurrencySimbol: (NSString *)currencySimbol;

@end
