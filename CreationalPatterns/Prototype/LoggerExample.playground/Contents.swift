import Foundation

class Message: NSObject, NSCopying{
    var to:String
    var message:String
    
    init(to: String, msg:String) {
        self.to = to
        self.message = msg
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Message(to: self.to, msg: self.message)
    }
}

class DetailedMessage: Message{
    var from:String
    
    init(to: String, msg: String, from: String) {
        self.from = from
        super.init(to: to, msg: msg)
    }
    
    override func copy(with zone: NSZone?) -> Any {
        return DetailedMessage(to: self.to, msg: self.message, from: self.from)
    }
}

class MessageLogger{
    var messages: [Message] = []
    
    func logMessage(msg:Message) {
        messages.append(msg.copy() as! Message)
    }
    
    func processLogMessages(callback:(Message) -> Void) {
        for msg in messages {
            callback(msg)
        }
    }
}

var logger = MessageLogger()
var msg = Message(to: "Pritam Hinger", msg: "Hello")
logger.logMessage(msg: msg)

msg.to = "Ubaid Tahir"
msg.message = "How are you?"
logger.logMessage(msg: msg)

logger.logMessage(msg: DetailedMessage(to: "Amit Dixit", msg: "Hi..!!", from: "Pritam Hinger"))

logger.processLogMessages(callback: { msg -> Void in
    if let detailedMsg = msg as? DetailedMessage{
        print("Detailed Message -->> To: \(detailedMsg.to) Message: \(detailedMsg.message) From: \(detailedMsg.from)")
    }
    else{
        print("Message -->> To: \(msg.to) Message: \(msg.message)")
    }
})
