//
//  ImageCollectionViewCell.m
//  Waterfall2
//
//  Created by Sword on 2/1/15.
//  Copyright (c) 2015 Sword. All rights reserved.
//

#import "ImageCollectionViewCell.h"

@interface ImageCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *rowLabel;

@end

@implementation ImageCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor colorWithRed:(rand()%255 + 1) / 255.0 green:(rand()%255 + 1) / 255.0 blue:(rand()%255 + 1) / 255.0 alpha:1.0];
    self.contentView.backgroundColor = [UIColor redColor];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.image = self.image;
    self.rowLabel.text = [NSString stringWithFormat:@"{%ld, %ld}", self.indexPath.row, self.indexPath.section];
}

+ (ImageCollectionViewCell*)cellFromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ImageCollectionViewCell" owner:nil options:nil] firstObject];
}

@end
