source "$BUILDPACK_TEST_RUNNER_HOME/test/support/test-utils"

testCopiesContentsOfApiToBuildDir() 
{
	compile $BUILD_DIR
	assertCaptured "-----> Copying api to build"
	assertTrue "Should have copied public folder to build dir" '[ -d "$BUILD_DIR/public" ]'
	assertTrue "Should have copied Gemfile to build dir" '[ -f "$BUILD_DIR/Gemfile" ]'
}

testInstallsNode()
{
	compile $BUILD_DIR
	assertCaptured "-----> Resolved node version: 0.10.29"
	assertTrue "Should have installed node" '[ -d "$BUILD_DIR/node-v0.10.29-linux-x64" ]'
}

