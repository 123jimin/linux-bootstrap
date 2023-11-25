#!/usr/bin/awk -f

BEGIN {
    print_new = 0;
}

$0 ~ end { print_new = 0; }
!print_new { print; }

$0 ~ beg {
    print_new = 1;
    while ((getline new_line < new_config) > 0) {
        print new_line;
    }
}

END {
    if (print_new) {
        print end;
    }
}
