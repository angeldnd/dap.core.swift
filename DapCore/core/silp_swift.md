# VAR_CLASS(type, value) #
```swift
public class ${type}Var : BaseAspect {
    public override var type: String? { return Vars.Consts.Type${type}Var }
    /*
    public required init(entity: Entity, path: String) {
        super.init(entity: entity, path: path)
    }
    */
    typealias ValueType = ${type}

    private var _value: ${type} = ${value}
    public var value: ${type} {
        get {
            return _value
        }
        set {
            _value = newValue
        }
    }
}
```

