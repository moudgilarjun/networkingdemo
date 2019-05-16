//
//  NetworkRequest.h
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 4/29/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NetworkResponse;

@interface NetworkRequest : NSObject

@property (nonatomic, getter=getUrl) NSURL *url;
@property (nonatomic, getter=getRequest) NSURLRequest *request;
@property (nonatomic) NetworkResponse *response;
@property (nonatomic) NSDictionary *paramters;

- (id)initWithUrlSuffix:(NSString *)urlSuffix;

- (void)successWithData:(NSData *)data;
- (void)failureWithError:(NSError *)error;

@end
