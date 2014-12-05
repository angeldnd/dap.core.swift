# PROPERTIES_HELPER(type, swift_type) #
```swift
public func add${type}(path: String, _ value: ${swift_type}) -> ${type}Property? {
    if let v: ${type}Property = addProperty(path, value: value) {
        return v
    }            
    return nil
}

public func remove${type}(path: String) -> ${type}Property? {
    if let v: ${type}Property = remove(path) {
        return v
    }            
    return nil
}

public func is${type}(path: String) -> Bool {
    if let property: ${type}Property = get(path) {
        return true                                    
    }            
    return false               
}

public func get${type}(path: String) -> ${swift_type}? {
    if let property: ${type}Property = get(path) {
        if let value = property.value {
            return value
        }
    }
    return nil 
}

public func set${type}(path: String, _ value: ${swift_type}) -> Bool? {
    if let property: ${type}Property = get(path) {
        return property.setValue(value)
    }
    return nil
}
```

# VARS_HELPER(type, swift_type) #
```swift
public func add${type}(path: String, _ value: ${swift_type}) -> ${type}Var? {
    if let v: ${type}Var = addVar(path, value: value) {
        return v
    }            
    return nil
}

public func remove${type}(path: String) -> ${type}Var? {
    if let v: ${type}Var = remove(path) {
        return v
    }            
    return nil
}

public func is${type}(path: String) -> Bool {
    if let v: ${type}Var = get(path) {
        return true
    }            
    return false
}

public func get${type}(path: String) -> ${swift_type}? {
    if let v: ${type}Var = get(path) {
        return v.value
    }
    return nil 
}

public func set${type}(path: String, _ value: ${swift_type}) -> Bool? {
    if let v: ${type}Var = get(path) {
        return v.setValue(value)
    }
    return nil
}
```

# CONTEXT_PROPERTIES_HELPER(type, swift_type) #
```swift
public func add${type}(path: String, _ value: ${swift_type}) -> ${type}Property? {
    return properties.add${type}(path, value)
}

public func remove${type}(path: String) -> ${type}Property? {
    return properties.remove${type}(path)
}

public func is${type}(path: String) -> Bool {
    return properties.is${type}(path)
}

public func get${type}(path: String) -> ${swift_type}? {
    return properties.get${type}(path)
}

public func set${type}(path: String, _ value: ${swift_type}) -> Bool? {
    return properties.set${type}(path, value)
}
```

