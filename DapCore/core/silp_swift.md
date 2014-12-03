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
    }
    return false
}
 
``` 



