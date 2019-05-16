//
//  AllMediaTableViewController.m
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 5/13/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import "AllMediaTableViewController.h"
#import "DataCoordinator.h"

@implementation AllMediaTableViewController

- (id)init {

    if (self = [super initWithTab:DemoRecentDefaultKeyType.all]) {
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
        [[DataCoordinator sharedObject] getMediaFor:searchBar.text success:^(NSArray * _Nonnull media) {

            [wself setSearchResults:media.copy];

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
