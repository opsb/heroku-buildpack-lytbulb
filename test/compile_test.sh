. "$BUILDPACK_TEST_RUNNER_HOME/test/support/test-utils"

shouldInstallNode()
{
	assertCaptured "-----> Resolved node version: 0.10.29"
	assertTrue "Should have installed node" '[ -d "$BUILD_DIR/node-v0.10.29-linux-x64" ]'
}

shouldInstallNodeModules()
{
	assertTrue "Should have added node modules to ember app" '[ -d "$BUILD_DIR/client/node_modules" ]'
}

shouldInstallBowerModules()
{
	assertTrue "Should have installed bower modules to ember app" '[ -d "$BUILD_DIR/client/vendor" ]'
}

shouldCopyApiToBuild()
{
	assertCaptured "-----> Copying server to build"
	assertTrue "Should have copied public folder to build dir" '[ -d "$BUILD_DIR/public" ]'
	assertTrue "Should have copied Gemfile to build dir" '[ -f "$BUILD_DIR/Gemfile" ]'
}

shouldCopyAppToBuild()
{
	assertCaptured "-----> Copying client to build"
	assertTrue "Should have copied app's app dir to build/public", '[ -f "$BUILD_DIR/public/index.html" ]'
	assertTrue "Should have copied app's assets dir to build/public", '[ -d "$BUILD_DIR/public/assets" ]'
}

testCompile() 
{
	# only run compile once for all tests as it's very slow (downloads dependencies from internet)
	compile $BUILD_DIR

	shouldInstallNode
	shouldInstallNodeModules
	shouldInstallBowerModules	
	shouldCopyApiToBuild
	shouldCopyAppToBuild
	shouldCleanup
}
