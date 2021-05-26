#line 1 "Tweak.x"



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBIconListGridLayoutConfiguration; 
static unsigned long long (*_logos_orig$_ungrouped$SBIconListGridLayoutConfiguration$numberOfPortraitRows)(_LOGOS_SELF_TYPE_NORMAL SBIconListGridLayoutConfiguration* _LOGOS_SELF_CONST, SEL); static unsigned long long _logos_method$_ungrouped$SBIconListGridLayoutConfiguration$numberOfPortraitRows(_LOGOS_SELF_TYPE_NORMAL SBIconListGridLayoutConfiguration* _LOGOS_SELF_CONST, SEL); static unsigned long long (*_logos_orig$_ungrouped$SBIconListGridLayoutConfiguration$numberOfPortraitColumns)(_LOGOS_SELF_TYPE_NORMAL SBIconListGridLayoutConfiguration* _LOGOS_SELF_CONST, SEL); static unsigned long long _logos_method$_ungrouped$SBIconListGridLayoutConfiguration$numberOfPortraitColumns(_LOGOS_SELF_TYPE_NORMAL SBIconListGridLayoutConfiguration* _LOGOS_SELF_CONST, SEL); 

#line 3 "Tweak.x"


static unsigned long long _logos_method$_ungrouped$SBIconListGridLayoutConfiguration$numberOfPortraitRows(_LOGOS_SELF_TYPE_NORMAL SBIconListGridLayoutConfiguration* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 
	unsigned long long r = _logos_orig$_ungrouped$SBIconListGridLayoutConfiguration$numberOfPortraitRows(self, _cmd); 
	return r; 
	}

static unsigned long long _logos_method$_ungrouped$SBIconListGridLayoutConfiguration$numberOfPortraitColumns(_LOGOS_SELF_TYPE_NORMAL SBIconListGridLayoutConfiguration* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	unsigned long long rows = numberOfPortraitRows;
	if (rows == 1)
    	return 5;
	return _logos_orig$_ungrouped$SBIconListGridLayoutConfiguration$numberOfPortraitColumns(self, _cmd);
	}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBIconListGridLayoutConfiguration = objc_getClass("SBIconListGridLayoutConfiguration"); { MSHookMessageEx(_logos_class$_ungrouped$SBIconListGridLayoutConfiguration, @selector(numberOfPortraitRows), (IMP)&_logos_method$_ungrouped$SBIconListGridLayoutConfiguration$numberOfPortraitRows, (IMP*)&_logos_orig$_ungrouped$SBIconListGridLayoutConfiguration$numberOfPortraitRows);}{ MSHookMessageEx(_logos_class$_ungrouped$SBIconListGridLayoutConfiguration, @selector(numberOfPortraitColumns), (IMP)&_logos_method$_ungrouped$SBIconListGridLayoutConfiguration$numberOfPortraitColumns, (IMP*)&_logos_orig$_ungrouped$SBIconListGridLayoutConfiguration$numberOfPortraitColumns);}} }
#line 18 "Tweak.x"
