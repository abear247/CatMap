//
//  ShowAllViewController.m
//  CatMap
//
//  Created by Alex Bearinger on 2017-01-31.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "ShowAllViewController.h"
#import "CatManager.h"
#import "CatPhotoObject.h"
@import MapKit;

@interface ShowAllViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *map;

@end

@implementation ShowAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    for(CatPhotoObject *catPhoto in self.manager.catPhotos){
        double lat = [catPhoto.dict[@"latitude"] doubleValue];
        double lon = [catPhoto.dict[@"longitude"] doubleValue];
        catPhoto.coordinate = CLLocationCoordinate2DMake(lat, lon);
        [self.map addAnnotation:catPhoto];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
