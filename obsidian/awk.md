text-processing and data extraction domain-specific language

### Fahrenheit to Celsius example

Take a file such as:
```csv
temp, unit
26, C
28, C
27, C
26, C
71, F
```

`awk '{print $1 $2}'` results in:
```shell
temp,unit
26,C
28,C
27,C
26,C
71,F
```

`awk '{print ($1-32)/1.8}'` does F to C conversion for every line like:
```shell
-17.7778
-3.33333
-2.22222
-2.77778
-3.33333
21.6667
```

`awk '{print ($2=="F" ? ($1-32)/1.8 : $1 )}'` narrows it down to:
```shell
temp,
26,
28,
27,
26,
71,
```

`awk '{print ($2=="F" ? ($1-32)/1.8 : $1 ); C;}'` adds in the units for everything like:
```shell
temp, C
26, C
28, C
27, C
26, C
21.6667 C
```

next we do some Number Record filtering by `awk 'NR==1;NR>1{print ($2=="F" ? ($1-32)/1.8 : $1 ); C;}'`:
```shell
temp, unit
26, C
28, C
27, C
26, C
21.6667 C
```

### Other uses

---

#stub 