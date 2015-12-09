//
//  CustomCamera.m
//  Hello World
//
//  Created by Jackson Taylor on 12/8/15.
//
//

#import "CustomCamera.h"

@implementation CustomCamera


- (void)openCamera:(CDVInvokedUrlCommand *)command {
    self.camera = [[CustomCameraViewController alloc] initWithNibName:nil bundle:nil];
    
    [self.viewController presentViewController:self.camera.imagePicker animated:NO completion:nil];
}

@end
