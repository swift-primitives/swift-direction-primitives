// Direction Tests.swift

import Testing

import Direction_Primitives

// MARK: - Direction - Static Functions

@Suite
struct `Direction - Static Functions` {
    @Test(arguments: [Direction.positive, Direction.negative])
    func `opposite is involution`(direction: Direction) {
        #expect(Direction.opposite(of: Direction.opposite(of: direction)) == direction)
    }

    @Test
    func `opposite maps positive to negative`() {
        #expect(Direction.opposite(of: .positive) == .negative)
    }

    @Test
    func `opposite maps negative to positive`() {
        #expect(Direction.opposite(of: .negative) == .positive)
    }
}

// MARK: - Direction - Properties

@Suite
struct `Direction - Properties` {
    @Test(arguments: [Direction.positive, Direction.negative])
    func `opposite property delegates to static function`(direction: Direction) {
        #expect(direction.opposite == Direction.opposite(of: direction))
    }

    @Test
    func `sign returns 1 for positive`() {
        #expect(Direction.positive.sign == 1)
    }

    @Test
    func `sign returns -1 for negative`() {
        #expect(Direction.negative.sign == -1)
    }
}

// MARK: - Direction - Initializers

@Suite
struct `Direction - Initializers` {
    @Test
    func `init from non-negative sign creates positive`() {
        #expect(Direction(sign: 0) == .positive)
        #expect(Direction(sign: 1) == .positive)
        #expect(Direction(sign: 100) == .positive)
    }

    @Test
    func `init from negative sign creates negative`() {
        #expect(Direction(sign: -1) == .negative)
        #expect(Direction(sign: -100) == .negative)
    }
}

// MARK: - Direction - Protocol Conformances

@Suite
struct `Direction - Protocol Conformances` {
    @Test(arguments: [Direction.positive, Direction.negative])
    func `Equatable reflexivity`(direction: Direction) {
        #expect(direction == direction)
    }

    @Test
    func `Equatable distinguishes the two cases`() {
        #expect(Direction.positive != Direction.negative)
    }

    @Test
    func `Hashable produces unique hashes`() {
        let set: Set<Direction> = [.positive, .negative, .positive]
        #expect(set.count == 2)
    }
}
