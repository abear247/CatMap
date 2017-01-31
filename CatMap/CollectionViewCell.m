//
//  CollectionViewCell.m
//  CatMap
//
//  Created by Alex Bearinger on 2017-01-31.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "CollectionViewCell.h"
#import "CatPhotoObject.h"

@interface CollectionViewCell()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *catImageView;


@end

@implementation CollectionViewCell

-(void)setPhoto:(CatPhotoObject *)photo{
    _photo = photo;
    self.title.text = photo.dict[@"title"];
    self.catImageView.image = photo.image;
}

@end
