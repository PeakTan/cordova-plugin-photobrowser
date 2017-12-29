/********* PhotoBrowser.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XLPhotoBrowser.h"
#import "SDImageCache.h"

@interface PhotoBrowser : CDVPlugin <XLPhotoBrowserDelegate, XLPhotoBrowserDatasource>

@property (nonatomic, strong) NSMutableArray *imageUrls;
- (void)show:(CDVInvokedUrlCommand*)command;

@end

@implementation PhotoBrowser

- (void)show:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSArray *urls = [command.arguments objectAtIndex:0];
    NSInteger index = [[command.arguments objectAtIndex:1] integerValue];
    
    if (urls && urls.count > 0) {
        index = self.imageUrls.count > index ? index : 0;
        self.imageUrls = [NSMutableArray array];
        for (NSString *urlStr in urls) {
            NSURL *url = [NSURL URLWithString:urlStr];
            [self.imageUrls addObject:url];
        }
        [XLPhotoBrowser showPhotoBrowserWithImages:self.imageUrls currentImageIndex:index];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end

