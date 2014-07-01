source "$BUILDPACK_TEST_RUNNER_HOME/test/support/test-utils"

testCopiesApiToBuildDir() {
	compile $DUMMY_APP
	ls $DUMMY_APP

}