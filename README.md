# swift-direction-primitives

The canonical binary orientation for the Swift Institute primitives layer.

`Direction` is a pure two-valued polarity (`positive` / `negative`) — isomorphic to `Z/2Z`,
`Bool`, and the multiplicative group `{-1, +1}`. It is the atomic sign factor underlying
oriented and composite spatial primitives (`Facet<N> = Axis<N> × Direction`,
`Orthant<N> = Directionᴺ`).

```swift
import Direction_Primitives

let d: Direction = .positive
d.opposite   // .negative
d.sign       // +1
Direction(sign: -3)   // .negative
```

`Direction` carries no domain interpretation and has **zero external dependencies**.
Domain-specific orientations (`Horizontal`, `Vertical`, `Depth`, `Temporal`) and the
`Orientation` abstraction live in `swift-dimension-primitives`, which conforms `Direction`
to `Orientation` retroactively.

## License

Apache License 2.0. See [LICENSE](LICENSE.md).
