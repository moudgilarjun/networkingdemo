//
//  DemoTabBarController.m
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 4/27/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import "DemoTabBarController.h"
#import "BooksTableViewController.h"
#import "MoviesTableViewController.h"
#import "MusicTableViewController.h"
#import "AllMediaTableViewController.h"

@interface DemoTabBarController ()

@end

@implementation DemoTabBarController

- (id)init {

    if (self = [super init]) {

        BooksTableViewController *booksTableViewController = [[BooksTableViewController alloc] init];
        UINavigationController *booksNavigationController = [[UINavigationController alloc] initWithRootViewController:booksTableViewController];

        MoviesTableViewController *moviesTableViewController = [[MoviesTableViewController alloc] init];
        UINavigationController *moviesNavigationController = [[UINavigationController alloc] initWithRootViewController:moviesTableViewController];

        MusicTableViewController *musicTableViewController = [[MusicTableViewController alloc] init];
        UINavigationController *musicNavigationController = [[UINavigationController alloc] initWithRootViewController:musicTableViewController];

        AllMediaTableViewController *allMediaTableViewController = [[AllMediaTableViewController alloc] init];
        UINavigationController *allMediaNavigationController = [[UINavigationController alloc] initWithRootViewController:allMediaTableViewController];

        [self setViewControllers:@[booksNavigationController, moviesNavigationController, musicNavigationController, allMediaNavigationController]];

        for (int i = 0; i < self.tabBar.items.count; i++) {
            ParentTableViewController *parentTableViewController = (ParentTableViewController *)[(UINavigationController *)[self.viewControllers objectAtIndex:i] topViewController];
            [self.tabBar.items[i] setTitle:[parentTableViewController.delegate titleForTabBar]];
            [self.tabBar.items[i] setImage:[parentTableViewController.delegate imageForTabBar]];
        }
    }

    return self;
}

@end
