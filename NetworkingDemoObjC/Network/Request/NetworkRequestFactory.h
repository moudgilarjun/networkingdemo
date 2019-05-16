//
//  NetworkRequestFactory.h
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 5/14/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NetworkRequest;

@interface NetworkRequestFactory : NSObject

+ (NetworkRequest *)getBookSearchRequestFor:(NSString *)searchString;
+ (NetworkRequest *)getMusicSearchRequestFor:(NSString *)searchString;
+ (NetworkRequest *)getMoviesSearchRequestFor:(NSString *)searchString;

@end

