const std = @import("std");

pub fn build(b: *std.Build) void {
    const upstream = b.dependency("stb_vorbis", .{});
    const lib = b.addLibrary(.{
        .name = "stb_vorbis",
        .linkage = .static,
        .root_module = b.createModule(.{
            .target = b.standardTargetOptions(.{}),
            .optimize = b.standardOptimizeOption(.{}),
            .link_libc = true,
        }),
    });
    lib.addIncludePath(upstream.path(""));
    lib.addCSourceFiles(.{
        .files = &.{
            "stb_vorbis_impl.c",
        },
    });
    lib.installHeader(b.path("stb_vorbis.h"), "./stb_vorbis.h");
    lib.installHeader(upstream.path("stb_vorbis.c"), "./_stb_vorbis_details.h");
    b.installArtifact(lib);
}
