//
//  ViewController.m
//  Waterfall2
//
//  Created by Sword on 2/1/15.
//  Copyright (c) 2015 Sword. All rights reserved.
//

#import "ViewController.h"
#import "ImageCollectionViewCell.h"

#define IMAGE_WIDTH 100

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    UICollectionView    *_collectionView;
    NSArray             *_imgs;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *imgs = [[NSMutableArray alloc] init];
    for (NSInteger i = 1; i <= 15; i++) {
        NSString *imageName = [@(i) stringValue];
        [imgs addObject:[UIImage imageNamed:imageName]];
    }
    _imgs = imgs;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"ImageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ImageCollectionViewCell"];
    _collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_collectionView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_imgs count];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (0 == section) {
        return UIEdgeInsetsMake(30, 10, 20, 10);
    }
    else {
        return UIEdgeInsetsMake(30, 0, 20, 0);
    }
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ImageCollectionViewCell";
    ImageCollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if (!cell) {
        cell = [ImageCollectionViewCell cellFromXib];
    }
    cell.image = _imgs[indexPath.row];
    cell.indexPath = indexPath;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIImage *image = _imgs[indexPath.row];
    CGFloat height = [self imageHeight:image.size.width height:image.size.height];
    return CGSizeMake(IMAGE_WIDTH, height);
}

- (CGFloat)imageHeight:(CGFloat)width height:(CGFloat)height
{
    CGFloat fixedWidth = IMAGE_WIDTH;
    CGFloat fillHeight = fixedWidth * (height / width);
    return fillHeight;
}
@end
