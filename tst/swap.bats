#!/usr/bin/env bats

@test "swap with to few arguments" {
   run ../bin/pato swap 1
   [ "$status" -eq 1 ]
   [ "${lines[0]}" = "Error: The swap command requires two valid index parameter." ]
   [ "${lines[1]}" = "Example: pato swap 2 5" ]
}

@test "swap with a string argument" {
   run ../bin/pato swap two 5
   [ "$status" -eq 1 ]
   [ "$output" = "Error: \"two\" is not a number." ]
}

@test "swap with out of range" {
   run ../bin/pato -i swap 2 7 < local_usr_root.path
   [ "$status" -eq 1 ]
   [ "$output" = "Error: \"7\" is out of range[1-6]." ]
}

@test "swap" {
   run ../bin/pato -i swap 2 4 < abcxyz.path
   [ "$status" -eq 0 ]
   [ "$output" = "/a:/x:/c:/b:/y:/z" ]
}
