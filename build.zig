const std = @import("std");
const paths = @import("./path_constraints.zig");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const calculator_cli = b.addModule(paths.path_constraints.calculator_cli.name, .{
        .root_source_file = b.path(paths.path_constraints.calculator_cli.path),
        .target = target,
    });

    const calculator_exe = b.addExecutable(.{
        .name = "calculator-cli",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "calculator_cli", .module = calculator_cli },
            },
        }),
    });

    b.installArtifact(calculator_exe);

    const run_step = b.step("run", "Run the app");

    const run_cmd = b.addRunArtifact(calculator_exe);
    run_step.dependOn(&run_cmd.step);

    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const mod_tests = b.addTest(.{
        .root_module = calculator_cli,
    });

    const run_mod_tests = b.addRunArtifact(mod_tests);

    const exe_tests = b.addTest(.{
        .root_module = calculator_exe.root_module,
    });

    const run_exe_tests = b.addRunArtifact(exe_tests);

    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&run_mod_tests.step);
    test_step.dependOn(&run_exe_tests.step);
}
