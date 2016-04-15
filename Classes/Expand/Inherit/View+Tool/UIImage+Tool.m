//
//  UIImage+Tool.m
//  Copyright (c) 2014年 高万里. All rights reserved.
//

#import "UIImage+Tool.h"

@implementation UIImage (Tool)

/**
 *  返回一张拉伸不变形的图片
 *
 *  @param name 图片名称
 */
+ (UIImage *)resizableImage:(NSString *)name
{
    UIImage *normal = [UIImage imageNamed:name];
    CGFloat w = normal.size.width * 0.5;
    CGFloat h = normal.size.height * 0.5;
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}

/**
 *  保持原来的长宽比，生成一个缩略图
 *  @param asize 需要的长、宽
 *
 */
+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize
{
    UIImage *newimage;
    if (nil == image) {
        newimage = nil;
    }
    else{
        CGSize oldsize = image.size;
        CGRect rect;
        if (asize.width/asize.height > oldsize.width/oldsize.height) {
            rect.size.width = asize.height*oldsize.width/oldsize.height;
            rect.size.height = asize.height;
            rect.origin.x = (asize.width - rect.size.width)/2;
            rect.origin.y = 0;
        }
        else{
            rect.size.width = asize.width;
            rect.size.height = asize.width*oldsize.height/oldsize.width;
            rect.origin.x = 0;
            rect.origin.y = (asize.height - rect.size.height)/2;
        }
        UIGraphicsBeginImageContext(asize);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));//clear background
        [image drawInRect:rect];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}

/**
 *  根据背景颜色和尺寸创建一张图片
 *
 *  @param color 背景颜色
 *  @param size  尺寸
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    @autoreleasepool {
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, rect);
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img;
    }
}

/**
 *  在一个View上截图
 *
 *  @param view 目标View
 *  @param rect 需要截取的范围
 */
+ (UIImage *)imageByScreenshotsWithView:(UIView *)view andRect:(CGRect)rect
{
    // 开启图像上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    // 将View中的内容渲染到图像上下文中
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    // 从上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭图像上下文
    UIGraphicsEndImageContext();
    return image;
}

/**
 *  在一张图片上截图
 *
 *  @param image 目标图片
 *  @param rect  需要截取的范围
 *  @return 返回的是@2x图片
 */
+ (UIImage *)imageByCuttingWithImage:(UIImage *)image andRect:(CGRect)rect
{
    CGFloat pixelsW = rect.size.width * 2;
    CGFloat pixelsH = rect.size.height * 2;
    CGRect pixelsRect = CGRectMake(0, 0, pixelsW, pixelsH);
    CGImageRef subImageRef = CGImageCreateWithImageInRect(image.CGImage, pixelsRect);
    UIImage *subImage = [UIImage imageWithCGImage:subImageRef];
    CGImageRelease(subImageRef);
    return subImage;
}

- (UIImage*)transformWidth:(CGFloat)width

                    height:(CGFloat)height {
    
    
    
    CGFloat destW = width;
    
    CGFloat destH = height;
    
    CGFloat sourceW = width;
    
    CGFloat sourceH = height;
    
    
    
    CGImageRef imageRef = self.CGImage;
    
    CGContextRef bitmap = CGBitmapContextCreate(NULL,
                                                
                                                destW,
                                                
                                                destH,
                                                
                                                CGImageGetBitsPerComponent(imageRef),
                                                
                                                4*destW,
                                                
                                                CGImageGetColorSpace(imageRef),
                                                
                                                (kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst));
    
    
    
    CGContextDrawImage(bitmap, CGRectMake(0, 0, sourceW, sourceH), imageRef);
    
    
    
    CGImageRef ref = CGBitmapContextCreateImage(bitmap);
    
    UIImage *resultImage = [UIImage imageWithCGImage:ref];
    
    CGContextRelease(bitmap);
    
    CGImageRelease(ref);
    
    
    
    return resultImage;
    
}

/**
 *  获得某个像素的颜色
 *
 *  @param point 像素点的位置
 */
/*
- (UIColor *)pixelColorAtLocation:(CGPoint)point {
	UIColor *color = nil;
	CGImageRef inImage = self.CGImage;
	CGContextRef contexRef = [self ARGBBitmapContextFromImage:inImage];
	if (contexRef == NULL) return nil;
	
    size_t w = CGImageGetWidth(inImage);
	size_t h = CGImageGetHeight(inImage);
	CGRect rect = {{0,0},{w,h}};
	
	// Draw the image to the bitmap context. Once we draw, the memory
	// allocated for the context for rendering will then contain the
	// raw image data in the specified color space.
	CGContextDrawImage(contexRef, rect, inImage);
	
	// Now we can get a pointer to the image data associated with the bitmap
	// context.
	unsigned char* data = CGBitmapContextGetData (contexRef);
	if (data != NULL) {
		//offset locates the pixel in the data from x,y.
		//4 for 4 bytes of data per pixel, w is width of one row of data.
		int offset = 4*((w*round(point.y))+round(point.x));
		int alpha =  data[offset];
		int red = data[offset+1];
		int green = data[offset+2];
		int blue = data[offset+3];
        //		NSLog(@"offset: %i colors: RGB A %i %i %i  %i",offset,red,green,blue,alpha);
		color = [UIColor colorWithRed:(red/255.0f) green:(green/255.0f) blue:(blue/255.0f) alpha:(alpha/255.0f)];
	}
	
	// When finished, release the context
	CGContextRelease(contexRef);
	// Free image data memory for the context
	if (data) { free(data); }
	
	return color;
}
 */

/**
 *  根据CGImageRef来创建一个ARGBBitmapContext
 */
/*
- (CGContextRef)ARGBBitmapContextFromImage:(CGImageRef) inImage {
	CGContextRef    context = NULL;
	CGColorSpaceRef colorSpace;
	void *          bitmapData;
	int             bitmapByteCount;
	int             bitmapBytesPerRow;
	
	// Get image width, height. We'll use the entire image.
	size_t pixelsWide = CGImageGetWidth(inImage);
	size_t pixelsHigh = CGImageGetHeight(inImage);
	
	// Declare the number of bytes per row. Each pixel in the bitmap in this
	// example is represented by 4 bytes; 8 bits each of red, green, blue, and
	// alpha.
	bitmapBytesPerRow   = (pixelsWide * 4);
	bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);
	
	// Use the generic RGB color space.
	//colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);  //deprecated
	colorSpace = CGColorSpaceCreateDeviceRGB();
	if (colorSpace == NULL)
	{
		fprintf(stderr, "Error allocating color space\n");
		return NULL;
	}
	
	// Allocate memory for image data. This is the destination in memory
	// where any drawing to the bitmap context will be rendered.
	bitmapData = malloc( bitmapByteCount );
	if (bitmapData == NULL)
	{
		fprintf (stderr, "Memory not allocated!");
		CGColorSpaceRelease( colorSpace );
		return NULL;
	}
	
	// Create the bitmap context. We want pre-multiplied ARGB, 8-bits
	// per component. Regardless of what the source image format is
	// (CMYK, Grayscale, and so on) it will be converted over to the format
	// specified here by CGBitmapContextCreate.
	context = CGBitmapContextCreate (bitmapData,
									 pixelsWide,
									 pixelsHigh,
									 8,      // bits per component
									 bitmapBytesPerRow,
									 colorSpace,
									 (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
	if (context == NULL)
	{
		free (bitmapData);
		fprintf (stderr, "Context not created!");
	}
	
	// Make sure and release colorspace before returning
	CGColorSpaceRelease( colorSpace );

	return context;
    
}
 */


@end
