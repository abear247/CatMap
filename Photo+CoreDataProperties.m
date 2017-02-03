//
//  Photo+CoreDataProperties.m
//  CatMap
//
//  Created by Alex Bearinger on 2017-02-03.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Photo+CoreDataProperties.h"

@implementation Photo (CoreDataProperties)

+ (NSFetchRequest<Photo *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Photo"];
}

@dynamic photoID;
@dynamic latitude;
@dynamic longitude;
@dynamic title;
@dynamic url;
@dynamic image;
@dynamic coordinate;

@end
