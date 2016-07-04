//
//  FGAvatarImageFileCreator.h
//  students-demo
//
//  Created by Adam Szabo on 01/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FGAvatarImageFile.h"

@class FGDatabaseManager;

@interface FGAvatarImageFileHelper : NSObject

+ (FGAvatarImageFile *)avatarImageFileWithImage:(UIImage *)image
								databaseManager:(FGDatabaseManager *)databaseManager;

+ (void)clearAvatarImageFile:(FGAvatarImageFile *)avatarImageFile
			 databaseManager:(FGDatabaseManager *)databaseManager;

@end
