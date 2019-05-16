//
//  BookObject.m
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 4/29/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import "BookObject.h"

@implementation BookObject

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
