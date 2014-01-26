//
//  JJReceiverViewController.h
//  HideAndBeak
//
//  Created by Jonathan Jayet on 26/01/2014.
//  Copyright (c) 2014 JJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface JJReceiverViewController : UIViewController<CLLocationManagerDelegate> {
    CLBeaconRegion *beaconRegion;
    CLLocationManager *locationManager;
}

@property (weak, nonatomic) IBOutlet UILabel *beaconFoundLabel;
@property (weak, nonatomic) IBOutlet UILabel *proximityUUIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *majorLabel;
@property (weak, nonatomic) IBOutlet UILabel *minorLabel;
@property (weak, nonatomic) IBOutlet UILabel *accuracyLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *rssiLabel;

@end
