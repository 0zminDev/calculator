const ModuleConstraint = struct {
    name: []const u8,
    path: []const u8,
};

pub const path_constraints = struct {
    pub const calculator_cli: ModuleConstraint = .{
        .name = "calculator-cli",
        .path = "src/root.zig",
    };
};
