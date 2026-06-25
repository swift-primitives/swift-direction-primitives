// Direction.swift
// The canonical binary orientation.

/// Canonical axis direction: positive or negative.
///
/// `Direction` represents pure polarity without domain-specific interpretation — the
/// universal binary orientation. Mathematically it is isomorphic to `Z/2Z`, `Bool`, or the
/// multiplicative group `{-1, +1}`.
///
/// `Direction` is an *atom*: it carries no domain meaning and the root target has zero
/// external dependencies. Domain-specific orientations (`Horizontal`, `Vertical`, `Depth`,
/// `Temporal`) and the `Orientation` abstraction live in `swift-dimension-primitives`,
/// which converts to and from `Direction` to make their isomorphism explicit.
///
/// Equality, hashing, and ordering are provided through the institute twins
/// `Equation.Protocol` / `Hash.Protocol` / `Comparison.Protocol` (in the
/// `Direction Equation/Hash/Comparison Primitives` sub-targets); the `==` and `<`
/// operators themselves live here in the root.
///
/// ## Example
///
/// ```swift
/// let dir: Direction = .positive
/// let reversed = dir.opposite   // .negative
/// let s = dir.sign              // +1
/// ```
public enum Direction: Sendable {
    /// Positive direction (increasing coordinate values).
    case positive

    /// Negative direction (decreasing coordinate values).
    case negative
}

// MARK: - Opposite

extension Direction {
    /// Returns the opposite of a direction.
    @inlinable
    public static func opposite(of direction: Direction) -> Direction {
        switch direction {
        case .positive: return .negative
        case .negative: return .positive
        }
    }

    /// Returns the opposite direction.
    @inlinable
    public var opposite: Direction {
        Self.opposite(of: self)
    }
}

// MARK: - Sign

extension Direction {
    /// Sign multiplier: `+1` for positive, `-1` for negative.
    @inlinable
    public var sign: Int {
        switch self {
        case .positive: return 1
        case .negative: return -1
        }
    }

    /// Creates a direction from a sign value.
    ///
    /// - Returns: `.positive` if sign ≥ 0, `.negative` otherwise.
    @inlinable
    public init(sign: Int) {
        self = sign >= 0 ? .positive : .negative
    }
}

// MARK: - Equality, Hashing, Ordering

// `Direction` is a payload-less enum, so the compiler provides `Equatable` / `Hashable`
// implicitly. The `==` / `<` / `hash(into:)` members are declared HERE in the type's own
// module so they witness BOTH the implicit stdlib conformances AND the institute
// `Equation.Protocol` / `Hash.Protocol` / `Comparison.Protocol` twins (whose fork forms
// under Swift <6.4 require explicitly-declared `borrowing` witnesses that the synthesized
// ones do not provide). The twin conformances live — empty — in the
// `Direction Equation/Hash/Comparison Primitives` sub-targets.

extension Direction {
    /// Two directions are equal iff they denote the same polarity.
    @inlinable
    public static func == (lhs: Direction, rhs: Direction) -> Bool {
        lhs.sign == rhs.sign
    }

    /// Orders directions by sign: `.negative` (−1) precedes `.positive` (+1).
    @inlinable
    public static func < (lhs: Direction, rhs: Direction) -> Bool {
        lhs.sign < rhs.sign
    }

    /// Returns `true` if `lhs` does not follow `rhs`.
    @inlinable
    public static func <= (lhs: Direction, rhs: Direction) -> Bool {
        lhs.sign <= rhs.sign
    }

    /// Returns `true` if `lhs` follows `rhs`.
    @inlinable
    public static func > (lhs: Direction, rhs: Direction) -> Bool {
        lhs.sign > rhs.sign
    }

    /// Returns `true` if `lhs` does not precede `rhs`.
    @inlinable
    public static func >= (lhs: Direction, rhs: Direction) -> Bool {
        lhs.sign >= rhs.sign
    }

    /// Feeds the polarity sign into the given hasher.
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(sign)
    }
}

// MARK: - Codable

#if !hasFeature(Embedded)
    extension Direction: Codable {}
#endif
