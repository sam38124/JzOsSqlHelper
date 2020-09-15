struct JzOsSqlHelper {
    var text = "Hello, World!"
    func create()->Bool{
        return SqlHelper("aa").autoCreat()
    }
}
