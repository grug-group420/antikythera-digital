# Antikythera.jl
#
# Geometric calculus engine — derivatives as spatial measurements on
# preloaded signed-distance fields. See README.md for the full conceptual
# overview. The implementation lives in `_engine.jl`; this file wraps it
# in a Julia module and re-exports the public API.

module Antikythera

using LinearAlgebra

include("_engine.jl")

# Re-export the public surface. The engine defines these as top-level
# names; we list the stable ones here so `using Antikythera` is enough.
export Cog, MachineCrunch,
       sdf_sphere, sdf_torus, sdf_box, sdf_cylinder, sdf_gyroid,
       sdf_schwarz_p, sdf_twisted_torus, sdf_cone, sdf_capsule,
       sdf_plane, sdf_ellipsoid

end # module Antikythera
