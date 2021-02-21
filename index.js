const { Elm } = require('./build/app.js')
var app = Elm.Main.init()

// Receive from Elm some message for logging.
app.ports.log.subscribe(function (logMsg) {
    console.log(logMsg)
})
