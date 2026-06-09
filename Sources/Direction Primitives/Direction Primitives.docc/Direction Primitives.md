# ``Direction_Primitives``

@Metadata {
    @DisplayName("Direction Primitives")
    @TitleHeading("Swift Institute — Primitives Layer")
}

The canonical binary orientation — `Direction`, a pure two-valued polarity isomorphic to `Z/2Z`.

## Overview

`Direction Primitives` ships ``Direction_Primitive/Direction``, an enum with exactly two cases — `positive` and `negative` — modelling the canonical sign factor of N-dimensional space. It is isomorphic to `Z/2Z`, `Bool`, and the multiplicative group `{-1, +1}`.

`Direction` is an **atom**: it carries no domain interpretation and has zero external dependencies. Domain-specific orientations (`Horizontal`, `Vertical`, `Depth`, `Temporal`) and the `Orientation` abstraction live in `swift-dimension-primitives`, which conforms `Direction` to `Orientation` retroactively so this package stays dependency-free. Composite spatial types build on `Direction`: `Facet<N>` pairs an `Axis<N>` with a `Direction`, and `Orthant<N>` is an `N`-tuple of `Direction`s.

## Topics

### Essentials

- <doc:Direction-Scope>

### Core Type

- ``Direction_Primitive/Direction``
