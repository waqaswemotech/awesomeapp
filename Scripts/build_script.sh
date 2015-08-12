appname="AwesomeApp"
target_name=$appname
sdk="iphoneos"
certificate="iPhone Distribution: Altia Systems Inc."
project_dir="$1/$appname"
build_location="$HOME/Builds/$appname"
echo $build_location

if [ ! -d "$build_location" ]; then
echo "not existed.."
mkdir -p "$build_location"
else
echo "already exist.."
fi

if [ ! -d "$project_dir" ]; then
echo "Project file isn't created"
mkdir -p "$project_dir"
fi
cd "$project_dir"

xcodebuild -target "$appname" OBJROOT="$build_location/obj.root" SYMROOT="$build_location/sym.root"

xcrun -sdk iphoneos PackageApplication -v "$build_location/sym.root/Release-iphoneos/$appname.app" -o "$build_location/$appname.ipa" --sign "$certificate"
