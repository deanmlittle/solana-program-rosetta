const std = @import("std");
const solana = @import("solana-program-sdk");
const base58 = @import("base58");

pub fn build(b: *std.Build) !void {
    const target = b.resolveTargetQuery(solana.sbf_target);
    const optimize = .ReleaseSmall;
    const program = b.addSharedLibrary(.{
        .name = "solana_program_rosetta_transfer_lamports",
        .root_source_file = b.path("main.zig"),
        .target = target,
        .optimize = optimize,
    });
    _ = solana.buildProgram(b, program, target, optimize);
    b.installArtifact(program);
}
