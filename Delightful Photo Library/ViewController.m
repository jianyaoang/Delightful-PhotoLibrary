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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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







@end
