// Direction+Comparison.Protocol.swift
// Conformance of Direction to Comparison.Protocol — unconditional.
//
// On Swift <6.4, `Comparison.Protocol` is the institute fork supporting `borrowing`
// parameters. On Swift 6.4+, it is a typealias to `Swift.Comparable` per SE-0499 — this
// same extension then satisfies the stdlib `Comparable` conformance. The `<` operator
// itself lives in the root (Direction.swift). The stdlib
// `extension Direction: Comparable {}` below is guarded `#if swift(<6.4)`.

public import Comparison_Primitives
public import Direction_Primitive

extension Direction: Comparison.`Protocol` {}

#if swift(<6.4)
    extension Direction: Comparable {}
#endif
