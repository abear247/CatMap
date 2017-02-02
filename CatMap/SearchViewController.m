//
//  SearchViewController.m
//  CatMap
//
//  Created by Alex Bearinger on 2017-01-31.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "SearchViewController.h"
#import "CatPhotoObject.h"
#import "CatManager.h"

@interface SearchViewController ()
@property (nonatomic) CLLocationManager *manager;
@property bool useUserLocation;
@property NSString *tags;


@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.manager = [CLLocationManager new];
    self.manager.delegate = self;
    self.useUserLocation = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
        [self parseCats];
       
        
        
    }];
}
- (IBAction)useLocation:(id)sender {
    if ([sender isOn]){
        [self.manager requestLocation];
        CLLocation *coordinate = self.manager.location;
        self.catManager.coord = coordinate.coordinate;
        self.useUserLocation = YES;
    }
    else
        self.useUserLocation = NO;
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
}

-(void) parseCats{
    
    NSURL *parseURL;
    if(self.useUserLocation){
        NSString *extraURL = [NSString stringWithFormat:@"lat=%f&lon=%f&radius=20",self.catManager.coord.latitude,self.catManager.coord.longitude];
        parseURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=4d68041ce8ab964d485a8a6cb1f28da8&tags=%@&lat=1&lon=1&has_geo=1&extras=url_m&format=json&nojsoncallback=1&extras=geo&%@",self.textField.text,extraURL]];
    }
    else{
        parseURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=4d68041ce8ab964d485a8a6cb1f28da8&tags=%@&has_geo=1&extras=url_m&format=json&nojsoncallback=1&extras=geo",self.textField.text]];
    }
    NSLog(@"%@",parseURL);
    
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:parseURL];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            NSLog(@"Error: %@",error.localizedDescription);
            return;
        }
        NSError *jsonError = nil;
        NSDictionary *rawPhotos = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if(jsonError){
            NSLog(@"jsonError: %@", error.localizedDescription);
            return;
        }
        NSDictionary *photos = [rawPhotos objectForKey:@"photos"];
        NSArray *photo = [photos objectForKey:@"photo"];
        NSMutableArray *temp = [NSMutableArray new];
        for(NSDictionary *dict in photo){
            CatPhotoObject *catPhotoObject = [[CatPhotoObject alloc] initWithDict:dict];
            [temp addObject:catPhotoObject];
        }
        self.catManager.catPhotos = [temp copy];
         self.addNewTags(self.catManager.catPhotos);
        
    }];
    [dataTask resume];
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
