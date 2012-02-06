//
//  TestKVO.m
//  JavaScriptTest
//
//  Created by Tang Xiaoping on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TestKVO.h"


@implementation TestKVO

- (id)init
{
	//@synchronized(self) {
		self = [super init];	
		return self;
	//}
}

-(id) values {
    if (_valueBuffer==nil) {
        _valueBuffer = [[NSMutableDictionary alloc] init];
    }
    return _valueBuffer;
}


- (id)valueForKeyPath:(NSString *)keyPath{
	
	if (![_valueBuffer objectForKey:keyPath]) 
	{
		//buffer has wrong value, need to update it
		[_valueBuffer setValue:@"hello" forKey:keyPath];
	}
	
	NSString *str = [super valueForKeyPath:keyPath];
	NSLog(@"3 retrievedString=%@",str);
    return str;
}

- (void)setValue:(id)value forKeyPath:(NSString *)keyPath {
	[super setValue:value forKeyPath:keyPath];
}
@end
