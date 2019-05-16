//
//  BooksSearchResponse.h
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 5/14/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import "NetworkResponse.h"

@class BooksResultsObject;

@interface BooksSearchResponse : NetworkResponse <NetworkResponseProtocol>

@property (nonatomic) BooksResultsObject *booksResults;

- (instancetype)init;

@end

