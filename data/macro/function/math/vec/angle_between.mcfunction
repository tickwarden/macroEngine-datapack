# ─────────────────────────────────────────────────────────────────
# macro:math/vec/angle_between
# Returns the angle between two vectors in degrees.
# cos(θ) = dot(A,B) / (|A| × |B|)  →  θ = arccos(...)
# Uses ×1000 fixed-point cos table for arccos.
#
# INPUT:  ax, ay, az, bx, by, bz
# OUTPUT: macro:output result (0–180, integer derece)
#         result=0 for zero vectors.
# ─────────────────────────────────────────────────────────────────

function macro:math/vec/internal/angle_exec with storage macro:input {}
