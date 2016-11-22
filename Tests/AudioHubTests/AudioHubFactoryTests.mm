//
//  AudioHubFactoryTests.m
//  AudioHub
//
//  Created by Daniel Lindenfelser on 08/11/15.
//  Copyright © 2015 Daniel Lindenfelser. All rights reserved.
//

#import <XCTest/XCTest.h>
#include "Factory.h"

@interface AudioHubFactoryTests : XCTestCase

@end

@implementation AudioHubFactoryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCreate {
    AudioHub_Create(NULL, kAudioServerPlugInTypeUUID);
}

@end
