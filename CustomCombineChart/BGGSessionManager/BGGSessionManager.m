//
//  BGGSessionManager.m
//  BggExchange
//
//  Created by shiguorui on 2018/6/27.
//  Copyright © 2018年 BGG. All rights reserved.
//

#import "BGGSessionManager.h"

@interface BGGSessionManager ()

@property (nonatomic, strong) AFHTTPSessionManager *afHTTPSessionManager;

@property (nonatomic, strong) AFURLSessionManager *afURLSessionManager;

@end



@implementation BGGSessionManager

static BGGSessionManager *theBGGSessionManager = nil;

+ (id)sharedSessionManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        theBGGSessionManager = [[BGGSessionManager alloc] init];
        
    });
    
    return theBGGSessionManager;
}

+(AFHTTPSessionManager *)bggHTTPSessionManager
{
    return [[BGGSessionManager sharedSessionManager] afHTTPSessionManager];
    
}



#pragma mark - Getter

- (AFHTTPSessionManager *)afHTTPSessionManager
{
    if (_afHTTPSessionManager == nil)
    {
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        _afHTTPSessionManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:sessionConfig];
        
        AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
        _afHTTPSessionManager.responseSerializer = responseSerializer;
        _afHTTPSessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
        
    }
    
    return _afHTTPSessionManager;
}


@end
