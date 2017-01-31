//
//  SearchViewController.m
//  CatMap
//
//  Created by Alex Bearinger on 2017-01-31.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
@property (nonatomic) CLLocationManager *manager;
@property CLLocationCoordinate2D coord;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.manager = [CLLocationManager new];
    self.manager.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)useLocation:(id)sender {
    if ([sender isOn]){
        [self.manager requestLocation];
        CLLocation *coordinate = self.manager.location;
        self.coord = coordinate.coordinate;
    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
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
