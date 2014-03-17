//
//  MyOverlay.m
//  MapTOTry
//
//  Created by zhangxiaolian on 13-11-8.
//  Copyright (c) 2013年 zhangxiaolian. All rights reserved.
//

#import "MyOverlay.h"

@implementation MyOverlay

@synthesize coordinate,boundingMapRect;

-(void)setCoordinate:(CLLocationCoordinate2D)newCoordinate
{
    coordinate = newCoordinate;
}

-(void)initBoundingMapRect:(CLLocationCoordinate2D) tempcoordinate
{
    MKMapPoint topLeft = MKMapPointForCoordinate(CLLocationCoordinate2DMake(tempcoordinate.latitude+0.03, tempcoordinate.longitude));
    MKMapPoint topRight = MKMapPointForCoordinate(CLLocationCoordinate2DMake(tempcoordinate.latitude+0.03, tempcoordinate.longitude+0.05));
    MKMapPoint bottomLeft = MKMapPointForCoordinate(CLLocationCoordinate2DMake(tempcoordinate.latitude-0.03, tempcoordinate.longitude));
    boundingMapRect =  MKMapRectMake(topLeft.x,
                         topLeft.y,
                         fabs(topLeft.x - topRight.x),
                         fabs(topLeft.y - bottomLeft.y));
}

@end
