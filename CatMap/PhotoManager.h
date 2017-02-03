//
//  CatManager.h
//  CatMap
//
//  Created by Alex Bearinger on 2017-01-31.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Photo+CoreDataClass.h"
#import "AppDelegate.h"

@interface PhotoManager : NSObject <NSFetchedResultsControllerDelegate>
@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (strong, nonatomic) NSFetchedResultsController<Photo *> *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
+(id)coreManager;
@property NSArray <CatPhotoObject*> *catPhotos;
@property CLLocationCoordinate2D coord;
- (NSManagedObjectContext *)getContext;

- (NSPersistentContainer *)getContainer;

- (AppDelegate *)appDelegate;
@end
