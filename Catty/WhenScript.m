//
//  WhenScript.m
//  Catty
//
//  Created by Mattias Rauter on 18.04.12.
//  Copyright (c) 2012 Graz University of Technology. All rights reserved.
//

#import "WhenScript.h"
#import "Brick.h"

@implementation WhenScript

@synthesize action = _action;

- (id)init
{
    if (self = [super init])
    {
        self.action = kTouchActionTap;
    }
    
    return self;
}

//- (void)executeForSprite:(Sprite*)sprite
//{
//    for (Brick *brick in self.bricksArray)
//    {
//        [brick performOnSprite:sprite];
//    }
//}

#pragma mark - Description
- (NSString*)description
{
    return [NSString stringWithFormat:@"WhenScript => action: %d", self.action];
}

@end
