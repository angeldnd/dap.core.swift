# DATA_TYPE(type, swift_type) #
```
public func is${type}(key: String) -> Bool {
    if let value = _data[key] as? ${swift_type} {
        return true
    }
    return false
}

public func get${type}(key: String) -> ${swift_type}? {
    if let value = _data[key] as? ${swift_type} {
        return value
    }
    return nil
}

public func get${type}(key: String, defaultValue: ${swift_type}) -> ${swift_type} {
    if let value = _data[key] as? ${swift_type} {
        return value
    }
    return defaultValue
}

public func set${type}(key: String, value: ${swift_type}) -> Bool {
    if _data[key] == nil {
        _data[key] = value
        return true
    }
    return false
}
 
``` 

# DATA_NUMBER_TYPE(type, swift_type, ns_type) #
```
public func is${type}(key: String) -> Bool {
    if let _value = _data[key] {
        if let value = _value as? ${swift_type} {
            return true
        } else if let value = _value as? NSNumber {
            return true
        }
    }
    return false
}

public func get${type}(key: String) -> ${swift_type}? {
    if let _value = _data[key] {
        if let value = _value as? ${swift_type} {
            return value
        } else if let value = _value as? NSNumber {
            return value.${ns_type}Value
        }
    }
    return nil
}

public func get${type}(key: String, defaultValue: ${swift_type}) -> ${swift_type} {
    if let _value = _data[key] {
        if let value = _value as? ${swift_type} {
            return value
        } else if let value = _value as? NSNumber {
            return value.${ns_type}Value
        }
    }
    return defaultValue
}

public func set${type}(key: String, value: ${swift_type}) -> Bool {
    if _data[key] == nil {
        _data[key] = value
        return true
    }
    return false
}
 
``` 

# VAR_CLASS(type, swift_type) #
```
public class ${type}Var : BaseAspect, Var {
    public typealias ValueType = ${swift_type}
    
    public override var type: String? {
        return Vars.Consts.Type${type}Var
    }
    
    public required init(entity: Entity, path: String) {
        super.init(entity: entity, path: path)
    }
    
    private var _value: ${swift_type}?
    public var value: ${swift_type}? {
        return _value
    }
    
    public func setValue(newValue: ${swift_type}?) -> Bool {
        _value = newValue
        return true
    }
    
    public override func encode() -> Data? {
        if let data = super.encode() {
            if _value != nil {
                if data.set${type}(Vars.Consts.KeyValue, value: _value!) {
                    return data
                }
            }
        }
        return nil;
    }
    
    public override func decode(data: Data) -> Bool {
        if !super.decode(data) { return false }
        
        _value = data.get${type}(Vars.Consts.KeyValue)
        return true;
    }
}

```