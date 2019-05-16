//
//  Constants.h
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 5/13/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const struct DemoRecentDefaultKeyStruct {
    __unsafe_unretained NSString *books;
    __unsafe_unretained NSString *movies;
    __unsafe_unretained NSString *music;
    __unsafe_unretained NSString *all;
} DemoRecentDefaultKeyType;

#define Weak(obj) __weak typeof(obj) w##obj = obj
