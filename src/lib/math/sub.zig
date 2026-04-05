const std = @import("std");

pub fn sub(a: i32, b: i32) i32 {
    return a - b;
}

test "subtract positive int" {
    const result = sub(5, 2);
    try std.testing.expect(result == 3);
}

test "subtract negative int" {
    const result = sub(-5, -2);
    try std.testing.expect(result == -3);
}

test "subtract mixed int" {
    const result = sub(-5, 2);
    try std.testing.expect(result == -7);
}
