# stb_image
This is [stb_vorbis from stb](https://github.com/nothings/stb), packaged for [Zig](https://ziglang.org/). (Intended for C or C++ projects using Zig as a build tool.)

## Usage
First, update your `build.zig.zon`:
```sh
zig fetch --save git+https://github.com/jessechounard/stb_vorbis
```

Next, in your `build.zig`, you can access the library as a dependency:
```zig
const stb_vorbis_dep = b.dependency("stb_vorbis", .{
    .target = target,
    .optimize = optimize,
});
const stb_vorbis_lib = stb_vorbis_dep.artifact("stb_vorbis");

exe.root_module.linkLibrary(stb_vorbis_lib);
```

Finally, in your C++ file, you can use the library:
```cpp
// add example
```
