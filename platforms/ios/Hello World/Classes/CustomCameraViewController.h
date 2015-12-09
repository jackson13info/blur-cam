//
//  CustomCameraViewController.h
//  Hello World
//
//  Created by Jackson Taylor on 12/8/15.
//
//

#import <UIKit/UIKit.h>

@class CustomCamera;

@interface CustomCameraViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property (nonatomic, retain) UIImagePickerController *imagePicker;

@end
