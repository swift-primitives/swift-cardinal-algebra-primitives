# Cardinal Algebra Primitives

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Algebraic-structure witnesses for `Cardinal` — exposes the cardinal numbers (ℕ₀) as a commutative monoid under addition, bridging `Cardinal` to the Swift Institute algebra primitives.

---

## Quick Start

A `Cardinal` is a non-negative count (ℕ₀). Under addition it forms a *commutative monoid* `(ℕ₀, +, 0)`: addition is associative and commutative, and `.zero` is the identity. This package packages that structure as a reusable witness, `Cardinal.monoid`, so monoid-generic algorithms can operate on cardinals without re-deriving the laws at each call site.

```swift
import Cardinal_Algebra_Primitives

// Cardinal under addition is a commutative monoid: (ℕ₀, +, 0).
let monoid = Cardinal.monoid

// Fold a collection through the witness: `identity` seeds the accumulation,
// `combining` accumulates. This is the shape every monoid-generic reduction
// uses — now available for Cardinal.
let counts: [Cardinal] = [3, 5, 8, 1]
let total = counts.reduce(monoid.identity, monoid.combining)   // 17

print(total)   // 17
```

The witness exposes exactly two members: `identity` (the `.zero` cardinal) and `combining` (trapping `+`). It is a *monoid*, not a group, because `Cardinal` has no subtraction operator — subtraction over ℕ₀ requires an explicit policy (saturating or exact), which is out of scope here.

```swift
import Cardinal_Algebra_Primitives

let monoid = Cardinal.monoid
let a = Cardinal(7)

// The monoid laws hold by construction.
print(monoid.combining(monoid.identity, a) == a)         // true  (left identity)
print(monoid.combining(a, monoid.identity) == a)         // true  (right identity)
print(monoid.combining(3, 5) == monoid.combining(5, 3))  // true  (commutativity)
```

Importing `Cardinal_Algebra_Primitives` also re-exports `Cardinal_Primitives` and `Algebra_Semiring_Primitives`, so `Cardinal` itself and the algebra witness namespace (`Algebra.Monoid`) are available from the single import.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-primitives/swift-cardinal-algebra-primitives.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Cardinal Algebra Primitives", package: "swift-cardinal-algebra-primitives"),
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Architecture

Two library products. Depends only on the `Cardinal` and `Algebra` (semiring) primitives, both of which are re-exported.

| Product | Target | Purpose |
|---------|--------|---------|
| `Cardinal Algebra Primitives` | `Sources/Cardinal Algebra Primitives/` | The `Cardinal.monoid` commutative-monoid witness `(ℕ₀, +, 0)`, plus re-exports of `Cardinal_Primitives` and `Algebra_Semiring_Primitives`. |
| `Cardinal Algebra Primitives Test Support` | `Tests/Support/` | Re-exports the main target for test consumers. |

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
