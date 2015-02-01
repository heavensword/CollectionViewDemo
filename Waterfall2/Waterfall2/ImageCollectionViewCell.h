//
//  ImageCollectionViewCell.h
//  Waterfall2
//
//  Created by Sword on 2/1/15.
//  Copyright (c) 2015 Sword. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) UIImage *image;

+ (ImageCollectionViewCell*)cellFromXib;

@end
