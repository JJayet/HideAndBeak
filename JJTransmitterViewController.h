//
//  JJFirstViewController.h
//  HideAndBeak
//
//  Created by Jonathan Jayet on 26/01/2014.
//  Copyright (c) 2014 JJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreLocation/CoreLocation.h>

@interface JJTransmitterViewController : UIViewController<CBPeripheralManagerDelegate> {
    CLBeaconRegion *beaconRegion;
    NSDictionary *beaconPeripheralDatas;
    CBPeripheralManager *peripheralManager;
}

@property (weak, nonatomic) IBOutlet UILabel *uuidLabel;
@property (weak, nonatomic) IBOutlet UILabel *majorLabel;
@property (weak, nonatomic) IBOutlet UILabel *minorLabel;
@property (weak, nonatomic) IBOutlet UILabel *identityLabel;

-(IBAction)beginTransmission:(UIButton *)sender;

@end
