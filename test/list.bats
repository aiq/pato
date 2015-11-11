#!/usr/bin/env bats

@test "list" {
   run ../bin/pato -i list < abcxyz.path
   [ "$status" -eq 0 ]
   [ "$output" = "$(cat list.txt)" ]
}
