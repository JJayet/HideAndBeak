//
//  JJFirstViewController.m
//  HideAndBeak
//
//  Created by Jonathan Jayet on 26/01/2014.
//  Copyright (c) 2014 JJ. All rights reserved.
//

#import "JJTransmitterViewController.h"

@interface JJTransmitterViewController ()

@end

@implementation JJTransmitterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initBeaconTransmitter];
    [self setLabels];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)initBeaconTransmitter {
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"8E568779-19B9-4EC6-A8AE-8074EA1279BC"];
    beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid
                                                           major:1
                                                           minor:1
                                                      identifier:@"com.jjayet.HideAndBeak"];
}

- (void)setLabels {
    self.uuidLabel.text = beaconRegion.proximityUUID.UUIDString;
    self.majorLabel.text = [NSString stringWithFormat:@"%@", beaconRegion.major];
    self.minorLabel.text = [NSString stringWithFormat:@"%@", beaconRegion.minor];
    self.identityLabel.text = beaconRegion.identifier;
}

-(IBAction)beginTransmission:(UIButton *)sender {
    beaconPeripheralDatas = [beaconRegion peripheralDataWithMeasuredPower:nil];
    peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self
                                                                queue:nil
                                                              options:nil];
}

-(void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        NSLog(@"Powered on !");
        [peripheralManager startAdvertising:beaconPeripheralDatas];
    }
    else if (peripheral.state == CBPeripheralManagerStatePoweredOff) {
        NSLog(@"Powered off");
        [peripheralManager stopAdvertising];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
