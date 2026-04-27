---
title: 'Antikythera.jl: A Julia engine for digital mechanism design and signed-distance-field geometry'
tags:
  - Julia
  - computational geometry
  - signed distance fields
  - mechanism design
  - procedural modeling
authors:
  - name: bad-antics
    orcid: 0000-0000-0000-0000
    affiliation: 1
  - name: marshalldavidson61-arch
    affiliation: 1
affiliations:
  - name: Independent researcher
    index: 1
date: 27 April 2026
bibliography: paper.bib
---

# Summary

`Antikythera.jl` is a pure-Julia engine for designing digital mechanisms and
sculpting solid geometry through signed distance fields (SDFs). It exposes
procedural primitives — gears, gyroids, Schwarz-P surfaces, twisted tori,
capsules, helicoids — together with field operators (gradient, normal,
curvature, Laplacian, divergence) and a probe-driven REPL workflow for
interactive geometric exploration. The package depends only on `LinearAlgebra`
from the standard library and is suitable for headless batch use, notebook
exploration, downstream meshing, or coupling with finite-element solvers.

The library combines two design traditions that are usually kept separate:
the gear-train algebra of historical clockwork (named after the *Antikythera
mechanism*) and modern implicit-surface modeling. This makes it possible to
describe an entire mechanical assembly — gear ratios, escapements, frames —
as a single closed-form scalar field that can be rendered, meshed, sliced,
or differentiated.

# Statement of need

Existing Julia geometry packages tend to focus on either explicit meshes
(`Meshes.jl`, `GeometryBasics.jl`) or on point-cloud / mesh interop
(`MeshIO.jl`). General-purpose SDF tooling in Julia is fragmented and
typically requires GPU pipelines (`ModernGL`-based renderers) that are
inappropriate for headless scientific workflows.

Mechanism-design tooling, in turn, lives almost entirely in proprietary CAD
(SolidWorks, Fusion 360) or in OpenSCAD, none of which integrate with
Julia's autodiff, optimization, and PDE ecosystems. Researchers studying
historical clockwork, metamaterials, lattice infill structures, or
acoustic/optical metasurfaces therefore lose Julia's strengths the moment
they need to handle geometry.

`Antikythera.jl` fills this gap. It supplies:

- a small, dependency-light core that runs anywhere Julia runs;
- a uniform SDF interface so that mechanisms compose with TPMS lattices,
  organic fields, and Boolean operators without changing types;
- field operators that make the package directly usable in optimization
  loops, level-set methods, and inverse-design problems;
- a probe-based REPL that mirrors the way historical instruments were
  designed: place a probe, read a value, adjust, repeat.

# Design

The geometry is encoded as Julia closures `f : R³ → R` returning signed
distance values. Primitives (`gear`, `gyroid`, `schwarzp`, `capsule`,
`twisted_torus`, …) return such closures. Composition is performed with the
usual SDF Boolean operators (union, intersection, smooth-min difference)
which are themselves closures over their operands.

Field operators are computed by central differences with an adaptive step
chosen from the local distance value, which makes them robust on the
coarsely sampled isosurfaces typical of lattice geometries. A small probe
API lets the user query field values, gradients, normals, principal
curvatures, divergence, and Laplacian at arbitrary points during a REPL
session, so design iteration does not require a re-mesh between steps.

The total implementation is approximately 2,300 lines of Julia plus an
890-line test suite, with no external runtime dependencies.

# Acknowledgements

We thank the contributors to the Lateralus language ecosystem for early
testing and feedback, and the Julia community for the registration of
`Antikythera.jl` in the General registry.

# References
