//
//  CatManager.h
//  CatMap
//
//  Created by Alex Bearinger on 2017-01-31.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CatPhotoObject.h"

@interface CatManager : NSObject
@property NSArray <CatPhotoObject*> *catPhotos;
@property CLLocationCoordinate2D coord;

@end
