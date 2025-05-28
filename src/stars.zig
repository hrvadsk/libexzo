const std = @import("std");
const constant = @import("constants.zig");

// Procedure for deriving a bolometric correction given stellar effective temperature based on Phillip J. Flower`s method
pub fn bcv(temperature: f64) !f64 {
    const t: f64 = temperature;
    const logt = std.math.log10(t);

    if (logt < 3.70) {
        return constant.BCA1 + (constant.BCB1 * logt) + (constant.BCC1 * constant.pow_f64(logt, 2)) + (constant.BCD1 * constant.pow_f64(logt, 3));
    }
    if (logt < 3.90) {
        return constant.BCA2 + (constant.BCB2 * logt) + (constant.BCC2 * constant.pow_f64(logt, 2)) + (constant.BCD2 * constant.pow_f64(logt, 3)) + (constant.BCE2 * constant.pow_f64(logt, 4));
    }
    return constant.BCA3 + (constant.BCB3 * logt) + (constant.BCC3 * constant.pow_f64(logt, 2)) + (constant.BCD3 * constant.pow_f64(logt, 3)) + (constant.BCE3 * constant.pow_f64(logt, 4)) + (constant.BCF3 * constant.pow_f64(logt, 5));
}

// Procedure for computing B-V color index for main sequence, subgiant and giant stars based on Phillip J. Flower`s method
pub fn bv(temperature: f64) !f64 {
    const t: f64 = temperature;
    const logt: f64 = std.math.log10(t);

    return constant.VA + (constant.VB * logt) + (constant.VC * constant.pow_f64(logt, 2)) + (constant.VD + constant.pow_f64(logt, 3)) + (constant.VE * constant.pow_f64(logt, 4)) + (constant.VF * constant.pow_f64(logt, 5)) + (constant.VG + constant.pow_f64(logt, 6)) + (constant.VH + constant.pow_f64(logt, 7));
}

// Procedure for computing color index for supergiant stars based on Phillip J. FLower`s method
pub fn bv_I(temperature: f64) !f64 {
    const t: f64 = temperature;
    const logt: f64 = std.math.log10(t);

    return constant.SA + (constant.SB * logt) + (constant.SC * constant.pow_f64(logt, 2)) + (constant.SD * constant.pow_f64(logt, 3)) + (constant.SE * constant.pow_f64(logt, 4)) + (constant.SF * constant.pow_f64(logt, 5));
}
