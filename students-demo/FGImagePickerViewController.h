//
//  FGImagePickerViewController.h
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGViewController.h"

typedef void(^FGImagePickerViewControllerCompletionHandler)(UIImage *image);

@interface FGImagePickerViewController : FGViewController

@property (nonatomic, copy) FGImagePickerViewControllerCompletionHandler completion;

@end
