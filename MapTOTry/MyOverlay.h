//
//  MyOverlay.h
//  MapTOTry
//
//  Created by zhangxiaolian on 13-11-8.
//  Copyright (c) 2013年 zhangxiaolian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyOverlay : NSObject<MKOverlay>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly) MKMapRect boundingMapRect;

-(void)initBoundingMapRect:(CLLocationCoordinate2D) tempcoordinate;

@end
