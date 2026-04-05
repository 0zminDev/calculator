const std = @import("std");
const math = @import("lib/math/export.zig");

pub fn run() !void {
    const a = 10;
    const b = 5;

    const sum = math.add.add(a, b);
    std.debug.print("Sum: {d}\n", .{sum});

    const difference = math.sub.sub(a, b);
    std.debug.print("Difference: {d}\n", .{difference});

    const product = math.mul.mul(a, b);
    std.debug.print("Product: {d}\n", .{product});

    const quotient = try math.div.div(a, b);
    std.debug.print("Quotient: {d}\n", .{quotient});
}
