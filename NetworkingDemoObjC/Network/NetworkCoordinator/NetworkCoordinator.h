//
//  NetworkCoordinator.h
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 4/27/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkCoordinator : NSObject

- (void)getBooksFor:(NSString *)searchKey success:(void(^)(NSArray *))success failure:(void(^)(NSString *))failure;
- (void)getMusicFor:(NSString *)searchKey success:(void(^)(NSArray *))success failure:(void(^)(NSString *))failure;
- (void)getMoviesFor:(NSString *)searchKey success:(void(^)(NSArray *))success failure:(void(^)(NSString *))failure;

@end

NS_ASSUME_NONNULL_END
