# Direction Scope

The identity surface of `swift-direction-primitives` and what it deliberately excludes.

## Identity

`swift-direction-primitives` provides **the canonical binary orientation** — `Direction`, a
pure two-valued polarity (`positive` / `negative`) isomorphic to `Z/2Z`, `Bool`, and the
multiplicative group `{-1, +1}`. It is the atomic sign factor from which oriented and
composite spatial types are built.

## Core targets

- `Direction Primitive` — the root namespace: the `Direction` enum, its `opposite` and
  `sign` operations, and conditional `Codable`. **Zero external dependencies** (the
  [MOD-017] root-target invariant).

## Out of scope

- The `Orientation` abstraction and the domain-specific orientation family (`Horizontal`,
  `Vertical`, `Depth`, `Temporal`): live in `swift-dimension-primitives`. `Direction`
  conforms to `Orientation` retroactively from there ([API-IMPL-018]), so the atom stays
  dependency-free and no `direction ↔ dimension` cycle ([MOD-032]) forms.
- Axis selection (`Axis<N>`): `swift-axis-primitives`.
- Axis × Direction and Directionᴺ composites (`Facet<N>`, `Orthant<N>`):
  `swift-facet-primitives`, `swift-orthant-primitives`.

## Evaluation rule

Sub-target additions are evaluated against this scope. If a proposed addition is OUT of
scope, it extracts to a sibling package, not into this one.
