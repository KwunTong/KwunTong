
#pragma  mark - 常用颜色

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//部分灰色字体rgb
#define GrayTitleColor  [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0]

/**
 *  controllerView 的背景色
 */
#define BACKGROUND_COLOR           RGBACOLOR(239, 239, 246,1)

/**
 * 暗黑色，目前导航栏均使用该颜色
 */
#define MAGENTA_COLOR              RGBCOLOR(33,47,70)

/**
 * 浅黄色，目前按钮背景使用该颜色
 */
#define LIGHT_YELLOW_COLOR         RGBCOLOR(254,188,9)

/**
 *  用于弹出视图的底层视图的颜色
 */
#define MASK_VIEW_COLOR            [UIColor colorWithWhite:0 alpha:0.7];

/**
 *  微黑
 */
#define WEAK_BLACK_COLOR           RGBCOLOR(0x33, 0x33, 0x33)

/**
 *  浅蓝
 */
#define WEAK_BLUE_COLOR            RGBCOLOR(0x6d, 0x80, 0xb2)

/**
 *  深蓝
 */
#define DEEP_BLUE_COLOR            RGBCOLOR(0x33, 0x3a, 0x4e)

/**
 *  深灰
 */
#define DARK_GRAY_COLOR            RGBCOLOR(0x66, 0x66, 0x66)

/**
 *  微灰
 */
#define WEAK_GRAY_COLOR            RGBCOLOR(0x99, 0x99, 0x99)

/**
 *  深橙
 */
#define DEEP_ORANGE_COLOR          RGBCOLOR(0xff, 0x90, 0x00)
/**
 *  深红
 */
#define DEEP_RED_COLOR          RGBCOLOR(0xff, 0x65, 0x00)
/**
 *  浅红
 */
#define WEAK_RED_COLOR             RGBCOLOR(252, 82, 47)

/**
 *  白色
 */
#define WHITE_COLOR                RGBCOLOR(0xff, 0xff, 0xff)

/**
 * 绿色
 */
#define GREEN_COLOR                RGBCOLOR(0x32, 0xb1, 0x6c)

/**
 *  藏青色
 */
#define DARK_BLUE_COLOR            RGBCOLOR(0x67,0x74,0x91)

/**
 *  分割线颜色
 */
#define CUTTING_LINE_COLOR         RGBCOLOR(0xe8, 0xe8, 0xe8)

/**
 *  导航栏标题颜色
 */

#define NAVI_BAR_TITLE_COLOR       RGBCOLOR(0xf2,0xf2,0xf2)

/**
 *  论坛页色浅蓝色
 */
#define BBS_WEAK_BLUE_COLOR        RGBCOLOR(41, 75, 119)

/**
 *  论坛页 浅青色
 */
#define BBS_WEAK_CYAN_COLOR        RGBCOLOR(0x5d, 0x76, 0x94)

/**
 *  论坛页 浅灰色
 */
#define BBS_WEAK_GRAY_COLOR        RGBCOLOR(0xa9, 0xb1, 0xbf)

/**
 *  论坛页 橙色
 */
#define BBS_WEAK_ORANGE_COLOR        RGBCOLOR(0xee, 0x92, 0x00)


/**
 *  tableview选中颜色
 */
#define TABLE_SELECT_COLOR_LEVEL1  RGBCOLOR(0xf8, 0xf8, 0xf8)
/**
 *  tableview选中颜色
 */
#define TABLE_SELECT_COLOR_LEVEL2  RGBCOLOR(0xf2, 0xf2, 0xf2)


/**
 *  IM 聊天页面背景色
 */
#define IM_BACKAGE_COLOR  RGBCOLOR(0xEF, 0xEF, 0xF6)


#pragma mark - 常用字体


#define PltpBoldFont(a) [UIFont boldSystemFontOfSize:a]
#define PltpFont(a) [UIFont systemFontOfSize:a]



