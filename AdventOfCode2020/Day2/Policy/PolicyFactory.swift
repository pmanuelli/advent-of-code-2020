protocol PolicyFactory {
    func create(from raw: String) -> Policy
}

struct CharacterCountPolicyFactory: PolicyFactory {
    func create(from raw: String) -> Policy {
        return CharacterCountPolicy.from(raw: raw)
    }
}

struct CharacterPositionPolicyFactory: PolicyFactory {
    func create(from raw: String) -> Policy {
        return CharacterPositionPolicy.from(raw: raw)
    }
}
