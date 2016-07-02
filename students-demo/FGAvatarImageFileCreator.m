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

static NSString * const kStoragePathComponent = @"saved_avatars";

@implementation FGAvatarImageFileCreator

+ (FGAvatarImageFile *)avatarImageFileWithImage:(UIImage *)image
								databaseManager:(FGDatabaseManager *)databaseManager
{
	FGAvatarImageFile *imageFile = [databaseManager insertEntity:[FGAvatarImageFile entityName]];
	NSString *imageFileName = [FGFile uniqueFileName];
	NSString *declaredPath = [[FGLocalPaths applicationDocumentsDirectoryURL] absoluteString];
	declaredPath = [declaredPath stringByAppendingPathComponent:kStoragePathComponent];
	
	imageFile.path = [FGImageFile persistImage:image
										onPath:declaredPath
									  filename:imageFileName];
	return imageFile;
}

@end
