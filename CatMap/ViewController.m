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
#import "ShowAllViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *tableView;
//@property (nonatomic) NSArray *catPhotoObjectArray;
@property CatManager *manager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.manager = [CatManager new];
    [self performSegueWithIdentifier:@"SearchView" sender:self];
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
        svc.catManager = self.manager;
        svc.addNewTags = ^(NSArray<CatPhotoObject*>*cats){
            self.manager.catPhotos = [cats copy];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.tableView reloadData];
            }];
        };
        [svc addNewTags];
        
    }
    if([segue.identifier isEqualToString:@"ShowAllView"]){
        ShowAllViewController *savc = (ShowAllViewController*)[segue destinationViewController];
        savc.manager = self.manager;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
