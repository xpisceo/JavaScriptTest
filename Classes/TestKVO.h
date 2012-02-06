//
//  TestKVO.h
//  JavaScriptTest
//
//  Created by Tang Xiaoping on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TestKVO : NSObject {
   NSMutableDictionary *_valueBuffer;
}
- (id)values;
@end
