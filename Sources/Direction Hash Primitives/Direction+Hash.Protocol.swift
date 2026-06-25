// Direction+Hash.Protocol.swift
// Conformance of Direction to Hash.Protocol — unconditional.
//
// Direction is a payload-less enum, so Swift provides `Equatable` / `Hashable` implicitly,
// and the `==` / `hash(into:)` witnesses live in the type's own module (Direction.swift).
// This conformance is therefore empty: those root members witness `Hash.Protocol` (and its
// `Equation.Protocol` refinement). There is deliberately NO explicit `hash(into:)` here (a
// sub-target `hash` clashes with the implicit one — "candidate exactly matches") and NO
// `#if swift(<6.4) extension Direction: Hashable {}` (the implicit `Hashable` covers it).

public import Direction_Primitive
public import Hash_Primitives

extension Direction: Hash.`Protocol` {}
