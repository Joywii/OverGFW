//
//  KZRequest.h
//  Soccer
//
//  Created by robbie on 14-4-17.
//  Copyright (c) 2014年 sohu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KZRequestData.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFURLSessionManager.h"
#import "NSDictionary+BeeExtension.h"
#import "ConnectionUtils.h"


@class KZRequestState ;

typedef void(^KZRequestBlock)(KZRequestState *state);

typedef enum _KZRequestStateType
{
    KZRequestStateTypeNone = 0,
    KZRequestStateTypeFailed,
    KZRequestStateTypeSuccessed,
    KZRequestStateTypeCanceled,
}KZRequestStateType;


// 管理请求状态
@interface KZRequestState : NSObject

@property (nonatomic, strong) NSError               *error;
@property (nonatomic, strong) id                    result;
@property (nonatomic, strong) NSDictionary          *responseHeaders;
@property (nonatomic, assign) KZRequestStateType    stateType;
@property (nonatomic, assign) NSInteger stateCode;

@property (nonatomic, assign) NSInteger errorCode;
@property (nonatomic, strong) NSString *errorMsg;

-(void)reset;

@end

@protocol KZRequestDelegate ;

@interface KZRequest : NSObject

@property (nonatomic, strong) NSString                      *url;
@property (nonatomic, strong) NSString                      *httpMethod;
@property (nonatomic, strong) NSDictionary                  *params;
@property (nonatomic, strong) NSDictionary                  *dataParams;
@property (nonatomic, strong) NSDictionary                  *httpHeaderFields;
@property (nonatomic, copy)   KZRequestBlock                requestBlock;
@property (nonatomic, strong, readonly)KZRequestState       *requestState;
@property (nonatomic, assign) id<KZRequestDelegate>         delegate;


@property (nonatomic, strong) AFHTTPRequestOperationManager  *afOperationManager;
@property (nonatomic, strong) AFURLSessionManager            *afSessionManager;


- (id)initPostWithURL:(NSString *)url
                 args:(NSArray *)args
               params:(NSDictionary *)params
           dataParams:(NSDictionary *)dataParams
     httpHeaderFields:(NSDictionary *)httpHeaderFields
             delegate:(id)delegate
         requestBlock:(KZRequestBlock)block;

- (id)initWithURL:(NSString *)url
             args:(NSArray *)args
       httpMethod:(NSString *)httpMethod
           params:(NSDictionary *)params
       dataParams:(NSDictionary *)dataParams
 httpHeaderFields:(NSDictionary *)httpHeaderFields
         delegate:(id)delegate
     requestBlock:(KZRequestBlock)block ;

- (id)initPostWithURL:(NSString *)url
                 args:(NSArray *)args
               params:(NSDictionary *)params
           dataParams:(NSDictionary *)dataParams
             delegate:(id)delegate
         requestBlock:(KZRequestBlock)block;

/* 开始联网 异步 */
- (void)connect ;

/* 清理联网 */
- (void)disconnect;

- (BOOL)isExecuting;

/* override result封装为DispatchData对象*/
- (KZDispatchData *)dealWithDispatchData:(id)result;

@end

@protocol KZRequestDelegate <NSObject>

@optional
- (void)request:(KZRequest*)request didCurrentState:(KZRequestState *)state;

@end

