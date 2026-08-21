extension Cardinal {

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
