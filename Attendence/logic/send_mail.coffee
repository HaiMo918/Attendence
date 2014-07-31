nodemailer = require("nodemailer")
constants = require('../config/constants')

# Create a SMTP transport object

transport = nodemailer.createTransport("SMTP",constants.transportOptions)
console.log "SMTP Configured"

message = constants.message
         

exports.sendMail = (message,callback)->
  console.log "Sending Mail"
  
  transport.sendMail message,callback