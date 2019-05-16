//
//  BooksResultsObject.h
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 4/29/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "BookObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface BooksResultsObject : JSONModel

- (instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing _Nullable *_Nullable)err;

@property (nonatomic) NSArray <BookObject> *booksResults;

@end

NS_ASSUME_NONNULL_END
