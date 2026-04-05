const std = @import("std");
const paths = @import("./path_constraints.zig");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addModule(paths.path_constraints.lib.name, .{
        .root_source_file = b.path(paths.path_constraints.lib.path),
        .target = target,
    });

    const app = b.addExecutable(.{
        .name = paths.path_constraints.lib.name,
        .root_module = b.createModule(.{
            .root_source_file = b.path(paths.path_constraints.app.path),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = paths.path_constraints.lib.name, .module = lib },
            },
        }),
    });

    b.installArtifact(app);

    const run_step = b.step("run", "Run the app");

    const run_cmd = b.addRunArtifact(app);
    run_step.dependOn(&run_cmd.step);

    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const lib_tests = b.addTest(.{
        .root_module = lib,
    });

    const run_lib_tests = b.addRunArtifact(lib_tests);

    const app_tests = b.addTest(.{
        .root_module = app.root_module,
    });

    const run_app_tests = b.addRunArtifact(app_tests);

    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&run_lib_tests.step);
    test_step.dependOn(&run_app_tests.step);
}
