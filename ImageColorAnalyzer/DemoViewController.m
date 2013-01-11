//
//  DemoViewController.m
//  ImageAnalyzer
//

#import "DemoViewController.h"
#import "ImageColorAnalyzer.h"

@interface DemoViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic) UIImage *image;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@end

@implementation DemoViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.image = [UIImage imageNamed:@"AlbumArt"];
    _activityIndicatorView.hidesWhenStopped = YES;
    [_activityIndicatorView stopAnimating];
}

- (BOOL)shouldAutorotate {
    return NO;
}

#pragma mark - Actions

- (IBAction)analyzeButtonPressed:(UIButton *)sender {
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.urlTextField.text]];
    [self.urlTextField resignFirstResponder];
    NSLog(@"image data = %@", imageData);
    self.image = [UIImage imageWithData:imageData];
}

- (IBAction)analyzeLibraryButtonPressed:(UIButton *)sender {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:NULL];
}

#pragma mark - <UIImagePickerControllerDelegate>

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [_activityIndicatorView startAnimating];
    [self dismissViewControllerAnimated:YES completion:^{
        self.image = info[UIImagePickerControllerOriginalImage];
        [_activityIndicatorView stopAnimating];
    }];
}

#pragma mark - Accessing

- (void)setImage:(UIImage *)image
{
    if (image != _image) {
        _image = image;
        
        if (_image) {
            ImageColorAnalyzer *colorAnalyzer = [[ImageColorAnalyzer alloc] initWithImage:_image];
            [colorAnalyzer analyzeImage];
            _primary.textColor = colorAnalyzer.primaryColor;
            _secondary.textColor = colorAnalyzer.secondaryColor;
            _detail.textColor = colorAnalyzer.detailColor;
            _background.textColor = colorAnalyzer.backgroundColor;
            
            _imageView.image = _image;
        }
    }
}

@end
