//
//  NetworkCoordinator.m
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 4/27/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import "NetworkCoordinator.h"
#import "NetworkRequestFactory.h"
#import "NetworkRequest.h"
#import "NetworkCallExecutor.h"

#import "BooksSearchResponse.h"
#import "BooksResultsObject.h"
#import "MusicSearchResponse.h"
#import "MusicResultsObject.h"
#import "MoviesSearchResponse.h"
#import "MoviesResultsObject.h"

@implementation NetworkCoordinator

- (void)getBooksFor:(NSString *)searchKey success:(void(^)(NSArray *))success failure:(void(^)(NSString *))failure {

    __block NetworkRequest *networkRequest = [NetworkRequestFactory getBookSearchRequestFor:searchKey];

    [NetworkCallExecutor executeCallWithRequest:networkRequest.request success:^(NSData *data) {

        [networkRequest successWithData:data];

        if (success) {

            BooksSearchResponse *networkResponse = (BooksSearchResponse *)networkRequest.response;
            success([networkResponse.booksResults.booksResults copy]);
        }

    } failure:^(NSError *error) {

        NSLog(@"%@", error);
        [networkRequest failureWithError:error];
    }];
}

- (void)getMusicFor:(NSString *)searchKey success:(void(^)(NSArray *))success failure:(void(^)(NSString *))failure {

    __block NetworkRequest *networkRequest = [NetworkRequestFactory getMusicSearchRequestFor:searchKey];

    [NetworkCallExecutor executeCallWithRequest:networkRequest.request success:^(NSData *data) {

        [networkRequest successWithData:data];

        if (success) {

            MusicSearchResponse *networkResponse = (MusicSearchResponse *)networkRequest.response;
            success([networkResponse.musicResults.musicResults copy]);
        }

    } failure:^(NSError *error) {

        NSLog(@"%@", error);
        [networkRequest failureWithError:error];
    }];
}

- (void)getMoviesFor:(NSString *)searchKey success:(void(^)(NSArray *))success failure:(void(^)(NSString *))failure {

    __block NetworkRequest *networkRequest = [NetworkRequestFactory getMoviesSearchRequestFor:searchKey];

    [NetworkCallExecutor executeCallWithRequest:networkRequest.request success:^(NSData *data) {

        [networkRequest successWithData:data];

        if (success) {

            MoviesSearchResponse *networkResponse = (MoviesSearchResponse *)networkRequest.response;
            success([networkResponse.moviesResults.moviesResults copy]);
        }

    } failure:^(NSError *error) {

        NSLog(@"%@", error);
        [networkRequest failureWithError:error];
    }];
}

@end
