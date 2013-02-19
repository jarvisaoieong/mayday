request = require 'request'
config = require '../config/config'

times = 0

do start = ->
  request
    url: 'http://www.my-mayday.net/logging.php?action=login&loginsubmit=yes&floatlogin=yes&inajax=1'
    method: 'post'
    form: config
  ,
    (err, res, body) ->
      do interval = ->
        request
          url: 'http://www.my-mayday.net/index.php'
        ,
          (err, res, body) ->
            times++
            return console.log 'fail' unless body.match /歡迎回來 cheng523/
            return start() if times % 60 is 0
            console.log "#{times} ok"
            setTimeout interval, 1000 * 60
