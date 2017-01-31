//
//  ViewController.m
//  CatMap
//
//  Created by Alex Bearinger on 2017-01-31.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "ViewController.h"
#import "CatPhotoObject.h"
#import "CollectionViewCell.h"
#import "CatManager.h"
#import "DetailViewController.h"
#import "SearchViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *tableView;
@property CatManager *manager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.manager = [CatManager new];
    [self parseCats];
   
    
    
    
}

//-indexpathforselecteditem


-(void) parseCats{
    NSURL *parseURL = [NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=4d68041ce8ab964d485a8a6cb1f28da8&tags=cat&has_geo=1&extras=url_m&format=json&nojsoncallback=1&tags=cat&has_geo=1"];
    
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
        self.manager.catPhotos = [temp copy];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.tableView reloadData];
        }];
    }];
    [dataTask resume];
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.manager.catPhotos.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = (CollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    CatPhotoObject *catPhotoObject = self.manager.catPhotos[indexPath.item];
    cell.photo = catPhotoObject;
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"DetailView"]){
        DetailViewController *dvc = (DetailViewController*)[segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        dvc.catPhotoObject = self.manager.catPhotos[indexPath.item];
    }
    if([segue.identifier isEqualToString:@"SearchView"]) {
        SearchViewController *svc = (SearchViewController*)[segue destinationViewController];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
