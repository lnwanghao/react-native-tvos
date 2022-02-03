/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "RCTRootComponentView.h"

#import <react/renderer/components/root/RootComponentDescriptor.h>
#import <react/renderer/components/root/RootProps.h>
#import "RCTConversions.h"

#if TARGET_OS_TV
#import "RCTTVRemoteHandler.h"
#endif

using namespace facebook::react;

@implementation RCTRootComponentView

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const RootProps>();
    _props = defaultProps;
#if TARGET_OS_TV
      self.tvRemoteHandler = [[RCTTVRemoteHandler alloc] initWithView:self];
#endif
  }

  return self;
}

- (void)dealloc
{
#if TARGET_OS_TV
  self.tvRemoteHandler = nil;
#endif
}

#pragma mark - RCTComponentViewProtocol

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<RootComponentDescriptor>();
}

@end
