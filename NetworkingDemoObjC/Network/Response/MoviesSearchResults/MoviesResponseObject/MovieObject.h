//
//  MovieObject.h
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 5/14/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MovieObject;

@interface MovieObject : JSONModel

@property (nonatomic) NSURL <Optional> *artworkUrl100;
@property (nonatomic) NSString <Optional> *artistName;
@property (nonatomic) NSString <Optional> *trackName;

- (instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing _Nullable *_Nullable)err;

@end

NS_ASSUME_NONNULL_END
