//
//  CaptureViewController.m
//  Capture
//
//  Created by Klemen Zagar on 4. 04. 14.
//  Copyright (c) 2014 Honire d.o.o. All rights reserved.
//

#import "CaptureViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface CaptureViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic)BOOL showCamera;
@property (weak, nonatomic) IBOutlet UIImageView *capturedImage;
@end

@implementation CaptureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.showCamera = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    if (self.showCamera) {
        [super viewDidAppear:animated];
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
        imagePicker.delegate = self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypeCamera;
        imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    
//    imagePicker.mediaTypes =
//    @[(NSString *) kUTTypeImage,
//      (NSString *) kUTTypeMovie];
    
        imagePicker.allowsEditing = YES;
        [self presentViewController:imagePicker
                       animated:NO completion:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.capturedImage.image = chosenImage;
    self.showCamera = NO;
    [picker dismissViewControllerAnimated:NO completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    self.showCamera = NO;
    [picker dismissViewControllerAnimated:NO completion:nil];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
