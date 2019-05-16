//
//  MoviesResultsObject.m
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 5/14/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import "MoviesResultsObject.h"
#import "MovieObject.h"

@implementation MoviesResultsObject

- (instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing _Nullable *_Nullable)err {

    return [super initWithDictionary:dict error:err];
}

+ (JSONKeyMapper *)keyMapper {

    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"moviesResults": @"results" }];
}

@end
