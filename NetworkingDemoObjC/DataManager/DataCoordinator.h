//
//  DataCoordinator.h
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 4/27/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DataCoordinator : NSObject

+ (DataCoordinator *)sharedObject;

// Async calls
- (void)getBooksFor:(NSString *)searchKey success:(void(^)(NSArray *))success failure:(void(^)(NSString *))failure;
- (void)getMusicFor:(NSString *)searchKey success:(void(^)(NSArray *))success failure:(void(^)(NSString *))failure;
- (void)getMoviesFor:(NSString *)searchKey success:(void(^)(NSArray *))success failure:(void(^)(NSString *))failure;
- (void)getMediaFor:(NSString *)searchKey success:(void(^)(NSArray *))success failure:(void(^)(NSString *))failure;

// Sync calls
- (NSArray *)getRecentsFor:(NSString *)key;
- (void)addToRecents:(NSString *)value for:(NSString *)key;

// Sync ~ Async
- (UIImage *)imageForURL:(NSURL *)url completionHandler:(void(^)(UIImage *))completion;

@end
