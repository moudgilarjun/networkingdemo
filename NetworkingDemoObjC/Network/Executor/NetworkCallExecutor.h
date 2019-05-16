//
//  NetworkCallExecutor.h
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 5/14/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkCallExecutor : NSObject

+ (void)executeCallWithRequest:(NSURLRequest *)request success:(void (^)(NSData *data))success failure:(void (^)(NSError *error))failure;

@end
