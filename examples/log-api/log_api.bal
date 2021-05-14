import ballerina/log;

public function main() {
    // The Ballerina log API provides functions to log at four levels, which are
    // `DEBUG`, `ERROR`, `INFO`, and `WARN`. By default, all log messages are
    // logged to the console at the `INFO` level.
    log:printDebug("debug log");
    log:printError("error log");
    log:printInfo("info log");
    log:printWarn("warn log");

    // You can pass any number of key/value pairs, which need to be displayed in the log message.
    // These can be of the `anydata` type including int, string, and boolean.
    log:printInfo("info log", id = 845315, name = "foo", successful = true);

    // Users can also pass key/value pairs where the values are function pointers.
    log:printInfo("info log", id = 845315,
              name = isolated function() returns string { return "foo";});
    log:printError("error log",
        id = isolated function() returns int { return 845315;}, name = "foo");

    // You can also pass a key/value pair in which the value is an error stack trace.
    error err = f1();
    log:printError("error log", stackTrace = err.stackTrace().callStack,
     username = "Alex92", id = 845315);

    // Optionally, an error can be passed to the functions.
    error e = error("something went wrong!");
    log:printError("error log with cause", 'error = e, id = 845315,
        name = "foo");

    // The log level can be configured via a Ballerina configuration file.
    // To set the global log level, place the entry given below in the `Config.toml` file:
    //
    // ```
    // [ballerina.log]
    // level = "[LOG_LEVEL]"
    // ```

    // Each module can also be assigned its own log level. To assign a
    // log level to a module, provide the following entry in the `Config.toml` file:
    //
    // ```
    // [[ballerina.log.modules]]
    // name = "[ORG_NAME]/[MODULE_NAME]"
    // level = "[LOG_LEVEL]"
    // ```

    // By default, log messages are logged to the console in LogFmt format.
    // To set the output format to JSON, place the entry given below in the `Config.toml` file.
    //
    // ```
    // [ballerina.log]
    // format = "json"
    // ```
}

function f1() returns error {
    return f2();
}

function f2() returns error {
    return f3();
}

function f3() returns error {
    return error("bad sad");
}
