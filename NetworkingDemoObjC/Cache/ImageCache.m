//
//  ImageCache.m
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 5/14/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import "ImageCache.h"

@interface ImageCache()

@property (nonatomic) NSCache *imageCache;

@end

@implementation ImageCache

- (instancetype)init {

    if (self = [super init]) {
        _imageCache = [[NSCache alloc] init];
        return self;
    }

    return nil;
}

- (void)cacheImage:(UIImage*)image forKey:(NSString*)key {
    [self.imageCache setObject:image forKey:key];
}

- (UIImage*)getCachedImageForKey:(NSString*)key {
    return [self.imageCache objectForKey:key];
}

@end
