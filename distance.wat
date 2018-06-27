(module 
    (func $square
        (export "square")
        (param $x i32)
        (result i32)
        (return (i32.mul (get_local $x)
                         (get_local $x))))

    (func $f64.distance
        (export "f64.distance")
        (param $x1 i32) (param $y1 i32)
        (param $x2 i32) (param $y2 i32)
        (result f64)
        
        (local $x.dist i32)
        (local $y.dist i32)
        
        (set_local $x.dist (i32.sub (get_local $x1)
                                    (get_local $x2)))
        
        (set_local $y.dist (i32.sub (get_local $y1)
                                    (get_local $y2)))
        
        (return (f64.sqrt (f64.convert_u/i32 (i32.add (call $square (get_local $x.dist))
                                   (call $square (get_local $y.dist)))))))
                                   
)