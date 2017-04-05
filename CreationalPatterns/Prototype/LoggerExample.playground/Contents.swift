import Foundation

class Message{
    var to:String
    var message:String
    
    init(to: String, msg:String) {
        self.to = to
        self.message = msg
    }
}

class DetailedMessage: Message{
    var from:String
    
    init(to: String, msg: String, from: String) {
        self.from = from
        super.init(to: to, msg: msg)
    }
}

class MessageLogger{
    var messages: [Message] = []
    
    func logMessage(msg:Message) {
        if let detailedMsg = msg as? DetailedMessage{
            messages.append(DetailedMessage(to: detailedMsg.to, msg: detailedMsg.message, from: detailedMsg.from))
        }
        else{
            messages.append(Message(to: msg.to, msg: msg.message))
        }
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
