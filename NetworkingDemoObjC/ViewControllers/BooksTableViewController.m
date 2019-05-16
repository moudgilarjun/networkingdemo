//
//  BooksTableViewController.m
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 4/27/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import "BooksTableViewController.h"
#import "DataCoordinator.h"

@implementation BooksTableViewController

- (id)init {

    if (self = [super initWithTab:DemoRecentDefaultKeyType.books]) {
        return self;
    }

    return nil;
}

- (void)viewDidLoad {

    [super viewDidLoad];
    
    [self.searchBar setDelegate:self];
}

#pragma mark - UISearchBarDelegate Methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {

    [searchBar resignFirstResponder];

    if (searchBar.text && searchBar.text.length) {

        [[DataCoordinator sharedObject] addToRecents:searchBar.text for:self.tabType];
        [self setRecents:[[DataCoordinator sharedObject] getRecentsFor:self.tabType]];

        Weak(self);
        [[DataCoordinator sharedObject] getBooksFor:searchBar.text success:^(NSArray * _Nonnull books) {

            [wself setSearchResults:books.copy];
            
            dispatch_async(dispatch_get_main_queue(), ^{

                [wself.tableView reloadData];
            });

        } failure:^(NSString * _Nonnull failure) {

            [wself showCallFailureAlert:failure];
        }];
    }

    [searchBar setText:nil];
}

@end
