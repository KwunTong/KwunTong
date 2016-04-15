
/**
 提示:如果MRC,请粘入以下代码
 
 #if !__has_feature(objc_arc)
 - (id)retain { return _instance; }
 - (id)autorelease { return _instance; }
 - (oneway void)release { }
 - (NSUInteger)retainCount { return UINT_MAX; }
 #endif
 */
#define singletonInterface(className)      + (instancetype)shared##className;

#define singletonImplementation(className) \
static className *_instance; \
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [super allocWithZone:zone]; \
    }); \
    return _instance; \
} \
+ (instancetype)shared##className \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [[self alloc] init]; \
    }); \
    return _instance; \
} \
- (id)copyWithZone:(NSZone *)zone \
{ \
    return _instance; \
}

// 注意最后一行不要使用 \
