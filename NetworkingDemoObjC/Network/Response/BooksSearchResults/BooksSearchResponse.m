//
//  BooksSearchResponse.m
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 5/14/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import "BooksSearchResponse.h"
#import "BooksResultsObject.h"

@implementation BooksSearchResponse

- (instancetype)init {

    if (self = [super init]) {
        self.delegate = self;
        return self;
    }

    return nil;
}

#pragma mark - NetworkResponseProtocol methods

- (id)parseDataFor:(NSData *)data {

    NSDictionary *dict = [self dictionaryForData:data];

    NSError *err = nil;
    self.booksResults = [[BooksResultsObject alloc] initWithDictionary:dict error:&err];

    return self.booksResults;
}

@end
