(module ;; Module 

    ;; Auto-Generated VisualBasic.NET WebAssembly Code
    ;;
    ;; WASM for VisualBasic.NET
    ;; 
    ;; version: 1.3.0.22
    ;; build: 4/17/2019 11:42:23 PM

    ;; imports must occur before all non-import definitions

    ;; Declare Function log Lib "console" Alias "log" (message As char*) As i32
    (func $log (import "console" "log") (param $message i32) (result i32))
    ;; Declare Function warn Lib "console" Alias "warn" (message As char*) As i32
    (func $warn (import "console" "warn") (param $message i32) (result i32))
    ;; Declare Function info Lib "console" Alias "info" (message As char*) As i32
    (func $info (import "console" "info") (param $message i32) (result i32))
    ;; Declare Function error Lib "console" Alias "error" (message As char*) As i32
    (func $error (import "console" "error") (param $message i32) (result i32))
    ;; Declare Function DOMById Lib "document" Alias "getElementById" (id As char*) As i32
    (func $DOMById (import "document" "getElementById") (param $id i32) (result i32))
    ;; Declare Function setText Lib "document" Alias "writeElementText" (node As i32, text As char*) As i32
    (func $setText (import "document" "writeElementText") (param $node i32) (param $text i32) (result i32))
    ;; Declare Function createElement Lib "document" Alias "createElement" (tagName As char*) As i32
    (func $createElement (import "document" "createElement") (param $tagName i32) (result i32))
    ;; Declare Function setAttribute Lib "document" Alias "setAttribute" (node As i32, attr As char*, value As char*) As i32
    (func $setAttribute (import "document" "setAttribute") (param $node i32) (param $attr i32) (param $value i32) (result i32))
    ;; Declare Function appendChild Lib "document" Alias "appendChild" (parent As i32, node As i32) As i32
    (func $appendChild (import "document" "appendChild") (param $parent i32) (param $node i32) (result i32))
    ;; Declare Function Exp Lib "Math" Alias "exp" (x As f64) As f64
    (func $Exp (import "Math" "exp") (param $x f64) (result f64))
    ;; Declare Function i32.toString Lib "string" Alias "toString" (s As i32) As char*
    (func $i32.toString (import "string" "toString") (param $s i32) (result i32))
    ;; Declare Function string.add Lib "string" Alias "add" (a As char*, b As char*) As char*
    (func $string.add (import "string" "add") (param $a i32) (param $b i32) (result i32))
    ;; Declare Function f64.toString Lib "string" Alias "toString" (s As f64) As char*
    (func $f64.toString (import "string" "toString") (param $s f64) (result i32))
    ;; Declare Function char*.toString Lib "string" Alias "toString" (s As char*) As char*
    (func $char*.toString (import "string" "toString") (param $s i32) (result i32))
    
    ;; Only allows one memory block in each module
    (memory (import "env" "bytechunks") 1)

    ;; Memory data for string constant
    
    ;; String from 1 with 12 bytes in memory
    (data (i32.const 1) "Hello World!\00")

    ;; String from 14 with 54 bytes in memory
    (data (i32.const 14) "This message comes from a VisualBasic.NET application!\00")

    ;; String from 69 with 21 bytes in memory
    (data (i32.const 69) "WebAssembly it works!\00")

    ;; String from 91 with 4 bytes in memory
    (data (i32.const 91) "text\00")

    ;; String from 96 with 5 bytes in memory
    (data (i32.const 96) "notes\00")

    ;; String from 102 with 1 bytes in memory
    (data (i32.const 102) "p\00")

    ;; String from 104 with 1 bytes in memory
    (data (i32.const 104) "p\00")

    ;; String from 106 with 5 bytes in memory
    (data (i32.const 106) "style\00")

    ;; String from 112 with 28 bytes in memory
    (data (i32.const 112) "background-color: lightgrey;\00")

    ;; String from 141 with 5 bytes in memory
    (data (i32.const 141) "style\00")

    ;; String from 147 with 27 bytes in memory
    (data (i32.const 147) "font-size: 2em; color: red;\00")

    ;; String from 175 with 5 bytes in memory
    (data (i32.const 175) "style\00")

    ;; String from 181 with 29 bytes in memory
    (data (i32.const 181) "font-size: 5em; color: green;\00")

    ;; String from 211 with 33 bytes in memory
    (data (i32.const 211) "Debug text message display below:\00")

    ;; String from 245 with 56 bytes in memory
    (data (i32.const 245) "Try to display an error message on javascript console...\00")

    ;; String from 302 with 6 bytes in memory
    (data (i32.const 302) "result\00")

    ;; String from 309 with 37 bytes in memory
    (data (i32.const 309) "The calculation result of PoissonPDF(\00")

    ;; String from 347 with 2 bytes in memory
    (data (i32.const 347) ", \00")

    ;; String from 350 with 5 bytes in memory
    (data (i32.const 350) ") is \00")

    ;; String from 356 with 1 bytes in memory
    (data (i32.const 356) "!\00")

    ;; String from 358 with 6 bytes in memory
    (data (i32.const 358) "result\00")

    ;; String from 365 with 5 bytes in memory
    (data (i32.const 365) "style\00")

    ;; String from 371 with 25 bytes in memory
    (data (i32.const 371) "color: green; font-size: \00")

    ;; String from 397 with 11 bytes in memory
    (data (i32.const 397) "HelloWorld!\00")

    ;; String from 409 with 80 bytes in memory
    (data (i32.const 409) "A hello world demo project for VisualBasic.NET WebAssembly compiler and runtime.\00")

    ;; String from 490 with 10 bytes in memory
    (data (i32.const 490) "xieguigang\00")

    ;; String from 501 with 10 bytes in memory
    (data (i32.const 501) "HelloWorld\00")

    ;; String from 512 with 20 bytes in memory
    (data (i32.const 512) "Copyright © MIT 2019\00")

    ;; String from 533 with 11 bytes in memory
    (data (i32.const 533) "HelloWorld!\00")

    ;; String from 545 with 36 bytes in memory
    (data (i32.const 545) "8750377f-b6e7-4fb5-886b-4c3fa451ec4c\00")

    ;; String from 582 with 13 bytes in memory
    (data (i32.const 582) "123.34.0.5466\00")

    ;; String from 596 with 9 bytes in memory
    (data (i32.const 596) "1.0.99.78\00")
    
    (global $helloWorld (mut i32) (i32.const 1))

(global $note (mut i32) (i32.const 14))

(global $note2 (mut i32) (i32.const 69))

    ;; export from [App]
    
    (export "RunApp" (func $RunApp))
    
    
    ;; export from [Math]
    
    (export "PoissonPDF" (func $PoissonPDF))
    (export "DisplayResult" (func $DisplayResult))
    
     

    ;; functions in [App]
    
    (func $RunApp  (result i32)
        ;; Public Function RunApp() As i32
        (local $textNode i32)
    (local $notes i32)
    (local $message1 i32)
    (local $message2 i32)
    (set_local $textNode (call $DOMById (i32.const 91)))
    (set_local $notes (call $DOMById (i32.const 96)))
    (set_local $message1 (call $createElement (i32.const 102)))
    (set_local $message2 (call $createElement (i32.const 104)))
    (call $setText (get_local $textNode) (get_global $helloWorld))
    (call $setText (get_local $message1) (get_global $note))
    (call $setText (get_local $message2) (get_global $note2))
    (call $appendChild (get_local $notes) (get_local $message1))
    (call $appendChild (get_local $notes) (get_local $message2))
    (call $setAttribute (get_local $notes) (i32.const 106) (i32.const 112))
    (call $setAttribute (get_local $message1) (i32.const 141) (i32.const 147))
    (call $setAttribute (get_local $message2) (i32.const 175) (i32.const 181))
    (call $log (i32.const 211))
    (call $warn (get_global $note))
    (call $info (get_global $note2))
    (call $error (i32.const 245))
    (return (i32.const 0))
    )
    
    
    ;; functions in [Math]
    
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
    (func $DisplayResult (param $k i32) (param $lambda f64) (param $fontsize i32) (result i32)
        ;; Public Function DisplayResult(k As i32, lambda As f64, fontsize As char*) As i32
        (local $pdf f64)
    (set_local $pdf (call $PoissonPDF (get_local $k) (get_local $lambda)))
    (call $setText (call $DOMById (i32.const 302)) (call $string.add (call $string.add (call $string.add (call $string.add (call $string.add (call $string.add (i32.const 309) (call $i32.toString (get_local $k))) (i32.const 347)) (call $f64.toString (get_local $lambda))) (i32.const 350)) (call $f64.toString (get_local $pdf))) (i32.const 356)))
    (call $setAttribute (call $DOMById (i32.const 358)) (i32.const 365) (call $string.add (i32.const 371) (call $char*.toString (get_local $fontsize))))
    (return (i32.const 0))
    )
    
    
    ;; functions in [AssemblyInfo]
    
    (func $AssemblyTitle  (result i32)
        ;; Public Function AssemblyTitle() As char*
        
    (return (i32.const 397))
    )
    (func $AssemblyDescription  (result i32)
        ;; Public Function AssemblyDescription() As char*
        
    (return (i32.const 409))
    )
    (func $AssemblyCompany  (result i32)
        ;; Public Function AssemblyCompany() As char*
        
    (return (i32.const 490))
    )
    (func $AssemblyProduct  (result i32)
        ;; Public Function AssemblyProduct() As char*
        
    (return (i32.const 501))
    )
    (func $AssemblyCopyright  (result i32)
        ;; Public Function AssemblyCopyright() As char*
        
    (return (i32.const 512))
    )
    (func $AssemblyTrademark  (result i32)
        ;; Public Function AssemblyTrademark() As char*
        
    (return (i32.const 533))
    )
    (func $Guid  (result i32)
        ;; Public Function Guid() As char*
        
    (return (i32.const 545))
    )
    (func $AssemblyVersion  (result i32)
        ;; Public Function AssemblyVersion() As char*
        
    (return (i32.const 582))
    )
    (func $AssemblyFileVersion  (result i32)
        ;; Public Function AssemblyFileVersion() As char*
        
    (return (i32.const 596))
    )
    )