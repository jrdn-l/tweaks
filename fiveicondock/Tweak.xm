%hook SBIconListGridLayoutConfiguration

-(unsigned long long)numberOfPortraitColumns {
	unsigned long long rows = MSHookIvar<unsigned long long>(self, "_numberOfPortraitRows");
	if (rows == 1)
    	return 5;
	return %orig;
	}
%end

