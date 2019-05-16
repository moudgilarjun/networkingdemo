//
//  NetworkResponse.m
//  NetworkingDemoObjC
//
//  Created by Arjun Moudgil on 4/29/19.
//  Copyright © 2019 Arjun Moudgil. All rights reserved.
//

#import "NetworkResponse.h"

@implementation NetworkResponse

- (NSDictionary *)dictionaryForData:(NSData *)data {
    
    NSError *parseError = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];

    return dict;
}

@end
