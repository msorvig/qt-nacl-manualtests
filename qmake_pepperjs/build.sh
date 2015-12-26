
# From scratch pepper.js hello world build. This shows
# how to build a peppep application using emscripten
# and pepper.js

# require that PEPPER_JS is set. It hould point to
# a checkout of the pepper.js github repo.
if [ -z PEPPER_JS_ROOT ]; then
    echo "Please set PEPPER_JS."
    exit
fi

# Check if we have a valid pepper.js checkout by
# looking for stub.cc (which will also be needed
# later)
PPAPI_STUB_SRC="$PEPPER_JS_ROOT/examples/ppapi/stub.cc"
if [ ! -f $PPAPI_STUB_SRC ]; then
    echo "Pepper.js ppapi stub not found at: $PPAPI_STUB_SRC"
    exit
fi

echo ""
echo "Using native client from: $NACL_SDK_ROOT"
echo "Using pepper.js from:     $PEPPER_JS_ROOT"
echo ""

# pepper.js javascript file list
PREAMPLE="$PEPPER_JS_ROOT/ppapi_preamble.js"
WRAPPERS_DIR="$PEPPER_JS_ROOT/wrappers"
WRAPPERS="audio.js base.js file.js gles.js gles_ext.js graphics_2d.js graphics_3d.js\
          input_events.js mouse_lock.js testing.js url_loader.js view.js web_socket.js"


JAVASCRIPT_ARGS=""
JAVASCRIPT_ARGS="$JAVASCRIPT_ARGS -s RESERVED_FUNCTION_POINTERS=400 --minify 0 -s TOTAL_MEMORY=33554432 -s EXPORTED_FUNCTIONS=\"['_DoPostMessage', '_DoChangeView', '_DoChangeFocus', '_NativeCreateInstance', '_HandleInputEvent']\""
JAVASCRIPT_ARGS="$JAVASCRIPT_ARGS --pre-js $PREAMPLE"

for WRAPPER in $WRAPPERS
do
    JAVASCRIPT_ARGS="$JAVASCRIPT_ARGS --pre-js $WRAPPERS_DIR/$WRAPPER "
done

INCLUDE="$NACL_SDK_ROOT/include"

echo compile!
COMPILE_CMD="emcc main.c -I $INCLUDE -o main.o"
echo $COMPILE_CMD
$COMPILE_CMD

echo link!
LINK_CMD="emcc main.o -o main.js $JAVASCRIPT_ARGS"
echo $LINK_CMD
$LINK_CMD


    