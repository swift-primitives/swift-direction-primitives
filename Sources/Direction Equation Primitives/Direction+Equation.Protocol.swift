// Direction+Equation.Protocol.swift
// Conformance of Direction to Equation.Protocol — unconditional.
//
// On Swift <6.4, `Equation.Protocol` is the institute fork supporting `borrowing`
// parameters. On Swift 6.4+, it is a typealias to `Swift.Equatable` per SE-0499 — this
// same extension then satisfies the stdlib `Equatable` conformance directly. The stdlib
// `extension Direction: Hashable {}` in `Direction Hash Primitives` (which implies
// `Equatable`) is guarded `#if swift(<6.4)` to avoid duplicate-conformance.

public import Direction_Primitive
public import Equation_Primitives

extension Direction: Equation.`Protocol` {}
