//
//  FGMenuItemProvider.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGMenuItemProvider.h"

NSString * const FGMenuItemIdentifierListOfStudents = @"list";
NSString * const FGMenuItemIdentifierAddStudent = @"add";

static NSString * const kMenuItemsFileName = @"MenuItems";
static NSString * const kMenuItemsFileExtension = @"plist";

static NSString * const kMenuItemsMetadataIdentifierKey = @"identifier";
static NSString * const kMenuItemsMetadataImageNameKey = @"imageName";
static NSString * const kMenuItemsMetadataTitleKey = @"title";

@implementation FGMenuItemProvider

+ (NSArray<FGMenuItem *> *)loadMenuItems
{
	NSString *path = [[NSBundle mainBundle] pathForResource:kMenuItemsFileName
													 ofType:kMenuItemsFileExtension];
	
	NSAssert2(path, @"File cannot be found in bundle: %@.%@", kMenuItemsFileName, kMenuItemsFileExtension);
	
	NSArray *menuItemsMetadata = [NSArray arrayWithContentsOfFile:path];
	
	NSAssert1(menuItemsMetadata, @"File cannot be opened on path: %@", path);
	
	NSMutableArray *menuItems = [NSMutableArray arrayWithCapacity:[menuItemsMetadata count]];
	
	[menuItemsMetadata enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		NSString *imageName = [obj objectForKey:kMenuItemsMetadataImageNameKey];
		
		FGMenuItem *menuItem = [[FGMenuItem alloc] initWithIdentifier:[obj objectForKey:kMenuItemsMetadataIdentifierKey]
																title:[obj objectForKey:kMenuItemsMetadataTitleKey]
																image:(imageName? [UIImage imageNamed:imageName] : nil)];
		[menuItems addObject:menuItem];
		;
	}];
	
	return [menuItems copy];
}

@end
