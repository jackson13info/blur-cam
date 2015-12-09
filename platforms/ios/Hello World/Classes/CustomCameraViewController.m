//
//  CustomCameraViewController.m
//  Hello World
//
//  Created by Jackson Taylor on 12/8/15.
//
//

#import "CustomCameraViewController.h"

@interface CustomCameraViewController ()
@property (nonatomic, retain) CAShapeLayer *circle;
@end

@implementation CustomCameraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        CGRect mainScreen = [[UIScreen mainScreen] bounds];
        UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
        [blurView setFrame:mainScreen];
        
        
        UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake((mainScreen.size.width/2.0)-100, (mainScreen.size.height/2.0)-100, 200, 200)];
        [centerView setBackgroundColor:[UIColor clearColor]];
        [blurView addSubview:centerView];
        
        CAShapeLayer *baseCircle = [CAShapeLayer layer];
        [baseCircle setFrame:CGRectMake(50, 0, 100, 100)];
        [baseCircle setPath:[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)].CGPath];
        [baseCircle setStrokeColor:[UIColor colorWithRed:0.3 green:0.31 blue:0.28 alpha:1].CGColor];
        [baseCircle setStrokeStart:0.0];
        [baseCircle setStrokeEnd:1.0];
        [baseCircle setFillColor:[UIColor clearColor].CGColor];
        [baseCircle setLineWidth:3.0];
        [centerView.layer addSublayer:baseCircle];
        
        
        self.circle = [CAShapeLayer layer];
        [self.circle setFrame:CGRectMake(50, 0, 100, 100)];
        [self.circle setPath:[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)].CGPath];
        [self.circle setStrokeColor:[UIColor colorWithRed:0.21 green:0.74 blue:0.7 alpha:1].CGColor];
        [self.circle setStrokeStart:0.0];
        [self.circle setStrokeEnd:0.25];
        [self.circle setFillColor:[UIColor clearColor].CGColor];
        [self.circle setLineWidth:3.0];
        [centerView.layer addSublayer:self.circle];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, 200, 60)];
        [label setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:14.0]];
        [label setTextColor:[UIColor whiteColor]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setLineBreakMode:NSLineBreakByWordWrapping];
        [label setNumberOfLines:0];
        [label setText:@"One moment while we connect you with a doctor."];
        [centerView addSubview:label];
        
        [self.view addSubview:blurView];
        
        UIButton *cancel = [[UIButton alloc] initWithFrame:CGRectMake(0, mainScreen.size.height-60, mainScreen.size.width, 60)];
        [cancel setTitle:@"Cancel" forState:UIControlStateNormal];
        [cancel setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [cancel.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:14.0]];
        [cancel addTarget:self action:@selector(cancelButton) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:cancel];
        
        
        self.imagePicker = [[UIImagePickerController alloc] init];
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        self.imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        self.imagePicker.showsCameraControls = NO;
        self.imagePicker.delegate = self;
        float scale = mainScreen.size.height / 400;
        self.imagePicker.cameraViewTransform = CGAffineTransformScale(self.imagePicker.cameraViewTransform, scale, scale);
        
        self.imagePicker.view.frame = mainScreen;
        self.imagePicker.cameraOverlayView = self.view;
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"View Did Load HERE");
    // Do any additional setup after loading the view.
    dispatch_async(dispatch_get_main_queue(), ^{
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        [animation setDuration:1.0];
        [animation setRepeatCount:INT_MAX];
        [animation setRemovedOnCompletion:NO];
        [animation setFromValue:@(0)];
        [animation setToValue:@(2.0 * M_PI)];
        [animation setFillMode:kCAFillModeForwards];
        [self.circle addAnimation:animation forKey:@"rotate"];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)cancelButton {
    [self.imagePicker dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
