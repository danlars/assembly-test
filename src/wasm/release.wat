(module
 (type $0 (func (param f32 f32) (result f32)))
 (memory $0 0)
 (export "add" (func $assembly/math/add/add))
 (export "subtract" (func $assembly/math/subtract/subtract))
 (export "mutiply" (func $assembly/math/multiply/mutiply))
 (export "memory" (memory $0))
 (func $assembly/math/add/add (param $0 f32) (param $1 f32) (result f32)
  local.get $0
  local.get $1
  f32.add
 )
 (func $assembly/math/subtract/subtract (param $0 f32) (param $1 f32) (result f32)
  local.get $0
  local.get $1
  f32.sub
 )
 (func $assembly/math/multiply/mutiply (param $0 f32) (param $1 f32) (result f32)
  local.get $0
  local.get $1
  f32.mul
 )
)
