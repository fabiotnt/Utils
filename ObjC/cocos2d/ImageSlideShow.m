//
//  A1_Presentation
//
//  Created by Fábio Lima on 10/11/10.
//  Copyright 2010 Label 1 / A1 Group. All rights reserved.
//

#import "ImageSlideShow.h"

@implementation ImageSlideShow

-(void)removeOldImage {
	
	[self removeChild:oldImage cleanup:NO];
	
}

-(void)setNewImage {
	
	if(currentImage){
		
		oldImage = currentImage;
		[self reorderChild:oldImage z:0];
		
	}
	
	currentImage			= [images objectAtIndex:[imageIndex intValue]];
	currentImage.opacity	= 0;
	[self addChild:currentImage z:1];
	
	//id act1		= [CCEaseExponentialOut actionWithAction:[CCFadeTo actionWithDuration:2 opacity:255]];
	id act1		= [CCFadeTo actionWithDuration:.5f opacity:255];
	id callBack	= [CCCallFunc actionWithTarget:self selector:@selector(removeOldImage)];
	
	[currentImage runAction:[CCSequence actions:act1, callBack, nil]];
	
}

/*------------------------------------------------------------------------------------------------*\
 |* INITIALIZE THE APPLICATION --------------------------------------------------------------------*|
 \*------------------------------------------------------------------------------------------------*/
-(id) init {
	
	if( (self=[super init]) ){
		
		self.isTouchEnabled = YES;
		
		images = [CCArray new];
		[images addObject:[CCSprite spriteWithFile:@"image1.png"]];
		[images addObject:[CCSprite spriteWithFile:@"image2.png"]];
		[images addObject:[CCSprite spriteWithFile:@"image3.png"]];
		[images addObject:[CCSprite spriteWithFile:@"image4.png"]];
		[images addObject:[CCSprite spriteWithFile:@"image5.png"]];
		[images addObject:[CCSprite spriteWithFile:@"image6.png"]];
		[images addObject:[CCSprite spriteWithFile:@"image7.png"]];
		[images addObject:[CCSprite spriteWithFile:@"image8.png"]];
		[images addObject:[CCSprite spriteWithFile:@"image9.png"]];
		[images addObject:[CCSprite spriteWithFile:@"image10.png"]];
		[images addObject:[CCSprite spriteWithFile:@"image11.png"]];
		
		imageIndex = [NSNumber numberWithInt:(arc4random() % ( [images count] - 1 ))];
		
		[self setNewImage];
		
		[self schedule:@selector(changeSlideShowImage:) interval:(arc4random() % 4) + 1];
		//[self schedule:@selector(changeSlideShowImage:) interval:3];
		
	}
	
	return self;
	
}

-(void) changeSlideShowImage:(ccTime)delta {
	
	if( [imageIndex intValue] < [images count] - 1 ){
		
		imageIndex = [NSNumber numberWithInt:[imageIndex intValue] + 1];
		
	} else {
		
		imageIndex = [NSNumber numberWithInt:0];
		
	}
	
	[self setNewImage];
	
}

/*------------------------------------------------------------------------------------------------*\
 |* DISPOSE METHODS -------------------------------------------------------------------------------*|
 \*------------------------------------------------------------------------------------------------*/


//View Did Unload Handler
- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

//Dealloc Method
// on "dealloc" you need to release all your retained objects
- (void)dealloc {
	
	[self removeAllChildrenWithCleanup:YES];
	
	//[self unloadSounds];
	
	// don't forget to call "super dealloc"
	[super dealloc];
	
}

@end
