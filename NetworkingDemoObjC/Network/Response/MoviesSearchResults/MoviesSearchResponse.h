//
//  MoviesSearchResponse.h
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 5/14/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import "NetworkResponse.h"

@class MoviesResultsObject;

@interface MoviesSearchResponse : NetworkResponse <NetworkResponseProtocol>

@property (nonatomic) MoviesResultsObject *moviesResults;

- (instancetype)init;

@end
