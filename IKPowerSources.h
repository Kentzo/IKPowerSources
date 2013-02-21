//
//  Created by Ilya Kulakov on 09.10.11.
//  Copyright 2011 kulakov.ilya@gmail.com All rights

#import <IOKit/ps/IOPowerSources.h>
#import <CoreFoundation/CoreFoundation.h>


typedef enum {
    IKACPowerType,
    IKBatteryPowerType,
    IKUPSPowerType
} IKPowerSourceType;


/*!
 @abstract  Similar to IOPSGetProvidingPowerSourceType, but returns enum values instead.
 @see       IOPSGetProvidingPowerSourceType
 */
IKPowerSourceType IKGetProvidingPowerSourceType(void);
