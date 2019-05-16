//
//  DataCoordinator.m
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 4/27/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import "DataCoordinator.h"
#import "Constants.h"
#import "UserDefaultsCoordinator.h"
#import "NetworkCoordinator.h"
#import "ImageCache.h"
#import "BookObject.h"
#import "MusicObject.h"
#import "MovieObject.h"
#import "CellItemModel.h"

@interface DataCoordinator()

@property (nonatomic) UserDefaultsCoordinator *userDefaultsCoordinator;
@property (nonatomic) NetworkCoordinator *networkCoordinator;
@property (nonatomic) ImageCache *imageCache;

@end

@implementation DataCoordinator

#pragma mark Singleton Methods

+ (DataCoordinator *)sharedObject {

    static DataCoordinator *sharedObject = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        sharedObject = [[self alloc] init];
    });

    return sharedObject;
}

#pragma mark - Init

- (id)init {

    if (self = [super init]) {

        self.userDefaultsCoordinator = [[UserDefaultsCoordinator alloc] init];
        self.networkCoordinator = [[NetworkCoordinator alloc] init];
        self.imageCache = [[ImageCache alloc] init];

        return self;
    }

    return nil;
}

#pragma mark - Async APIs

- (void)getBooksFor:(NSString *)searchKey success:(void(^)(NSArray *))success failure:(void(^)(NSString *))failure {

    [self.networkCoordinator getBooksFor:searchKey success:^(NSArray * _Nonnull responseArray) {

        NSMutableArray *arrayOfBooks = [[NSMutableArray alloc] init];

        for (BookObject *obj in responseArray) {

            CellItemModel *cellItem = [[CellItemModel alloc] init];
            cellItem.title = obj.trackName;
            cellItem.subtitle = obj.artistName;
            cellItem.url = obj.artworkUrl100;
            cellItem.type = DemoRecentDefaultKeyType.books;

            [arrayOfBooks addObject:cellItem];
        }

        if (success) {
            success((NSArray *)arrayOfBooks);
        }
        
    } failure:^(NSString * _Nonnull errorMessage) {
        if (failure) {
            failure(errorMessage);
        }
    }];
}

- (void)getMusicFor:(NSString *)searchKey success:(void(^)(NSArray *))success failure:(void(^)(NSString *))failure {

    [self.networkCoordinator getMusicFor:searchKey success:^(NSArray * _Nonnull responseArray) {

        NSMutableArray *arrayOfMusic = [[NSMutableArray alloc] init];

        for (MusicObject *obj in responseArray) {

            CellItemModel *cellItem = [[CellItemModel alloc] init];
            cellItem.title = obj.trackName;
            cellItem.subtitle = obj.artistName;
            cellItem.url = obj.artworkUrl100;
            cellItem.type = DemoRecentDefaultKeyType.music;

            [arrayOfMusic addObject:cellItem];
        }

        if (success) {
            success((NSArray *)arrayOfMusic);
        }

    } failure:^(NSString * _Nonnull errorMessage) {
        if (failure) {
            failure(errorMessage);
        }
    }];
    
}

- (void)getMoviesFor:(NSString *)searchKey success:(void(^)(NSArray *))success failure:(void(^)(NSString *))failure {

    [self.networkCoordinator getMoviesFor:searchKey success:^(NSArray * _Nonnull responseArray) {

        NSMutableArray *arrayOfMovies = [[NSMutableArray alloc] init];

        for (MovieObject *obj in responseArray) {

            CellItemModel *cellItem = [[CellItemModel alloc] init];
            cellItem.title = obj.trackName;
            cellItem.subtitle = obj.artistName;
            cellItem.url = obj.artworkUrl100;
            cellItem.type = DemoRecentDefaultKeyType.movies;

            [arrayOfMovies addObject:cellItem];
        }

        if (success) {
            success((NSArray *)arrayOfMovies);
        }

    } failure:^(NSString * _Nonnull errorMessage) {
        if (failure) {
            failure(errorMessage);
        }
    }];
    
}

- (void)getMediaFor:(NSString *)searchKey success:(void(^)(NSArray *))success failure:(void(^)(NSString *))failure {

    __block NSArray *booksResults = [NSArray new];
    __block NSArray *musicResults = [NSArray new];
    __block NSArray *moviesResults = [NSArray new];

    dispatch_group_t groupCall = dispatch_group_create();

    dispatch_group_enter(groupCall);
    [self getBooksFor:searchKey success:^(NSArray *books) {
        booksResults = books;
        dispatch_group_leave(groupCall);
    } failure:^(NSString *failure) {
        dispatch_group_leave(groupCall);
    }];

    dispatch_group_enter(groupCall);
    [self getMusicFor:searchKey success:^(NSArray *music) {
        musicResults = music;
        dispatch_group_leave(groupCall);
    } failure:^(NSString *failure) {
        dispatch_group_leave(groupCall);
    }];

    dispatch_group_enter(groupCall);
    [self getMoviesFor:searchKey success:^(NSArray *movies) {
        moviesResults = movies;
        dispatch_group_leave(groupCall);
    } failure:^(NSString *failure) {
        dispatch_group_leave(groupCall);
    }];


    dispatch_group_notify(groupCall, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {

        NSMutableArray *finalResults = [NSMutableArray new];
        [finalResults addObjectsFromArray:booksResults];
        [finalResults addObjectsFromArray:musicResults];
        [finalResults addObjectsFromArray:moviesResults];

        if (success && finalResults.count) {
            success((NSArray *)[finalResults copy]);
        } else {
            if (failure) {
                failure(@"Group Call failed.");
            }
        }
    });

}

#pragma mark - Sync APIs

- (NSArray *)getRecentsFor:(NSString *)key {
    return [self.userDefaultsCoordinator getFromDefaultsForKey:key];
}

- (void)addToRecents:(NSString *)value for:(NSString *)key {
    [self.userDefaultsCoordinator addToDefaults:value forKey:key];
}

#pragma mark - Sync ~ Async APIs

- (UIImage *)imageForURL:(NSURL *)url completionHandler:(void(^)(UIImage *))completion {

    UIImage *image = [self.imageCache getCachedImageForKey:[url absoluteString]];

    if (image) {
        return image;
    }

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:url]];

        if (image) {

            [self.imageCache cacheImage:image forKey:[url absoluteString]];

            if (completion) {
                completion(image);
            }
        }
    });

    return nil;
}

@end
