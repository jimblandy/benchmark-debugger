#!/usr/bin/env bash

# Measure the performance impact of Debugger on running the Esprima parser
# on its own source. You will need:
#
# - A SpiderMonkey shell executable, built with debugging disabled and
#   optimization enabled.
#
# - A copy of the Esprima source code. You can simply point it esprima.js
#   from a git checkout: git@github.com:ariya/esprima.git
#   The github front page: https://github.com/ariya/esprima

# The path to a debugger shell.
JS=$HOME/moz/dbg/js/src/opt~/js

# The path to the esprima.js source.
ESPRIMA=$HOME/esprima/esprima.js

SCRIPT=$(dirname $0)
BENCH=$SCRIPT/bench.js
STATS=$SCRIPT/stats.js

function run() {
    $JS $1 \
        -e "var g = newGlobal();" \
        -e "g.load('$ESPRIMA');" \
        -e "g.load('$STATS');" \
        -e "g.esprima_js = '$ESPRIMA';" \
        -e "$2" \
        -e "g.load('$SCRIPT/bench.js');"
    echo
}

echo '--ion,    debugger, onEnterFrame'; run --ion    'var dbg = new Debugger(g); dbg.onEnterFrame = () => {};'
echo '--no-ion, debugger, onEnterFrame'; run --no-ion 'var dbg = new Debugger(g); dbg.onEnterFrame = () => {};'
echo '--ion,    debugger, no hooks';     run --ion    'var dbg = new Debugger(g);'
echo '--no-ion, debugger, no hooks';     run --no-ion 'var dbg = new Debugger(g);'
echo '--ion';                            run --ion
echo '--no-ion';                         run --no-ion
