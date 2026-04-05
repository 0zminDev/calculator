const std = @import("std");

pub fn div(a: i32, b: i32) !i32 {
    if (b == 0) {
        std.debug.print("Error: Division by zero is not allowed.\n", .{});
        return error.DivisionByZero;
    }
    return @divTrunc(a, b);
}

test "divide positive int" {
    const result = try div(6, 3);
    try std.testing.expect(result == 2);
}

test "divide negative int" {
    const result = try div(-6, -3);
    try std.testing.expect(result == 2);
}

test "divide mixed int" {
    const result = try div(-6, 3);
    try std.testing.expect(result == -2);
}

test "divide by zero" {
    const result = div(6, 0);
    try std.testing.expectError(error.DivisionByZero, result);
}
