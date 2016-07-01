//
//  FGLoaderImageView.h
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGView.h"

#import "FGImageView.h"

typedef void(^FGLoaderImageViewCompletion)(NSError *error);

@interface FGLoaderImageView : FGView

@property (nonatomic, readonly) NSURL *imageURL;

@property (nonatomic, readonly) FGImageView *imageView;
@property (nonatomic) BOOL showLoadingIndicator;

- (void)setImageURL:(NSURL *)url
completion:(FGLoaderImageViewCompletion)completion;

- (void)cancel;

- (void)clear;

@end
