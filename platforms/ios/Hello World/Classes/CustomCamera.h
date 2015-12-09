//
//  CustomCamera.h
//  Hello World
//
//  Created by Jackson Taylor on 12/8/15.
//
//

#import <Cordova/CDV.h>
#import "CustomCameraViewController.h"

@interface CustomCamera : CDVPlugin


- (void)openCamera:(CDVInvokedUrlCommand *)command;

- (void)capturedImageWithPath:(NSString *)imagePath;

@property (strong, nonatomic) CustomCameraViewController *camera;
@property (strong, nonatomic) CDVInvokedUrlCommand *latestCommand;
@property (assign) BOOL hasPendingOperation;

@end
