//
//  NetworkCallExecutor.m
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 5/14/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import "NetworkCallExecutor.h"

@implementation NetworkCallExecutor

+ (void)executeCallWithRequest:(NSURLRequest *)request success:(void (^)(NSData *data))success failure:(void (^)(NSError *error))failure {

    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;

        if (httpResponse.statusCode == 200) {
            if (success) {
                success(data);
            }
        } else {
            if (failure) {
                failure(error);
            }
        }
    }];
    
    [dataTask resume];
}

@end
