(module 
    (func $square
        (export "square")
        (param $x i32)
        (result i32)
        (return (i32.mul (get_local $x)
                         (get_local $x)))))