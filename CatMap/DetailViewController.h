//
//  DetailViewController.h
//  CatMap
//
//  Created by Alex Bearinger on 2017-01-31.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CatPhotoObject;

@interface DetailViewController : UIViewController
@property NSString *imageID;
@property CatPhotoObject *catPhotoObject;
@end
