//
//  KZRequest.m
//  Soccer
//
//  Created by robbie on 14-4-17.
//  Copyright (c) 2014年 sohu. All rights reserved.
//

#import "KZRequest.h"

@interface KZRequest()

@property(strong,nonatomic)AFHTTPRequestOperation *httpRequestOperation ;

@end

@implementation KZRequest


-(void)dealloc
{
    
}
- (id)initWithURL:(NSString *)url
             args:(NSArray *)args
       httpMethod:(NSString *)httpMethod
           params:(NSDictionary *)params
       dataParams:(NSDictionary *)dataParams
 httpHeaderFields:(NSDictionary *)httpHeaderFields
         delegate:(id)delegate
     requestBlock:(KZRequestBlock)block
{
    self = [super init] ;
    if(self)
    {
        self.url = [ConnectionUtils stringWithUrl:url andArgs:args];
        self.httpMethod = httpMethod;
        self.params = params;
        self.httpHeaderFields = httpHeaderFields;
        self.requestBlock = block;
        self.dataParams = dataParams;
        self.delegate = delegate;
        
        _afOperationManager = [AFHTTPRequestOperationManager manager];
        _afOperationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        _requestState = [[KZRequestState alloc] init];
    }
    return self ;
}

- (id)initPostWithURL:(NSString *)url
                 args:(NSArray *)args
               params:(NSDictionary *)params
           dataParams:(NSDictionary *)dataParams
     httpHeaderFields:(NSDictionary *)httpHeaderFields
             delegate:(id)delegate
         requestBlock:(KZRequestBlock)block
{
    return [self initWithURL:url
                        args:args
                  httpMethod:@"POST"
                      params:params
                  dataParams:dataParams
            httpHeaderFields:httpHeaderFields
                    delegate:delegate
                requestBlock:block];
}

- (id)initPostWithURL:(NSString *)url
                 args:(NSArray *)args
               params:(NSDictionary *)params
           dataParams:(NSDictionary *)dataParams
             delegate:(id)delegate
         requestBlock:(KZRequestBlock)block
{
    
    NSMutableDictionary *httpHeaderFields = [NSMutableDictionary dictionary] ;
    
    return [self initPostWithURL:url
                            args:args
                          params:params
                      dataParams:dataParams
                httpHeaderFields:httpHeaderFields
                        delegate:delegate
                    requestBlock:block] ;
    
}

/* 开始联网 异步 */
- (void)connect
{
    [_requestState reset];
    
    NSString *urlString = [ConnectionUtils serializeURL:_url
                                                 params:_params
                                             httpMethod:_httpMethod];
    NSLog(@"_params %@",_params);
    NSLog(@"urlString %@",urlString);

    //Header
    for(id key in self.httpHeaderFields.allKeys)
    {
        [_afOperationManager.requestSerializer setValue:[self.httpHeaderFields objectForKey:key]
                                     forHTTPHeaderField:key];
    }
    //Success
    void (^successBlock)(AFHTTPRequestOperation *operation, id responseObject) = ^(AFHTTPRequestOperation *operation, id responseObject)
    {
        [self cuccessWithAFHTTPRequestOperation:operation responseObject:responseObject];
    };
    //Failture
    void (^failureBlock)(AFHTTPRequestOperation *operation, NSError *error) = ^(AFHTTPRequestOperation *operation, NSError *error)
    {
        [self failedWithOperation:operation Error:error];
    };
    if ([_httpMethod isEqualToString:@"POST"])
    {
        void (^constructBlock)(id<AFMultipartFormData> formData) = ^(id<AFMultipartFormData> formData)
        {
            if(_dataParams)
            {
                for(int i = 0 ; i < [self.dataParams.allKeys count] ; i++)
                {
                    [formData appendPartWithFileData:[_dataParams objectForKey:_dataParams.allKeys[i]]
                                                name:@"img"
                                            fileName:@"img.jpg"
                                            mimeType:@"image/jpeg"];
                }
            }
        };
        self.httpRequestOperation = [_afOperationManager POST:urlString
                                                   parameters:_params
                                    constructingBodyWithBlock:constructBlock
                                                      success:successBlock
                                                      failure:failureBlock];
    }
    else if([_httpMethod isEqualToString:@"PUT"])
    {
        self.httpRequestOperation =[_afOperationManager PUT:urlString
                                                 parameters:_params
                                                    success:successBlock
                                                    failure:failureBlock];
        
    }
    else if([_httpMethod isEqualToString:@"DELETE"])
    {
        self.httpRequestOperation =[_afOperationManager DELETE:urlString
                                                    parameters:_params
                                                       success:successBlock
                                                       failure:failureBlock];
    }
    else//GET
    {
        self.httpRequestOperation =[_afOperationManager GET:urlString
                                                 parameters:_params
                                                    success:successBlock
                                                    failure:failureBlock];
    }
    
}

// 回调代理或者block
-(void)callbackDelegateAndBlock
{
    if (self.requestBlock) {
        self.requestBlock(self.requestState);
    }
}

/* 清理联网 */
- (void)disconnect
{
    _requestState.stateType = KZRequestStateTypeCanceled;
    [self.httpRequestOperation cancel];
    [self callbackDelegateAndBlock];
}

-(BOOL)isExecuting
{
    if(_httpRequestOperation){
        return [_httpRequestOperation isExecuting];
    }
    return NO ;
}

/* override result封装为DispatchData对象*/
- (KZDispatchData *)dealWithDispatchData:(id)result
{
    return [[KZDispatchData alloc]init];
}

-(void)cuccessWithAFHTTPRequestOperation:(AFHTTPRequestOperation *)operation responseObject:(id)responseObject
{
    id responseResult = nil ;
    if([responseObject isKindOfClass:[NSData class]]){
        NSError *jsonerror = nil;
        responseResult= [NSJSONSerialization JSONObjectWithData:responseObject
                                                        options:NSJSONReadingMutableLeaves
                                                          error:&jsonerror];
        if(jsonerror) {
            _requestState.errorCode = -1000;
            _requestState.errorMsg = @"JSON 解析错误";
            responseResult = nil;
        } else {
            
        }
    } else {
        responseResult = responseObject;
    }
    KZDispatchData *dispatchData = [self dealWithDispatchData:responseResult];
    _requestState.result = dispatchData;
    _requestState.stateType = KZRequestStateTypeSuccessed;
    NSLog(@"operation.response.statusCode %ld",(long)operation.response.statusCode);
    [self callbackDelegateAndBlock];
}

- (void)failedWithOperation:(AFHTTPRequestOperation *)operation Error:(NSError *)error
{
    _requestState.stateType = KZRequestStateTypeFailed;
    _requestState.stateCode = operation.response.statusCode;
    NSLog(@"connection...error = %@",error) ;
    _requestState.error = error;
    
    NSDictionary *responseResult = nil;
    if([operation.responseObject isKindOfClass:[NSData class]]) {
        NSError *jsonerror = nil;
        responseResult= [NSJSONSerialization JSONObjectWithData:operation.responseObject
                                                        options:NSJSONReadingMutableLeaves
                                                          error:&jsonerror];
        NSLog(@"responseResult error%@",responseResult);
        if (jsonerror) {
            _requestState.errorCode = -1000;
            _requestState.errorMsg = @"JSON 解析错误";
        }
    }
    [self callbackDelegateAndBlock];
}
@end

@implementation KZRequestState

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    
}


-(void)reset
{
    self.error = nil;
    self.result = nil;
    _stateType = KZRequestStateTypeNone;
}

-(id)init
{
    if (self = [super init])
    {
        [self reset];
    }
    return self;
}

-(void)setResult:(id)result
{
    if (result)
    {
        _stateType = KZRequestStateTypeSuccessed;
        
        if (_result != result)
        {
            _result = result ;
        }
    }
}


-(void)setError:(NSError *)error
{
    if (error)
    {
        if (_error != error)
        {
            _error = error ;
        }
    }
}

@end
