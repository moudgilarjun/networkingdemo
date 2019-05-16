//
//  MusicObject.m
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 5/14/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import "MusicObject.h"

@implementation MusicObject

- (nonnull instancetype)initWithDictionary:(nonnull NSDictionary *)dict error:(NSError *__autoreleasing _Nullable *_Nullable)err {

    return [super initWithDictionary:dict error:err];
}

+ (JSONKeyMapper *)keyMapper {

    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"artworkUrl100": @"artworkUrl100",
                                                                   @"artistName": @"artistName",
                                                                   @"trackName": @"trackName",
                                                                   }];
}

@end
