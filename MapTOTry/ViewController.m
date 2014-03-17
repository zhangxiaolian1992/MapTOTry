//
//  ViewController.m
//  MapTOTry
//
//  Created by zhangxiaolian on 13-11-8.
//  Copyright (c) 2013年 zhangxiaolian. All rights reserved.
//

#import "ViewController.h"
#import "MyAnnotation.h"
#import "PinAnnotion.h"
#import "MyOverlay.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        self.view.frame =  CGRectMake(0,20,self.view.frame.size.width,self.view.frame.size.height-20);
        
    }
	// Do any additional setup after loading the view, typically from a nib.
    myMapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height)];
    CLLocationCoordinate2D  center = CLLocationCoordinate2DMake(31.23, 121.221);
    MKCoordinateRegion region = MKCoordinateRegionMake(center, MKCoordinateSpanMake(0.2, 0.2));
    
    myMapView.mapType = MKMapTypeStandard;
    myMapView.centerCoordinate = center ;
    myMapView.region = region;
    myMapView.delegate = self;
    
    MKCoordinateRegion adjustedRegion = [myMapView regionThatFits:region];
    [myMapView setRegion:adjustedRegion animated:YES];
    
    [self.view  addSubview:myMapView];
    
    //加标注
    MyAnnotation *annotionFirst = [[MyAnnotation alloc]init];
    annotionFirst.coordinate = CLLocationCoordinate2DMake(31.23, 121.251);
    
    PinAnnotion *annotionSecond = [[PinAnnotion alloc]init];
    annotionSecond.coordinate = center;
    
    [myMapView addAnnotation:annotionFirst];
    [myMapView addAnnotation:annotionSecond];

    //加图层
    MyOverlay *overalyFirst = [[MyOverlay alloc]init];
    overalyFirst.coordinate =CLLocationCoordinate2DMake(31.33, 121.251);
    [overalyFirst initBoundingMapRect:overalyFirst.coordinate];
    
    [myMapView addOverlay:overalyFirst];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    }

#pragma MKMapviewDelegate

- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView
{
    NSLog(@"beginLoadMap");
}
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    NSLog(@"endLoadMap");
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    if ([annotation isKindOfClass:[MyAnnotation class]]) {
        MKAnnotationView * tmepAnnotionView = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"annnotionFirst"];
        tmepAnnotionView.image = [UIImage imageNamed:@"2F9F@2x.png"];
        UILabel *tempLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 10, 100, 30)];
        tempLabel.text =@"我是第一个";
        tempLabel.backgroundColor = [UIColor lightGrayColor];
        tempLabel.adjustsFontSizeToFitWidth = YES;
        [tmepAnnotionView addSubview:tempLabel];
        tmepAnnotionView.canShowCallout = YES;
         return tmepAnnotionView;
    }
    
    if ([annotation isKindOfClass:[PinAnnotion class]]) {
        MKAnnotationView * tmepAnnotionView = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"annnotionSecond"];
        tmepAnnotionView.image = [UIImage imageNamed:@"211@2x.png"];
        return tmepAnnotionView;
    }
    
    return nil;
}

 - (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay
{
    if ([overlay isKindOfClass:[MyOverlay class]]) {
        MKOverlayView * tempRender = [[MKOverlayView alloc]initWithOverlay:overlay];
        UIImageView * tempImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2F9F@2x.png"]];
        tempImage.frame = CGRectMake(0, 0, 20, 20);
        UILabel *tempLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 10, 100, 30)];
        tempLabel.text =@"我是第二个";
        tempLabel.backgroundColor = [UIColor lightGrayColor];
        tempLabel.adjustsFontSizeToFitWidth = YES;
        [tempRender addSubview:tempLabel];
        [tempRender addSubview:tempImage];
        
        return tempRender;
    }
    return nil;
}

@end
