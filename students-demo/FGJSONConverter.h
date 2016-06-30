//
//  FGJSONConverter.h
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FGJSONConverterCompletion)(id object, NSError *error);

@interface FGJSONConverter : NSObject

+ (id)convertDataToJson:(NSData *)data error:(NSError * __autoreleasing *)error;

+ (void)convertDataToJsonInBackground:(NSData *)data completion:(FGJSONConverterCompletion)completion;

@end
