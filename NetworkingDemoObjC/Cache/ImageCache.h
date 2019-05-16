//
//  ImageCache.h
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 5/14/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageCache : NSObject

- (instancetype)init;

- (void)cacheImage:(UIImage*)image forKey:(NSString*)key;

- (UIImage*)getCachedImageForKey:(NSString*)key;

@end
