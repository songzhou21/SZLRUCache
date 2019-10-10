//
//  SZLRUCacheTests.m
//  SZLRUCacheTests
//
//  Created by Song Zhou on 2019/10/10.
//  Copyright © 2019 Song Zhou. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SZLRUCache.h"

@interface SZLRUCacheTests : XCTestCase

@end

@implementation SZLRUCacheTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testCapacity2 {
    SZLRUCache *cache = [[SZLRUCache alloc] initWithCapacity:2];
    NSLog(@"init\n%@", cache);
    
    [cache setObject:@1 forKey:@1];
    NSLog(@"add 1\n%@", cache);
    
    [cache setObject:@2 forKey:@2];
    NSLog(@"add 2\n%@", cache);
    XCTAssert([[cache objectForKey:@1] isEqualToNumber:@1]);
    NSLog(@"access 1\n%@", cache);
    
    /// evicts key 2
    [cache setObject:@3 forKey:@3];
    NSLog(@"add 3\n%@", cache);
    XCTAssertNil([cache objectForKey:@2]);
    
    /// evicts key 1
    [cache setObject:@4 forKey:@4];
    NSLog(@"add 4\n%@", cache);
    XCTAssertNil([cache objectForKey:@1]);
    NSLog(@"access 1\n%@", cache);
    XCTAssert([[cache objectForKey:@3] isEqualToNumber:@3]);
    NSLog(@"access 3\n%@", cache);
    XCTAssert([[cache objectForKey:@4] isEqualToNumber:@4]);
    NSLog(@"access 4\n%@", cache);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
