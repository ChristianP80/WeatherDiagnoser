//
//  ViewController.m
//  WeatherDiagnoser
//
//  Created by Christian Persson on 2018-01-25.
//  Copyright © 2018 Christian Persson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) float temperature;
@property (nonatomic) float windspeed;
@property (weak, nonatomic) IBOutlet UILabel *answer;
@property (weak, nonatomic) IBOutlet UISlider *temperatureSlider;
@property (weak, nonatomic) IBOutlet UISlider *windSpeedSlider;
@property (weak, nonatomic) IBOutlet UILabel *realTemp;
@property (weak, nonatomic) IBOutlet UILabel *realWind;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)generateButton:(id)sender {
    float experience = self.temperature + self.windspeed;
}
-(float)currentTemp {
    return self.temperatureSlider.value;
}
-(float)currentWind {
    return self.windSpeedSlider.value;
}
- (IBAction)sliderChanged:(id)sender {
    [self refresh];
}

-(void)refresh {
    self.temperature = [self currentTemp];
    self.windspeed = [self currentWind];
    self.realTemp.text = [NSString stringWithFormat:@"%.02f C°", self.temperature ];
    self.realWind.text = [NSString stringWithFormat:@"%.02f m/s", self.windspeed];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSString*)feeling:(float)experience {
    NSString *feeling;
    if (experience < 0) {
        feeling = @"Stay inside";
    } else if (experience > 0 && experience <= 10) {
        feeling = @"Take an extra jacket";
    } else if (experience > 10 && experience <= 20 ) {
        feeling = @"Awsome weather, enjoy!!!";
    } else if (experience > 20 && experience <= 35 ) {
        feeling = @"Bring some water";
    } else {
        feeling = @"It´s to hot, stay inside and drink alot of beers";
    }
    return feeling;
}


@end
