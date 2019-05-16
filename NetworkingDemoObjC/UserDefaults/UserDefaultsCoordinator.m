//
//  UserDefaultsCoordinator.m
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 4/27/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import "UserDefaultsCoordinator.h"

@implementation UserDefaultsCoordinator

- (NSArray *)getFromDefaultsForKey:(NSString *)key {

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *arr = [userDefaults objectForKey:key];

    return arr;
}

- (void)addToDefaults:(NSString *)str forKey:(NSString *)key {

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    NSArray *arr = [userDefaults objectForKey:key];
    if (!arr) {
        arr = [[NSArray alloc] init];
    }

    NSMutableArray *mutableArr = [NSMutableArray arrayWithArray:arr];

    [mutableArr removeObjectIdenticalTo:str];
    [mutableArr insertObject:str atIndex:0];

    [userDefaults setObject:(NSArray *)mutableArr forKey:key];
    [userDefaults synchronize];
}

@end
