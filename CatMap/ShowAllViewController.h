//
//  ShowAllViewController.h
//  CatMap
//
//  Created by Alex Bearinger on 2017-01-31.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;
@class CatManager;

@interface ShowAllViewController : UIViewController <MKMapViewDelegate>
@property (nonatomic) CatManager *manager;
@end
