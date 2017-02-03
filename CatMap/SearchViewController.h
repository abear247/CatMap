//
//  SearchViewController.h
//  CatMap
//
//  Created by Alex Bearinger on 2017-01-31.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreLocation;
@class CatManager;
#import "Photo+CoreDataClass.h"

@interface SearchViewController : UIViewController <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic,copy) void (^addNewTags)(NSArray<Photo*>*photo);
@property CatManager *catManager;

@end
