# DECLARE_LIST(name, var_name, swift_type, list_name) #
```
private func getIndexOf${name}(${var_name}: ${swift_type}) -> Int? {
    for (i, obj) in enumerate(${list_name}) {
        if obj === ${var_name} {
            return i
        }
    }
    return nil
}

public final func add${name}(${var_name}: ${swift_type}) -> Bool {
    if getIndexOf${name}(${var_name}) == nil {
        ${list_name}.append(${var_name})
        return true
    }
    return false
}

public final func remove${name}(${var_name}: ${swift_type}) -> Bool {
    if let index = getIndexOf${name}(${var_name}) {
        ${list_name}.removeAtIndex(index)
        return true
    }
    return false
}
``` 

# ADD_REMOVE_HELPER(name, a_path, a_var, a_type, l_name, l_var, l_type) #
``` 
public func add${name}(${a_path}: String, ${l_var}: ${l_type}) -> Bool {
    if let ${a_var}: ${a_type} = get(${a_path}) {
        return ${a_var}.add${l_name}(${l_var})
    }
    return false
}

public func remove${name}(${a_path}: String, ${l_var}: ${l_type}) -> Bool {
    if let ${a_var}: ${a_type} = get(${a_path}) {
        return ${a_var}.remove${l_name}(${l_var})
    }
    return false
}
``` 

# PROPERTY_CLASS(type, swift_type) #
```
public protocol ${type}ValueChecker : class {
    func isValid(propertyPath: String, value: ${swift_type}?, newValue: ${swift_type}?) -> Bool
}

public protocol ${type}ValueWatcher : class {
    func onChanged(propertyPath: String, lastValue: ${swift_type}?, value: ${swift_type}?) -> Void
}

public class ${type}Property : ${type}Var, Property {
    public typealias ValueChecker = ${type}ValueChecker
    public typealias ValueWatcher = ${type}ValueWatcher

    public override var type: String? {
        return Properties.Consts.Type${type}Property
    }
    
    public required init(entity: Entity, path: String) {
        super.init(entity: entity, path: path)
    }
    
    private var _checkers = [ValueChecker]()
    private var _watchers = [ValueWatcher]()
    
    private func getIndexOfValueChecker(checker: ValueChecker) -> Int? {
        for (i, obj) in enumerate(_checkers) {
            if obj === checker {
                return i
            }
        }
        return nil
    }

    public final func addValueChecker(checker: ValueChecker) -> Bool {
        if getIndexOfValueChecker(checker) == nil {
            _checkers.append(checker)
            return true
        }
        return false
    }

    public final func removeValueChecker(checker: ValueChecker) -> Bool {
        if let index = getIndexOfValueChecker(checker) {
            _checkers.removeAtIndex(index)
            return true
        }
        return false
    }
    
    private func getIndexOfValueWatcher(watcher: ValueWatcher) -> Int? {
        for (i, obj) in enumerate(_watchers) {
            if obj === watcher {
                return i
            }
        }
        return nil
    }

    public final func addValueWatcher(watcher: ValueWatcher) -> Bool {
        if getIndexOfValueWatcher(watcher) == nil {
            _watchers.append(watcher)
            return true
        }
        return false
    }

    public final func removeValueWatcher(watcher: ValueWatcher) -> Bool {
        if let index = getIndexOfValueWatcher(watcher) {
            _watchers.removeAtIndex(index)
            return true
        }
        return false
    }

    private var _checkingValue = false
    private var _updatingValue = false
    
    public override func setValue(newValue: ${swift_type}?) -> Bool {
        if _checkingValue { return false }
        if _updatingValue { return false }
        
        if (value != newValue) {
            _checkingValue = true
            for checker in _checkers {
                if !checker.isValid(path, value: value, newValue: newValue) {
                    _checkingValue = false
                    return false
                }
            }
            _checkingValue = false
            
            _updatingValue = true
            let lastValue = value

            if (!super.setValue(newValue)) {
                _updatingValue = false
                return false
            }

            for watcher in _watchers {
                watcher.onChanged(path, lastValue: lastValue, value: value)
            }
            _updatingValue = false
            return true
        }
        return false
    }
}

```