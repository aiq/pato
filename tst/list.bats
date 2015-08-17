#!/usr/bin/env bats

@test "list" {
   run pato list
   [ "$status" -eq 0 ]
   [ "$output" = "$(cat list.txt)" ]
}
