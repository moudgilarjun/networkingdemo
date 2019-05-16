//
//  ParentTableViewController.m
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 4/27/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import "ParentTableViewController.h"
#import "DataCoordinator.h"
#import "CellItemModel.h"

@implementation ParentTableViewController

- (id)initWithTab:(NSString *)tabType {

    if (self = [super init]) {

        _tabType = tabType;
        _delegate = self;
        _recents = [[NSArray alloc] init];

        return self;
    }

    return nil;
}

- (void)viewDidLoad {

    [super viewDidLoad];

    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
        
    [self setupViews];
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];

    self.recents = [[DataCoordinator sharedObject] getRecentsFor:self.tabType];
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (self.searchResults.count) {

        return self.searchResults.count;
    }

    return self.recents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell;

    if (self.searchResults.count) {

        CellItemModel *cellItem = [self.searchResults objectAtIndex:indexPath.row];

        cell = [tableView dequeueReusableCellWithIdentifier:@"denseCell"];

        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"denseCell"];
        }

        cell.textLabel.text = cellItem.title;
        cell.detailTextLabel.text = cellItem.subtitle;
        cell.backgroundColor = UIColor.whiteColor;

        UIImage *image = [[DataCoordinator sharedObject] imageForURL:cellItem.url completionHandler:^(UIImage * _Nonnull image) {

            dispatch_async(dispatch_get_main_queue(), ^{

                [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            });
        }];

        [cell.imageView setImage: image];

        if (self.tabType == DemoRecentDefaultKeyType.all) {

            if (cellItem.type == DemoRecentDefaultKeyType.music) {
                cell.backgroundColor = [UIColor redColor];
            } else if (cellItem.type == DemoRecentDefaultKeyType.books) {
                cell.backgroundColor = [UIColor yellowColor];
            } else if (cellItem.type == DemoRecentDefaultKeyType.movies) {
                cell.backgroundColor = [UIColor greenColor];
            }
        }
    } else {

        cell = [tableView dequeueReusableCellWithIdentifier:@"simpleCell"];

        if (cell == nil) {

            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"simpleCell"];
        }
        cell.textLabel.text = [self.recents objectAtIndex:indexPath.row];
    }

    return cell;
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

    if (self.searchResults.count) {

        [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
        [cell.textLabel setTextColor:[UIColor colorWithRed:26/255 green:95/255 blue:246/255 alpha:0.7]];
        [cell.detailTextLabel setFont:[UIFont fontWithName:@"Helvetica" size:13]];
        [cell.detailTextLabel setTextColor:[UIColor colorWithRed:26/255 green:95/255 blue:246/255 alpha:0.5]];

    } else {

        [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica" size:20]];
        [cell.textLabel setTextColor:[UIColor colorWithRed:26/255 green:95/255 blue:246/255 alpha:0.5]];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (self.searchResults.count) {
        return 60.0f;
    }

    return 45.0f;
}

#pragma mark -  TabBarMemberProtocol Methods

- (UIImage *)imageForTabBar {

    NSString *imageName = nil;

    if (self.tabType == DemoRecentDefaultKeyType.books) {
        imageName = @"book";
    } else if (self.tabType == DemoRecentDefaultKeyType.movies) {
        imageName = @"Movie";
    } else if (self.tabType == DemoRecentDefaultKeyType.music) {
        imageName = @"musical_notes";
    } else if (self.tabType == DemoRecentDefaultKeyType.all) {
        imageName = @"albums";
    }

    return [UIImage imageNamed:imageName];
}

- (NSString *)titleForTabBar {

    NSString *title = nil;

    if (self.tabType == DemoRecentDefaultKeyType.books) {
        title = @"Books";
    } else if (self.tabType == DemoRecentDefaultKeyType.movies) {
        title = @"Movies";
    } else if (self.tabType == DemoRecentDefaultKeyType.music) {
        title = @"Music";
    } else if (self.tabType == DemoRecentDefaultKeyType.all) {
        title = @"All";
    }

    return title;
}

- (NSString *)titleForNavigationBar {

    NSString *title = nil;

    if (self.tabType == DemoRecentDefaultKeyType.books) {
        title = @"Books";
    } else if (self.tabType == DemoRecentDefaultKeyType.movies) {
        title = @"Movies";
    } else if (self.tabType == DemoRecentDefaultKeyType.music) {
        title = @"Music";
    } else if (self.tabType == DemoRecentDefaultKeyType.all) {
        title = @"All";
    }

    return title;
}

#pragma mark - Private Methods

- (void)setupViews {

    [self.navigationController.navigationBar setPrefersLargeTitles:YES];
    [self.navigationItem setTitle:[_delegate titleForNavigationBar]];

    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 50.0f)];
    [self.searchBar setPlaceholder:@"New Search"];
    [self.tableView setTableHeaderView:self.searchBar];

    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

#pragma mark - Public Methods

- (void)showCallFailureAlert:(NSString *)message {

    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Could not fetch data"
                                message:[NSString stringWithFormat:@"Error: - %@", message]
                                preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *cancel = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleCancel
                             handler:nil];

    [alert addAction:cancel];

    [self presentViewController:alert animated:YES completion:nil];
}

@end
