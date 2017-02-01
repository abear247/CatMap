//
//  CatPhotoObject.h
//  CatMap
//
//  Created by Alex Bearinger on 2017-01-31.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

@import UIKit;
@import MapKit;

@interface CatPhotoObject : NSObject <MKAnnotation>
@property UIImage *image;
@property NSURL *url;
@property NSDictionary *dict;
@property NSString *photoId;
@property (nonatomic, readonly, copy, nullable) NSString *title;
@property(nonatomic) CLLocationCoordinate2D coordinate;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
