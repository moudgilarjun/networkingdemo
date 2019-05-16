//
//  BooksResultsObject.m
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 4/29/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import "BooksResultsObject.h"
#import "BookObject.h"

@implementation BooksResultsObject

- (instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing _Nullable *_Nullable)err {

    return [super initWithDictionary:dict error:err];
}

+ (JSONKeyMapper *)keyMapper {
    
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"booksResults": @"results" }];
}

@end
