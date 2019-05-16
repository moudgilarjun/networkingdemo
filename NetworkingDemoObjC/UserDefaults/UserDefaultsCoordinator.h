//
//  UserDefaultsCoordinator.h
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 4/27/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserDefaultsCoordinator : NSObject

- (NSArray *)getFromDefaultsForKey:(NSString *)key;

- (void)addToDefaults:(NSString *)str forKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
