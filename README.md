ElixirStructCompileOrderIssue
=============================

Simplified test case for a strange bug(?) in Elixir compiler (submitted as [an issue in elixir-lang/elixir](https://github.com/elixir-lang/elixir/issues/4055))

- My environment
    - Erlang/OTP: 18.1
    - Elixir version I tested:
        - v1.0.5
        - v1.1.1
        - the latest master (d094160ae99c3cf8ee79b6c2f768eb9ba6f1e1de)

- Error message (using v1.1.1):

```
$ mix compile
Compiled lib/macro.ex

== Compilation error on file lib/struct_user.ex ==
** (CompileError) lib/struct_user.ex:2: S.__struct__/0 is undefined, cannot expand struct S
    (elixir) src/elixir_map.erl:58: :elixir_map.translate_struct/4
    (stdlib) lists.erl:1353: :lists.mapfoldl/3

```

- Some things to note
    - When I change `NonexistingModule.module_info` to something else the compile error disappears. Invoking `module_info` to nonexisting module seems somewhat special?
        - `raise "foo"`: different type of error (`UndefinedFunctionError` to `RuntimeError`)
        - `String.module_info`: no exception
        - `String.foo`: The same `UndefinedFunctionError` but this is OK
    - When I first comment out all the lines in `struct_user.ex`, compile the rest, uncomment and recompile, everything compiles fine.
