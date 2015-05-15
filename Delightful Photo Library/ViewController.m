//
//  ViewController.m
//  Delightful Photo Library
//
//  Copyright (c) 2015 Jay Ang. All rights reserved.
//

#import "ViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface ViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageSelected;
@property (strong, nonatomic) IBOutlet UITextField *imageDescription;
@property (strong, nonatomic) IBOutlet UILabel *textLabel;
@property (strong, nonatomic) UIScrollView *imageScrollView;
@property (strong, nonatomic) NSMutableArray *imageAssetsMutableArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageAssetsMutableArray = [NSArray new];
    
    [self settingImageSelected];
    [self settingImageDescriptionTextField];
}

#pragma mark - text field 
-(void)settingImageDescriptionTextField
{
    self.imageDescription.placeholder = @"Image Description";
    self.imageDescription.delegate = self;
    
    self.imageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    self.imageDescription.inputAccessoryView = self.imageScrollView;
}

#pragma mark - setting Image Selected
-(void)settingImageSelected
{
    self.imageSelected.image = [UIImage imageNamed:@"jlaw"];
}

#pragma mark - settting ALAssets
//method needed to return ALAssetsLibrary
+(ALAssetsLibrary*)createAssetsLibrary
{
    static dispatch_once_t pred;
    
    static ALAssetsLibrary *assetsLibrary = nil;
    
    dispatch_once(&pred, ^{
        assetsLibrary = [ALAssetsLibrary new];
    });
    return assetsLibrary;
}

-(void)settingAssetsLibrary
{
    NSMutableArray *holdImageAssetsMutableArray = [NSMutableArray new];
    
    //get our assetLibrary
    ALAssetsLibrary *assetsLibrary = [ViewController createAssetsLibrary];
    
    
    //ALAssetsGroupAll is used to get
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop)
    {
        [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
           
            if (result)
            {
                //add the assets to a temporary mutable array
                [holdImageAssetsMutableArray addObject:result];
            }
        }];
        
//        NSSortDescriptor *sortAssets = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
//        self.imageAssetsMutableArray = [holdImageAssetsMutableArray sortedArrayUsingDescriptors:@[sortAssets]];
        self.imageAssetsMutableArray = holdImageAssetsMutableArray;
        
    } failureBlock:^(NSError *error) {
        
        
        NSLog(@"Error %@", error);
        
    }];
}




@end
