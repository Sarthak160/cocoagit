//
//  GITPackFileTests.m
//  CocoaGit
//
//  Created by Geoffrey Garside on 02/12/2008.
//  Copyright 2008 ManicPanda.com. All rights reserved.
//

#import "GITPackFileTests.h"

@implementation GITPackFileTests
@synthesize versionTwo;

- (void)setUp
{
    [super setUp];
    self.versionTwo = [GITPackFile packFileWithPath:DELTA_REF_PACK];
}
- (void)tearDown
{
    self.versionTwo = nil;
    [super tearDown];
}
- (void)testVersionTwoIsNotNil
{
    STAssertNotNil(versionTwo, nil);
}
- (void)testVersionInVersionTwo
{
    STAssertEquals([versionTwo version], (NSUInteger)2, nil);
}
- (void)testChecksumInVersionTwo
{
    STAssertEqualObjects([versionTwo checksumString], @"30c9a070ff5dcb64b5fd20337e3793407ecbfe66", nil);
}
- (void)testChecksumVerifiesInVersionTwo
{
    STAssertTrue([versionTwo verifyChecksum], nil);
}
- (void)testNumberOfObjectsInVersionTwo
{
    STAssertEquals([versionTwo numberOfObjects], (NSUInteger)1797, nil);
}
- (void)testHasObjectWithSha1InVersionTwo
{
    STAssertTrue([versionTwo hasObjectWithSha1:@"cec49e51b154fbd982c3f023dcbde80c5687ce57"], nil);
    STAssertFalse([versionTwo hasObjectWithSha1:@"cafebabe0d485f3cfd5fd9cc62491341067f0c59"], nil);
}
- (void)testDataForObjectWithSha1InVersionTwo
{
    NSData * data = [versionTwo dataForObjectWithSha1:@"cec49e51b154fbd982c3f023dcbde80c5687ce57"];
    STAssertTrue(data && [data length] > 0, @"Object data is not empty");
    //NSString * dataStr = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    //STAssertNotNil(dataStr, @"The string contents of the data block should not be nil");
}
// TODO: Add more test of the data contents and sizes

@end
