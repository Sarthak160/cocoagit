//
//  GITPackFileVersion2.h
//  CocoaGit
//
//  Created by Geoffrey Garside on 04/11/2008.
//  Copyright 2008 ManicPanda.com. All rights reserved.
//

#import "GITPackFile.h"

@class GITPackIndex;
@interface GITPackFileVersion2 : GITPackFile
{
    NSString * path;
    NSData   * data;
    GITPackIndex * idx;
}

@end