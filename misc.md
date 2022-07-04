`echo {a..z}` # a b c d e f g h i j k l m n o p q r s t u v w x y z

`echo {z..a}` # z y x w v u t s r q p o n m l k j i h g f e d c b a

`echo {001..10}` # 001 002 003 004 005 006 007 008 009 010

`echo {10..001}` # 010 009 008 007 006 005 004 003 002 001

`echo {0..10..2}` # 0 2 4 6 8 10

`for c in {a..z..2}; do echo -n $c; done` # acegikmoqsuwy

`echo {a..d}{1..3}` # a1 a2 a3 b1 b2 b3 c1 c2 c3 d1 d2 d3


#### - To make multiple directories with sub-dir
`mkdir -p toplevel/sublevel_{01..02}/{child1,child2,child3}`

#### - Turn on/off debugging within a bash script.
- It may optionally be turned back on, though debug output is automatically reset when the script exits.

`set -x` # Enable a mode of the shell where all executed commands are printed to the terminal.

`set +x` # Disable a mode of the shell where all executed commands are printed to the terminal.
