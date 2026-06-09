// Direction.swift
// The canonical binary orientation.

/// Canonical axis direction: positive or negative.
///
/// `Direction` represents pure polarity without domain-specific interpretation — the
/// universal binary orientation. Mathematically it is isomorphic to `Z/2Z`, `Bool`, or the
/// multiplicative group `{-1, +1}`.
///
/// `Direction` is an *atom*: it carries no domain meaning and has zero external
/// dependencies. Domain-specific orientations (`Horizontal`, `Vertical`, `Depth`,
/// `Temporal`) and the `Orientation` abstraction live in `swift-dimension-primitives`,
/// which converts to and from `Direction` to make their isomorphism explicit.
///
/// ## Example
///
/// ```swift
/// let dir: Direction = .positive
/// let reversed = dir.opposite   // .negative
/// let s = dir.sign              // +1
/// ```
public enum Direction: Sendable, Hashable {
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
        Direction.opposite(of: self)
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

// MARK: - Codable

#if !hasFeature(Embedded)
    extension Direction: Codable {}
#endif
