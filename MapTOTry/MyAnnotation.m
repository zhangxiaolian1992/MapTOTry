//
//  MyAnnotation.m
//  MapTOTry
//
//  Created by zhangxiaolian on 13-11-8.
//  Copyright (c) 2013年 zhangxiaolian. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

@synthesize coordinate,title,subtitle;

-(void )setCoordinate:(CLLocationCoordinate2D)coor
{
    coordinate = coor;
}

@end
