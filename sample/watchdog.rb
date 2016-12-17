require "ult"
extend Ult

count = 0
watchdog( "date" ){|status, outputs, errors|
  p [ count, status, outputs, errors ]
  count += 1
  ( count < 3 )
}
