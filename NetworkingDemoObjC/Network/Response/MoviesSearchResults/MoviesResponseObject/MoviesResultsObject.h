//
//  MoviesResultsObject.h
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 5/14/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "MovieObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface MoviesResultsObject : JSONModel

- (instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing _Nullable *_Nullable)err;

@property (nonatomic) NSArray <MovieObject> *moviesResults;

@end

NS_ASSUME_NONNULL_END
