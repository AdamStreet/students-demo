//
//  FGAvatarImageFileCreator.m
//  students-demo
//
//  Created by Adam Szabo on 01/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGAvatarImageFileHelper.h"

#import "FGLocalPaths.h"
#import "FGDatabaseManager.h"
#import "FGLogger.h"
#import "FGStudent.h"

@implementation FGAvatarImageFileHelper

#pragma mark - Private methods

+ (NSURL *)avatarContainerURL
{
	return [FGAvatarImageFile avatarImageFilesContainerURL];
}

#pragma mark - Public methods

+ (FGAvatarImageFile *)avatarImageFileWithImage:(UIImage *)image
								databaseManager:(FGDatabaseManager *)databaseManager
{
	NSParameterAssert(databaseManager);
	
	FGAvatarImageFile *imageFile = [databaseManager insertEntity:[FGAvatarImageFile entityName]];
	NSString *imageFileName = [FGFile uniqueFileName];
	
	NSURL *fileURL = [FGImageFile persistImage:image
										 onURL:[self avatarContainerURL]
									  filename:imageFileName];
	imageFile.relativePath = [fileURL relativePath];
	
	return imageFile;
}

+ (void)clearAvatarImageFile:(FGAvatarImageFile *)avatarImageFile
			 databaseManager:(FGDatabaseManager *)databaseManager
{
	NSParameterAssert(databaseManager);
	
	if (!avatarImageFile)
		return;
	
	[databaseManager deleteEntity:avatarImageFile];
}

@end
