#!/usr/bin/awk -f

BEGIN {
    in_block = 0;
}

$0 ~ beg {
    in_block = 1;
    while ((getline line < new_config) > 0) {
        print line;
    }
}

$0 ~ end {
    in_block = 0;
    next;
}

in_block == 0 {
    print;
}
