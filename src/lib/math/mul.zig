const std = @import("std");

pub fn mul(a: i32, b: i32) i32 {
    return a * b;
}

test "multiply positive int" {
    const result = mul(2, 3);
    try std.testing.expect(result == 6);
}

test "multiply negative int" {
    const result = mul(-2, -3);
    try std.testing.expect(result == 6);
}

test "multiply mixed int" {
    const result = mul(-2, 3);
    try std.testing.expect(result == -6);
}
