#import "ObjCWrapper.h"
#include "Calculator.h"

@implementation ObjCWrapper

- (int)addNumber:(int)a withNumber:(int)b {
    return CalculatorModule::add(a, b);
}

- (int)subtractNumber:(int)a withNumber: (int)b {
    return CalculatorModule::subtract(a, b);
}

- (int)multiplyNumber:(int)a withNumber: (int)b {
    return CalculatorModule::multiply(a, b);
}

- (int)divideNumber:(int)a withNumber: (int)b {
    return CalculatorModule::divide(a, b);
}

@end
