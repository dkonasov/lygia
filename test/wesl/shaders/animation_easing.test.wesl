// Native WESL tests for animation easing functions

import wgsl_test::{expectNear, expectNearVec4};
import dkonasov__lygia::math::consts::INV_SQRT2;
import dkonasov__lygia::animation::easing::backIn::backIn;
import dkonasov__lygia::animation::easing::backOut::backOut;
import dkonasov__lygia::animation::easing::backInOut::backInOut;
import dkonasov__lygia::animation::easing::bounceIn::bounceIn;
import dkonasov__lygia::animation::easing::bounceOut::bounceOut;
import dkonasov__lygia::animation::easing::bounceInOut::bounceInOut;
import dkonasov__lygia::animation::easing::circularIn::circularIn;
import dkonasov__lygia::animation::easing::circularOut::circularOut;
import dkonasov__lygia::animation::easing::circularInOut::circularInOut;
import dkonasov__lygia::animation::easing::cubicIn::cubicIn;
import dkonasov__lygia::animation::easing::cubicOut::cubicOut;
import dkonasov__lygia::animation::easing::cubicInOut::cubicInOut;
import dkonasov__lygia::animation::easing::elasticIn::elasticIn;
import dkonasov__lygia::animation::easing::elasticOut::elasticOut;
import dkonasov__lygia::animation::easing::elasticInOut::elasticInOut;
import dkonasov__lygia::animation::easing::exponentialIn::exponentialIn;
import dkonasov__lygia::animation::easing::exponentialOut::exponentialOut;
import dkonasov__lygia::animation::easing::exponentialInOut::exponentialInOut;
import dkonasov__lygia::animation::easing::linearIn::linearIn;
import dkonasov__lygia::animation::easing::linearOut::linearOut;
import dkonasov__lygia::animation::easing::linearInOut::linearInOut;
import dkonasov__lygia::animation::easing::quadraticIn::quadraticIn;
import dkonasov__lygia::animation::easing::quadraticOut::quadraticOut;
import dkonasov__lygia::animation::easing::quadraticInOut::quadraticInOut;
import dkonasov__lygia::animation::easing::quarticIn::quarticIn;
import dkonasov__lygia::animation::easing::quarticOut::quarticOut;
import dkonasov__lygia::animation::easing::quarticInOut::quarticInOut;
import dkonasov__lygia::animation::easing::quinticIn::quinticIn;
import dkonasov__lygia::animation::easing::quinticOut::quinticOut;
import dkonasov__lygia::animation::easing::quinticInOut::quinticInOut;
import dkonasov__lygia::animation::easing::sineIn::sineIn;
import dkonasov__lygia::animation::easing::sineOut::sineOut;
import dkonasov__lygia::animation::easing::sineInOut::sineInOut;

// Back easing
@test
fn testBackIn() { expectNear(backIn(0.5), -0.375); }

@test
fn testBackOut() { expectNear(backOut(0.5), 1.375); }

@test
fn testBackInOut() {
  expectNearVec4(
    vec4f(backInOut(0.0), backInOut(0.25), backInOut(0.75), backInOut(1.0)),
    vec4f(0.0, -0.1875, 1.1875, 1.0)
  );
}

// Bounce easing
@test
fn testBounceIn() { expectNear(bounceIn(0.5), 0.28125); }

@test
fn testBounceOut() { expectNear(bounceOut(0.5), 0.71875); }

@test
fn testBounceInOut() {
  expectNearVec4(
    vec4f(bounceInOut(0.0), bounceInOut(0.25), bounceInOut(0.75), bounceInOut(1.0)),
    vec4f(0.0, 0.140625, 0.859375, 1.0)
  );
}

// Circular easing
@test
fn testCircularIn() { expectNear(circularIn(0.5), 0.134); }

@test
fn testCircularOut() { expectNear(circularOut(0.5), 0.866); }

@test
fn testCircularInOut() {
  expectNearVec4(
    vec4f(circularInOut(0.0), circularInOut(0.25), circularInOut(0.75), circularInOut(1.0)),
    vec4f(0.0, 0.067, 0.933, 1.0)
  );
}

// Cubic easing
@test
fn testCubicIn() { expectNear(cubicIn(0.5), 0.125); }

@test
fn testCubicOut() { expectNear(cubicOut(0.5), 0.875); }

@test
fn testCubicInOut() {
  expectNearVec4(
    vec4f(cubicInOut(0.0), cubicInOut(0.25), cubicInOut(0.75), cubicInOut(1.0)),
    vec4f(0.0, 0.0625, 0.9375, 1.0)
  );
}

// Elastic easing
@test
fn testElasticIn() { expectNear(elasticIn(0.5), -0.0221); }

@test
fn testElasticOut() { expectNear(elasticOut(0.5), 1.0221); }

@test
fn testElasticInOut() {
  expectNearVec4(
    vec4f(elasticInOut(0.0), elasticInOut(0.25), elasticInOut(0.75), elasticInOut(1.0)),
    vec4f(0.0, -0.01105, 1.01105, 1.0)
  );
}

// Exponential easing
@test
fn testExponentialIn() { expectNear(exponentialIn(0.5), 0.03125); }

@test
fn testExponentialOut() { expectNear(exponentialOut(0.5), 0.96875); }

@test
fn testExponentialInOut() {
  expectNearVec4(
    vec4f(exponentialInOut(0.0), exponentialInOut(0.25), exponentialInOut(0.75), exponentialInOut(1.0)),
    vec4f(0.0, 0.015625, 0.984375, 1.0)
  );
}

// Linear easing
@test
fn testLinearIn() { expectNear(linearIn(0.5), 0.5); }

@test
fn testLinearOut() { expectNear(linearOut(0.5), 0.5); }

@test
fn testLinearInOut() { expectNear(linearInOut(0.5), 0.5); }

// Quadratic easing
@test
fn testQuadraticIn() { expectNear(quadraticIn(0.5), 0.25); }

@test
fn testQuadraticOut() { expectNear(quadraticOut(0.5), 0.75); }

@test
fn testQuadraticInOut() {
  expectNearVec4(
    vec4f(quadraticInOut(0.0), quadraticInOut(0.25), quadraticInOut(0.75), quadraticInOut(1.0)),
    vec4f(0.0, 0.125, 0.875, 1.0)
  );
}

// Quartic easing
@test
fn testQuarticIn() { expectNear(quarticIn(0.5), 0.0625); }

@test
fn testQuarticOut() { expectNear(quarticOut(0.5), 0.9375); }

@test
fn testQuarticInOut() {
  expectNearVec4(
    vec4f(quarticInOut(0.0), quarticInOut(0.25), quarticInOut(0.75), quarticInOut(1.0)),
    vec4f(0.0, 0.03125, 0.96875, 1.0)
  );
}

// Quintic easing
@test
fn testQuinticIn() { expectNear(quinticIn(0.5), 0.03125); }

@test
fn testQuinticOut() { expectNear(quinticOut(0.5), 1.03125); }

@test
fn testQuinticInOut() { expectNear(quinticInOut(0.5), 1.5); }

// Sine easing
@test
fn testSineIn() { expectNear(sineIn(0.5), 1.0 - INV_SQRT2); }

@test
fn testSineOut() { expectNear(sineOut(0.5), INV_SQRT2); }

@test
fn testSineInOut() {
  expectNearVec4(
    vec4f(sineInOut(0.0), sineInOut(0.25), sineInOut(0.75), sineInOut(1.0)),
    vec4f(0.0, (1.0 - INV_SQRT2) / 2.0, (1.0 + INV_SQRT2) / 2.0, 1.0)
  );
}
