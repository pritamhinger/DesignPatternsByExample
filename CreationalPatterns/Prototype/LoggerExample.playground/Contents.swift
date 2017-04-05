import Foundation

class Message{
    var to:String
    var message:String
    
    init(to: String, msg:String) {
        self.to = to
        self.message = msg
    }
}

class MessageLogger{
    var messages: [Message] = []
    
    func logMessage(msg:Message) {
        messages.append(msg)
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

logger.processLogMessages(callback: { msg -> Void in
    print("Message -->> To: \(msg.to) Message: \(msg.message)")
})
