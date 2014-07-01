source "$BUILDPACK_TEST_RUNNER_HOME/vendor/test-utils/test-utils"

testCopiesApiToBuildDir() {
	compile $DUMMY_APP
	ls $DUMMY_APP
	
}