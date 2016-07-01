//
//  FGImagePickerViewController.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGImagePickerViewController.h"

@interface FGImagePickerViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic) UIImagePickerController *imagePickerViewController;

@end

@implementation FGImagePickerViewController

#pragma mark - Initialization
#pragma mark - Private methods
#pragma mark Accessors

- (UIImagePickerController *)imagePickerViewController
{
	if (!_imagePickerViewController) {
		_imagePickerViewController = [[UIImagePickerController alloc] init];
		_imagePickerViewController.delegate = self;
#if TARGET_IPHONE_SIMULATOR
		_imagePickerViewController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
#else
		_imagePickerViewController.sourceType = UIImagePickerControllerSourceTypeCamera;
#endif
		_imagePickerViewController.allowsEditing = YES;
	}
	
	return _imagePickerViewController;
}

#pragma mark - View lifecycle

- (void)loadView
{
	[super loadView];
	
	UIView *contentView = self.view;
	
	UIViewController *imagePickerViewController = self.imagePickerViewController;
	
	[imagePickerViewController willMoveToParentViewController:self];
	
	[self addChildViewController:imagePickerViewController];
	
	UIView *imagePickerViewControllerView = imagePickerViewController.view;
	imagePickerViewControllerView.frame = contentView.bounds;
	imagePickerViewControllerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	[contentView addSubview:imagePickerViewControllerView];
	
	[imagePickerViewController didMoveToParentViewController:self];
}

#pragma mark - Public methods
#pragma mark Accessors
#pragma mark Overrides
#pragma mark - User interaction handlers
#pragma mark - Notification handlers
#pragma mark - KVO
#pragma mark - <UINavigationControllerDelegate>
#pragma mark - <UIImagePickerControllerDelegate>

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
	UIImage *image = (info[UIImagePickerControllerEditedImage]?:
					  info[UIImagePickerControllerOriginalImage]);
	
	if (self.completion) {
		self.completion(image);
	}
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	if (self.completion) {
		self.completion(nil);
	}
}

@end
