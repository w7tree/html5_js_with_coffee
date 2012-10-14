require [
  'lib/canvas',
  ],() ->
    console.log "lib/canvas ready."
    require [
      'canvas_test',
    ],()->
      console.log "canvas_test ready."
      null
