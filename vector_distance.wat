(module 
    (memory (export "memory") 1)

    (func $i8.distance
        (export "i8.distance")
        (param $v.ptr i32)
        (param $w.ptr i32)
        (param $len i32)
        (result f64)
        
        (local $distance.sq i32)
        (local $elm i32)
        (local $offset i32)
        
        (set_local $distance.sq (i32.const 0))
        
        (loop $continue
            ;; $elm = $w[$offset] - $v[$offset]
            (set_local $elm (i32.sub (i32.load8_u (i32.add (get_local $w.ptr)
                                                           (get_local $offset)))
                                     (i32.load8_u (i32.add (get_local $v.ptr)
                                                           (get_local $offset)))))
            ;; $distance.sq += $elm ** 2
            (set_local $distance.sq (i32.add (get_local $distance.sq)
                                             (i32.mul (get_local $elm)
                                                      (get_local $elm))))
            ;; $offset++ < $len ? continue : break
            (br_if $continue (i32.lt_u (tee_local $offset 
                                                 (i32.add (get_local $offset)
                                                          (i32.const 4))) ;; bytewidth of i32
                                       (get_local $len))))

    (return (f64.sqrt (f64.convert_u/i32 (get_local $distance.sq))))))