//
//  MyAnnotation.h
//  MapTOTry
//
//  Created by zhangxiaolian on 13-11-8.
//  Copyright (c) 2013年 zhangxiaolian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject<MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;

@end
