#include "prefRootListController.h"

@implementation prefRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}
-(void)respring {
  [HBRespringController respring];
}
@end
