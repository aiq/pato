#!/usr/bin/env bats

@test "swap" {
   run pato swap 1
   [ "$status" -eq -1 ]
   [ "$output" = "Error:\tThe swap command requires two valid index parameter\nExample: pato swap 2 5" ]
}
