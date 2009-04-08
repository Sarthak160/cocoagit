//
//  GITHead.m
//  CocoaGit
//
//  Created by Brian Chapados on 4/02/09.
//  Copyright 2009 Brian Chapados. All rights reserved.
//

#import "GITHead.h"

@implementation GITHead

+ (id) currentWithRepo:(GITRepo *)repo;
{
    NSString *headRefContents = [[NSString alloc] initWithContentsOfFile:[repo headRefPath]
                                                            encoding:NSASCIIStringEncoding 
                                                               error:nil];
    NSString *headRefTemp = [headRefContents stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    [headRefContents release];
    
    // "ref: refs/heads/chapados/master" -> "refs/heads/chapados/master"
    NSRange headRefName = [headRefTemp substringFromIndex:5];
    id theRef = [self looseRefWithName:headRefName repo:repo];
    
    if ( !theRef ) {
        // search all refs, including packed-refs.
        // Use a for-loop instead of NSPredicate for iPhone 2.x compat.
        NSArray *refs = [self allRefsWithPrefix:@"heads" inRepo:repo];
        for (id r in refs) {
            if ([[r name] isEqual:headRefName]) theRef = r;
        }
    }
    
    // should always find the HEAD ref unless there is a major problem, right?
    NSAssert(theRef != nil, @"Could NOT find ref for HEAD");
    
    return theRef;
}

@end
