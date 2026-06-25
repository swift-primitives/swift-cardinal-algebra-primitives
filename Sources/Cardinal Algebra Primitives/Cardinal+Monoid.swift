// Cardinal+Monoid.swift

extension Cardinal {
    /// The commutative monoid witness for `Cardinal` under addition.
    ///
    /// Cardinal numbers form a commutative monoid (ℕ₀, +, 0):
    /// - Identity: `.zero`
    /// - Operation: trapping addition (`+`)
    /// - Commutativity: `a + b == b + a`
    ///
    /// This is not a group because `Cardinal` has no subtraction operator;
    /// subtraction requires a policy (saturating or exact).
    @inlinable
    public static var monoid: Algebra.Monoid<Self>.Commutative {
        .init(
            monoid: .init(
                identity: .zero,
                combining: { $0 + $1 }
            )
        )
    }
}
