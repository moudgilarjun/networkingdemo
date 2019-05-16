//
//  NetworkRequest.m
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 4/29/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import "NetworkRequest.h"
#import "NetworkConstants.h"
#import "NetworkResponse.h"

@interface NetworkRequest()

@property (nonatomic) NSString *urlSuffix;

@end

@implementation NetworkRequest

- (id)initWithUrlSuffix:(NSString *)urlSuffix {

    if (self = [super init]) {
        _urlSuffix = urlSuffix;
        return self;
    }

    return nil;
}

#pragma mark - Getter methods

- (NSURL *)getUrl {

    NSMutableString *urlString = [[NSMutableString alloc] initWithString:baseURL];
    [urlString appendString:self.urlSuffix];

    if (self.paramters.count != 0) {

        bool firstElement = YES;

        for (NSString *key in self.paramters.allKeys) {
            NSString *value = self.paramters[key];

            if (!firstElement) {
                [urlString appendString:@"&"];
            } else {
                firstElement = NO;
            }

            [urlString appendString:[NSString stringWithFormat:@"%@=%@", key, value]];
        }
    }

    _url = [NSURL URLWithString:[urlString stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet]];
    
    return _url;
    
}

- (NSURLRequest *)getRequest {

    _request = [[NSURLRequest alloc] initWithURL:[self getUrl]];

    return _request;
}

- (void)successWithData:(NSData *)data {

    [self.response.delegate parseDataFor:data];
}

- (void)failureWithError:(NSError *)error {
    
    NSLog(@"Called failed, error: %@", error);
}

@end
