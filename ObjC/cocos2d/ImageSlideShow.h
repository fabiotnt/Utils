//
//  A1_Presentation
//
//  Created by Fábio Lima on 10/11/10.
//  Copyright 2010 Label 1 / A1 Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ImageSlideShow : CCLayer {
	
	NSNumber	*imageIndex;
	CCArray		*images;
	CCSprite	*currentImage;
	CCSprite	*oldImage;
	
}

@end