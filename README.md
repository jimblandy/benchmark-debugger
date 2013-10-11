Measure the performance impact of [Debugger](https://wiki.mozilla.org/Debugger),
the debugging API of Mozilla's [SpiderMonkey](https://developer.mozilla.org/en-US/docs/Mozilla/Projects/SpiderMonkey)
JavaScript engine, when running the [Esprima](https://github.com/ariya/esprima) parser on its own source.

You will need:

- A SpiderMonkey shell executable, built with debugging disabled and
  optimization enabled.
- A copy of the [Esprima](https://github.com/ariya/esprima) source code.
  You can simply point it **esprima.js** from a git checkout:
  git@github.com:ariya/esprima.git

Edit those into **bench.sh**.

Things to try if you want to bring the standard deviation down:

- Make sure CPU throttling is disabled. You don't want the later benchmarks
  to run more slowly just because the processor got hot.
- Look out for noisy processes like web browsers, mail readers,
  artificially intelligent text editors, ...
- Disable networking, perhaps?
- Run directly from the console, to avoid GUI futzing altogether?
