#!/usr/bin/awk -f

NR == FNR {
    new = new $0 ORS;
    next;
}

$0 ~ end_marker {
    in_block = 0;
}

!in_block {
    print;
}

$0 ~ start_marker {
    printf "%s", new;
    in_block = 1;
}