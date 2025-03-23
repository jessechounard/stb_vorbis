# stb_vorbis
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
#include <stdio.h>
#include <stdint.h>
#include <stb_vorbis.h>

int main() {
    stb_vorbis *vorbis = stb_vorbis_open_filename("vorbis.ogg", nullptr, nullptr);
    if (!vorbis) {
        printf("Loading vorbis failed!\n");
    } else {
        stb_vorbis_info info = stb_vorbis_get_info(vorbis);
        printf("vorbis info:\n"
               "    file:          %s\n"
               "    channels:      %d\n"
               "    sample rate:   %d\n",
            "vorbis.ogg",
            info.channels,
            info.sample_rate);
        stb_vorbis_close(vorbis);
    }

    return 0;
}```
