//
//  ParentTableViewController.h
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 4/27/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@protocol TabBarMemberProtocol <NSObject>

- (UIImage *)imageForTabBar;
- (NSString *)titleForTabBar;
- (NSString *)titleForNavigationBar;

@end

@interface ParentTableViewController : UITableViewController <TabBarMemberProtocol, UITableViewDataSource, UITableViewDelegate>

@property NSString *tabType;
@property (nonatomic, weak) id <TabBarMemberProtocol> delegate;
@property (nonatomic) UISearchBar *searchBar;
@property (nonatomic) NSArray *recents;
@property (nonatomic) NSArray *searchResults;

- (id)initWithTab:(NSString *)tabType;

- (void)showCallFailureAlert:(NSString *)message;

@end
