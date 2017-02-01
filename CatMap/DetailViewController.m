//
//  DetailViewController.m
//  CatMap
//
//  Created by Alex Bearinger on 2017-01-31.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "DetailViewController.h"
#import "CatPhotoObject.h"
@import MapKit;

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *map;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageID = self.catPhotoObject.photoId;
    // Do any additional setup after loading the view.
    NSURL *parseURL = [NSURL URLWithString:[NSString stringWithFormat:
                       @"https://api.flickr.com/services/rest/?method=flickr.photos.geo.getLocation&api_key=4d68041ce8ab964d485a8a6cb1f28da8&photo_id=%@&format=json&nojsoncallback=1", self.imageID]];
    
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:parseURL];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            NSLog(@"Error: %@", error.localizedDescription);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *latlongDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if(jsonError){
            NSLog(@"jsonError: %@",jsonError.localizedDescription);
            return;
        }
        NSDictionary *photos = [latlongDict objectForKey:@"photo"];
        NSDictionary *location = [photos objectForKey:@"location"];
        double lat = [[location objectForKey:@"latitude"] doubleValue];
        double lon = [[location objectForKey:@"longitude"] doubleValue];
        CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(lat, lon);
        self.catPhotoObject.coordinate = coord;
        MKCoordinateSpan span = MKCoordinateSpanMake(.5f, .5f);
        self.map.region = MKCoordinateRegionMake(self.catPhotoObject.coordinate, span);
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.map addAnnotation:self.catPhotoObject];
            
            
        }];
    }];
    [dataTask resume];
 //   self.title = self.catPhotoObject.dict[@"title"];
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
