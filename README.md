Simple Ruby script to convert x and y coordinates into the coordinate space
used by https://cfbrasz.github.io/Voronoi.html

Input is the path to a text file with coordinate pairs listed like this:

```
(10.4, 90)
(10.6, 92)
(10.7, 95)
```

Output is the coordinates scaled to a [0,900] coordinate space, with X and Y
values as two separate outputs like this:

```
X values:
72.00000000000006 107.99999999999994 125.99999999999987

Y values:
0.0 360.0 900.0
```

These can be pasted directly into the Voronoi diagram generator linked above.
