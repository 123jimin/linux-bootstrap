#!/usr/bin/awk -f

BEGIN {
    in_block = 0;
}

$0 ~ end_marker {
    in_block = 0;
}

in_block == 0 {
    print;
}

$0 ~ start_marker {
    in_block = 1;
    while ((getline line < new_config) > 0) {
        print line;
    }
}