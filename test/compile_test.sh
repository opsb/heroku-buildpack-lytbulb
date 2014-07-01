source "$BUILDPACK_TEST_RUNNER_HOME/test/support/test-utils"

testCopiesContentsOfApiToBuildDir() {
	compile $BUILD_DIR
	assertCaptured "  >> Copying api to build"
	assertTrue '[ -d "$BUILD_DIR/public" ]'
	assertTrue '[ -f "$BUILD_DIR/Gemfile" ]'
}

