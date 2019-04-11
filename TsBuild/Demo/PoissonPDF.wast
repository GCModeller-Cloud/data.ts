(module ;; Module Math

    ;; Declare Function Exp Lib "Math" Alias "exp" (x As f64) As f64
(func $Exp (import "Math" "exp") (param $x f64) (result f64))
    
    

    (export "PoissonPDF" (func $PoissonPDF))
    (export "Add10" (func $Add10)) 

    (func $PoissonPDF (param $k i32) (param $lambda f64) (result f64)
        ;; Public Function PoissonPDF(k As i32, lambda As f64) As f64
        (local $result f64)
    (set_local $result (call $Exp (f64.sub (f64.const 0) (get_local $lambda))))
    ;; Start Do While Block block_9a020000
    
    (block $block_9a020000 
        (loop $loop_9b020000
    
                    (br_if $block_9a020000 (i32.eqz (i32.ge_s (get_local $k) (i32.const 1))))
            (set_local $result (f64.mul (get_local $result) (f64.div (get_local $lambda) (f64.convert_s/i32 (get_local $k)))))
            (set_local $k (i32.sub (get_local $k) (i32.const 1)))
            (br $loop_9b020000)
    
        )
    )
    ;; End Loop loop_9b020000
    (return (get_local $result))
    )
    
    (func $Add10 (param $x i32) (result i32)
        ;; Public Function Add10(x As i32) As i32
        (local $i i32)
    (set_local $i (i32.const 0))
    ;; For i As Integer = 0 To 9
    
    (block $block_9c020000 
        (loop $loop_9d020000
    
                    (br_if $block_9c020000 (i32.ge_s (get_local $i) (i32.const 9)))
            (i32.add (get_local $i) (i32.const 1))
            (set_local $x (i32.add (get_local $x) (i32.const 1)))
            (br $loop_9d020000)
    
        )
    )
    (return (get_local $x))
    )

)