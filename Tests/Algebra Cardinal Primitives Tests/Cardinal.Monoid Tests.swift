import Testing

import Algebra_Cardinal_Primitives

@Suite("Cardinal.Monoid Tests")
struct CardinalMonoidTests {
    @Suite struct Unit {}
}

extension CardinalMonoidTests.Unit {
    @Test
    func `identity is zero`() {
        let monoid = Cardinal.monoid
        #expect(monoid.identity == .zero)
    }

    @Test
    func `combining matches addition`() {
        let monoid = Cardinal.monoid
        let a = Cardinal(3)
        let b = Cardinal(5)
        #expect(monoid.combining(a, b) == a + b)
    }

    @Test
    func `identity left`() {
        let monoid = Cardinal.monoid
        let a = Cardinal(7)
        #expect(monoid.combining(monoid.identity, a) == a)
    }

    @Test
    func `identity right`() {
        let monoid = Cardinal.monoid
        let a = Cardinal(7)
        #expect(monoid.combining(a, monoid.identity) == a)
    }

    @Test
    func `commutativity`() {
        let monoid = Cardinal.monoid
        let a = Cardinal(3)
        let b = Cardinal(5)
        #expect(monoid.combining(a, b) == monoid.combining(b, a))
    }
}
