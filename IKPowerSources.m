//
//  Created by Ilya Kulakov on 09.10.11.
//  Copyright 2011 kulakov.ilya@gmail.com All rights reserved.
//

#import <IOKit/ps/IOPSKeys.h>
#import "IKPowerSources.h"


// http://opensource.apple.com/source/IOKitUser/IOKitUser-514.16.50/pwr_mgt.subproj/IOPMLibPrivate.h
#ifndef kIOPMUPSPowerKey
#define kIOPMUPSPowerKey "UPS Power"
#endif

#ifndef kIOPMBatteryPowerKey
#define kIOPMBatteryPowerKey "Battery Power"
#endif

#ifndef kIOPMACPowerKey
#define kIOPMACPowerKey "AC Power"
#endif


IKPowerSourceType IKGetProvidingPowerSourceType(void)
{
    CFTypeRef powerSource = IOPSCopyPowerSourcesInfo();
    CFStringRef type = IOPSGetProvidingPowerSourceType(powerSource);
    CFRelease(powerSource);
    if (CFStringCompare(type, CFSTR(kIOPSBatteryPowerValue), 0) == kCFCompareEqualTo)
        return IKBatteryPowerType;
    else if (CFStringCompare(type, CFSTR(kIOPMBatteryPowerKey), 0) == kCFCompareEqualTo)
        return IKUPSPowerType;
    else
        return IKACPowerType;
}