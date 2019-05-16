//
//  MusicSearchResponse.h
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 5/14/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import "NetworkResponse.h"

@class MusicResultsObject;

@interface MusicSearchResponse : NetworkResponse <NetworkResponseProtocol>

@property (nonatomic) MusicResultsObject *musicResults;

- (instancetype)init;

@end
