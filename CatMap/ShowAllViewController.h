//
//  ShowAllViewController.h
//  CatMap
//
//  Created by Alex Bearinger on 2017-01-31.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;
@class PhotoManager;

@interface ShowAllViewController : UIViewController <MKMapViewDelegate>
@property (nonatomic) PhotoManager *manager;
@end
