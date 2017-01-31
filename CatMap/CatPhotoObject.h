//
//  CatPhotoObject.h
//  CatMap
//
//  Created by Alex Bearinger on 2017-01-31.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

@import UIKit;

@interface CatPhotoObject : NSObject
@property UIImage *image;
@property NSURL *url;
@property NSDictionary *dict;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
