source "$BUILDPACK_TEST_RUNNER_HOME/test/support/test-utils"

testCopiesApiToBuildDir() {
	compile $BUILD_DIR
	ls $BUILD_DIR

}