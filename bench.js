var s = new Stats('s');
var source = snarf(esprima_js);

// Wake up jits.
print("warmup");
for (let i = 0; i < 100; i++) {
  esprima.parse(source);
}

// Measure.
print("measure");
for (i = 0; i < 500; i++) {
  let start = dateNow();
  esprima.parse(source);
  s.take((dateNow() - start) / 1000);
}

print(s);
