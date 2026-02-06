// Cardinal+Monoid.swift

/// Commutative monoid witness for Cardinal under addition.
///
/// Cardinal numbers form a commutative monoid (ℕ₀, +, 0):
/// - Identity: `.zero`
/// - Operation: trapping addition (`+`)
/// - Commutativity: a + b = b + a
///
/// This is not a group because Cardinals have no subtraction operator
/// (subtraction requires policy: saturating or exact).
extension Cardinal {
    @inlinable
    public static var monoid: Algebra.Monoid<Self>.Commutative {
        .init(monoid: .init(
            identity: .zero,
            combining: { $0 + $1 }
        ))
    }
}
