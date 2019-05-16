//
//  NetworkResponse.h
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 4/29/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@protocol NetworkResponseProtocol <NSObject>

- (id)parseDataFor:(NSData *)data;

@end

@interface NetworkResponse : NSObject

@property (nonatomic, weak) id <NetworkResponseProtocol> delegate;

- (NSDictionary *)dictionaryForData:(NSData *)data;

@end
