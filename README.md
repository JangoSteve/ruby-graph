# Ruby Graph

1. Put data in data.txt.
2. Configure drawn graph output at the top of graph_draw.rb
3. Form the command line, run `ruby graph.rb`

## Configuration

From graph_draw.rb:

`HEIGHT`: Height of the graph in lines (default `30`)

`VERTICAL_BORDER`: Character to use to draw vertical axis border
(default `"|"`)

`HORIZONTAL_BORDER`: Character to use to draw horizontal axis border
(default `"-"`)

`EMPTY_CHAR`: Character to use for empty graph space (default `"\e[30m-\e[0m"` (which is a gray hyphen))

`VERTICAL_EMPTY_CHAR`: Character to user for empty graph space
vertically aligned with x-axis marker column (default `"\e[30m+\e[0m"`
(which is a gray plus))

`MARKER`: Character to use to mark value on graph (default `"\e[32m◉\e[0m"` (which is a green utf-8 bullseye))

`SPACE_BETWEEN_X_LABELS`: Space between labels on x-axis (default `5`)

`SHOW_OUTLINE`: Draw outline around graph (default `true`)

`SHOW_SCALE`: Show y-axis scale (default `true`)

`SCALE_PRECISION`: How many places passed the decimal for scale labels
(default `1`)
