//
//  NetworkRequestFactory.m
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 5/14/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import "NetworkRequestFactory.h"
#import "NetworkConstants.h"
#import "NetworkRequest.h"

#import "BooksSearchResponse.h"
#import "MusicSearchResponse.h"
#import "MoviesSearchResponse.h"

@implementation NetworkRequestFactory

+ (NetworkRequest *)getBookSearchRequestFor:(NSString *)searchString {

    NetworkRequest *request = [[NetworkRequest alloc] initWithUrlSuffix:URLType.search];
    [request setParamters:[NSDictionary dictionaryWithObjectsAndKeys:searchString, @"term", @"ebook", @"entity", nil]];
    [request setResponse:[[BooksSearchResponse alloc] init]];

    return request;
}

+ (NetworkRequest *)getMusicSearchRequestFor:(NSString *)searchString {

    NetworkRequest *request = [[NetworkRequest alloc] initWithUrlSuffix:URLType.search];
    [request setParamters:[NSDictionary dictionaryWithObjectsAndKeys:searchString, @"term", @"musicTrack", @"entity", nil]];
    [request setResponse:[[MusicSearchResponse alloc] init]];

    return request;
}

+ (NetworkRequest *)getMoviesSearchRequestFor:(NSString *)searchString {

    NetworkRequest *request = [[NetworkRequest alloc] initWithUrlSuffix:URLType.search];
    [request setParamters:[NSDictionary dictionaryWithObjectsAndKeys:searchString, @"term", @"movie", @"entity", nil]];
    [request setResponse:[[MoviesSearchResponse alloc] init]];

    return request;
}

@end
