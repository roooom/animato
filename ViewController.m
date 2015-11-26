//
//  ViewController.m
//  animato
//
//  Created by Roman on 01.09.15.
//  Copyright (c) 2015 Roman. All rights reserved.
//

#import "ViewController.h"
#import "FLAnimatedImageView.h"
#import "FLAnimatedImage.h"
#import "RSPlayPauseButton.h"


@interface ViewController ()
- (IBAction)pauseCick:(id)sender;
- (IBAction)playClick:(id)sender;

@property (strong, nonatomic) FLAnimatedImage *image;

@property (nonatomic,strong) FLAnimatedImageView *imageView;

@property (nonatomic, strong) RSPlayPauseButton *playPauseButton;


@property (nonatomic, strong) NSTimer* timerAnimation;

@property (nonatomic, strong) NSMutableArray* listGif;

- (IBAction)buttonClick:(id)sender;
- (IBAction)popClick:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _imageView = [[FLAnimatedImageView alloc] init];
    _image = [[FLAnimatedImage alloc] init];
    
    _timerAnimation = [[NSTimer alloc] init];

    
    _listGif = [[NSMutableArray alloc] init];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
    
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    
}

- (IBAction)pauseCick:(id)sender {
    //[self.playPauseButton setPaused:NO animated:YES];
    [self.imageView stopAnimating];
}

- (IBAction)playClick:(id)sender {
   // [self.playPauseButton setPaused:YES animated:YES];
    [self.imageView startAnimating];
}
- (IBAction)buttonClick:(id)sender
{
    
    
    [self addOb];
}

- (IBAction)popClick:(id)sender

{
    [self startAnimTimer];
}


-(void) addOb
{
    
   
[_listGif addObject:[NSString stringWithFormat:@"rock"]];
    
    NSLog(@"%@", _listGif);
 
}

-(void)anima: (NSString *) nameStr
{
    NSURL *url1 = [[NSBundle mainBundle] URLForResource:nameStr withExtension:@"gif"];
    NSData *data1 = [NSData dataWithContentsOfURL:url1];
    
    _image = [FLAnimatedImage animatedImageWithGIFData:data1];
    
    
    _imageView.animatedImage = _image;
    
    float widthImage = self.view.bounds.size.width;
    
    _imageView.frame = CGRectMake(10.0, 10.0, widthImage-20,  widthImage-20);
    
    
    [self.view addSubview:_imageView];

    
}

-(void) pop
{
    if (_listGif.count != 0)
    {
        [self anima:[_listGif objectAtIndex:0]];
        [_listGif removeObjectAtIndex:0];
    }
    
    
    
    
}








- (IBAction)startAnimTimer
{
    self.timerAnimation = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                    target:self
                                                  selector:@selector(tickAnimTimer)
                                                  userInfo:nil
                                                   repeats:YES];
}

- (IBAction)stopAnimTimer
{
    if ([_timerAnimation isValid]) {
        [_timerAnimation invalidate];
    }
}

- (void)tickAnimTimer
{
   
    if ([_imageView isAnimating]) {
         NSLog(@" tick");
    }
    else
    {
        [self pop];
         NSLog(@"no tick");
    }
    
}













@end
