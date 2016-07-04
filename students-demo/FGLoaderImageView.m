//
//  FGLoaderImageView.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGLoaderImageView.h"

#import "FGImageLoader.h"
#import "FGActivityIndicatorView.h"

@interface FGLoaderImageView ()

@property (nonatomic) NSURL *imageURL;

@property (nonatomic) NSURLSessionDataTask *pendingTask;

@property (nonatomic) FGActivityIndicatorView *activityIndicatorView;
@property (nonatomic) FGImageView *imageView;

@end


@implementation FGLoaderImageView

#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		self.showLoadingIndicator = YES;
		
		FGImageView *imageView = [[FGImageView alloc] initWithFrame:self.bounds];
		imageView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
		[self addSubview:imageView];
		self.imageView = imageView;
		
		FGActivityIndicatorView *activityIndicatorView = [[FGActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		activityIndicatorView.center = CGPointMake((self.bounds.size.width / 2.0),
												   (self.bounds.size.height / 2.0));
		activityIndicatorView.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin |
												  UIViewAutoresizingFlexibleLeftMargin |
												  UIViewAutoresizingFlexibleRightMargin |
												  UIViewAutoresizingFlexibleBottomMargin);
		[self addSubview:activityIndicatorView];
		self.activityIndicatorView = activityIndicatorView;
	}
	
	return self;
}

#pragma mark - Private methods

- (void)cancelPendingTask
{
	[self.activityIndicatorView stopAnimating];
	
	[self.pendingTask cancel], self.pendingTask = nil;
}

#pragma mark - Public methods

- (void)setImageURL:(NSURL *)url
		 completion:(FGLoaderImageViewCompletion)completion
{
	if ([url isEqual:self.imageURL])
		return;
	
	[self clear];
	
	self.imageURL = url;
	
	if (url) {
		[self.activityIndicatorView startAnimating];
		
		[[FGImageLoader sharedLoader] loadImageOnURL:url
										  completion:^(UIImage *image, BOOL cached, NSError *error) {
											  [self.activityIndicatorView stopAnimating];
											  [self cancelPendingTask];
											  
											  [UIView animateWithDuration:0.25
																	delay:0.0
																  options:UIViewAnimationOptionTransitionCrossDissolve
															   animations:^{
																	  self.imageView.image = image;
																  }
															   completion:nil];
											  
											  if (completion) {
												  completion(error);
											  }
										  }];
	}
}

- (void)cancel
{
	[self cancelPendingTask];
}

- (void)clear
{
	[self cancelPendingTask];
	
	self.imageURL = nil;
	self.imageView.image = nil;
}

@end
