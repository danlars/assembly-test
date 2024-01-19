(module
 (type $0 (func (param f32 f32) (result f32)))
 (global $~lib/memory/__data_end i32 (i32.const 8))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 32776))
 (global $~lib/memory/__heap_base i32 (i32.const 32776))
 (memory $0 0)
 (table $0 1 1 funcref)
 (elem $0 (i32.const 1))
 (export "add" (func $assembly/math/add/add))
 (export "subtract" (func $assembly/math/subtract/subtract))
 (export "mutiply" (func $assembly/math/multiply/mutiply))
 (export "memory" (memory $0))
 (func $assembly/math/add/add (param $a f32) (param $b f32) (result f32)
  local.get $a
  local.get $b
  f32.add
  return
 )
 (func $assembly/math/subtract/subtract (param $a f32) (param $b f32) (result f32)
  local.get $a
  local.get $b
  f32.sub
  return
 )
 (func $assembly/math/multiply/mutiply (param $a f32) (param $b f32) (result f32)
  local.get $a
  local.get $b
  f32.mul
  return
 )
)
