# flutter_appauth_scene_delegate
Demo project for fixing PresentinvViewController error

## Warning: This project is setup to reproduce an error in flutter_appauth when using SceneDelegate.

This error can be fixed with a solution developed by @jeroldalbertson-wf . 
This solution includes changes the assignment of the rootViewController in AppAuthIOSAuthorization.m performAuthorization and performEndSessionRequest to:

````
    UIViewController *rootViewController;
    if (@available(iOS 13, *)) {
      rootViewController = [[UIApplication sharedApplication].windows filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id window, NSDictionary *bindings) {
        return [window isKeyWindow];
      }]].firstObject.rootViewController;
    } else {
      rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    }
````
