//
//  CatPhotoObject.m
//  CatMap
//
//  Created by Alex Bearinger on 2017-01-31.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "CatPhotoObject.h"

@interface CatPhotoObject()
@property NSString *server;
@property int farm;
@property NSString *secret;
@end

@implementation CatPhotoObject

-(instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if(self){
        self.dict = dict;
        NSNumber *number= dict[@"farm"];
        self.farm = [number intValue];
        self.secret = dict[@"secret"];
        self.photoId = dict[@"id"];
        self.server = dict[@"server"];
        NSString *url = [NSString stringWithFormat:@"https://farm%d.staticflickr.com/%@/%@_%@.jpg",self.farm,self.server,self.photoId,self.secret];
        _url = [NSURL URLWithString:url];
        
        NSData *data = [NSData dataWithContentsOfURL:self.url];
        self.image = [UIImage imageWithData:data];
    }
    return self;
}


@end
