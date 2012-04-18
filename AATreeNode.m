#import "AATreeNode.h"


@implementation AATreeNode

@synthesize left;
@synthesize right;
@synthesize level;
@synthesize data;
@synthesize key;


- (id) initWithData:(id)aDataObject boundToKey:(id)aKey {

	if (self = [super init]) {
		self.data = aDataObject;
		self.key = aKey;
		self.level = 1;
	}
	
	return self;
}


- (void) addKeyToArray:(NSMutableArray *)anArray {
	
	[left addKeyToArray:anArray];
	[anArray addObject:[key copy]];
	[right addKeyToArray:anArray];
}


- (id) copyWithZone:(NSZone *)zone {
	
	AATreeNode *copy = [[AATreeNode alloc] initWithData:data boundToKey:key];
	copy.left = [left copy];
	copy.right = [right copy];
	copy.level = level;
	return copy;
}


- (void) printWithIndent:(int)indent {

	if (right) [right printWithIndent:(indent+1)];
	
	NSMutableString *pre = [[NSMutableString alloc] init];
	for (int i=0; i<indent; i++) [pre appendString:@"   "];
	NSLog(@"%@%@-%@(%i)", pre, key, data, level);
	[pre release];
	
	if (left) [left printWithIndent:(indent+1)];
}


- (void) dealloc
{
	[left release];
	[right release];
	[data release];
	[key release];
	[super dealloc];
}


@end
