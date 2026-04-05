const ModuleConstraint = struct {
    name: []const u8,
    path: []const u8,
};

pub const path_constraints = struct {
    pub const lib: ModuleConstraint = .{
        .name = "lib",
        .path = "src/root.zig",
    };
    pub const app: ModuleConstraint = .{
        .name = "app",
        .path = "src/main.zig",
    };
};
