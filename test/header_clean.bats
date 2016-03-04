load 'test_helper/bats-support/load'

@test "header_clean permission changes" {
	output=$( load_fixture "file-perms" | $diff_so_fancy )
	assert_output --partial 'circle.yml changed file mode to 100755'
}

@test "header_clean 'new file mode' is removed" {
	output=$( load_fixture "file-perms" | $diff_so_fancy )
	refute_output --partial 'new file mode'
}

@test "header_clean 'deleted file mode' is removed" {
	output=$( load_fixture "file-perms" | $diff_so_fancy )
	refute_output --partial 'deleted file mode'
}

@test "header_clean remove 'git --diff' header" {
	output=$( load_fixture "file-perms" | $diff_so_fancy )
	refute_output --partial 'diff --git'
}