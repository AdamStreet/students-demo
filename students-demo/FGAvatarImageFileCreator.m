//
//  FGAvatarImageFileCreator.m
//  students-demo
//
//  Created by Adam Szabo on 01/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGAvatarImageFileCreator.h"

#import "FGLocalPaths.h"
#import "FGDatabaseManager.h"
#import "FGLogger.h"

@implementation FGAvatarImageFileCreator

#pragma mark - Private methods

+ (NSURL *)avatarContainerURL
{
	return [FGAvatarImageFile avatarImageFilesContainerURL];
}

#pragma mark - Public methods

+ (FGAvatarImageFile *)avatarImageFileWithImage:(UIImage *)image
								databaseManager:(FGDatabaseManager *)databaseManager
{
	FGAvatarImageFile *imageFile = [databaseManager insertEntity:[FGAvatarImageFile entityName]];
	NSString *imageFileName = [FGFile uniqueFileName];
	
	NSURL *fileURL = [FGImageFile persistImage:image
										 onURL:[self avatarContainerURL]
									  filename:imageFileName];
	imageFile.relativePath = [fileURL relativePath];
	
	return imageFile;
}

@end
