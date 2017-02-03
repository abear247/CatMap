//
//  Photo+CoreDataProperties.h
//  CatMap
//
//  Created by Alex Bearinger on 2017-02-03.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Photo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Photo (CoreDataProperties)

+ (NSFetchRequest<Photo *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *photoID;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *url;
@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, retain) NSObject *coordinate;

@end

NS_ASSUME_NONNULL_END
