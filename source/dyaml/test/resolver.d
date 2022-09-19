
//          Copyright Ferdinand Majerech 2011.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module dyaml.test.resolver;

@safe unittest
{
    import std.conv : text;
    import std.file : readText;
    import std.string : strip;

    import dyaml : Loader, YamlAlgebraic;
    import dyaml.test.common : run;


    /**
    Implicit tag resolution unittest.

    Params:
        dataFilename = File with unittest data.
        detectFilename = Dummy filename used to specify which data filenames to use.
    */
    static void testImplicitResolver(string dataFilename, string detectFilename) @safe
    {
        const correctTag = readText(detectFilename).strip();

        auto node = Loader.fromFile(dataFilename).load();
        assert(node.kind == YamlAlgebraic.Kind.array, text("Expected sequence when reading '", dataFilename, "', got ", node.kind));
        foreach (YamlAlgebraic scalar; node.get!"array")
        {
            assert(scalar.kind != YamlAlgebraic.Kind.array && scalar.kind != YamlAlgebraic.Kind.object, text("Expected sequence of scalars when reading '", dataFilename, "', got sequence of ", scalar.kind));
            assert(scalar.tag == correctTag, text("Expected tag '", correctTag, "' when reading '", dataFilename, "', got '", scalar.tag, "'"));
        }
    }
    run(&testImplicitResolver, ["data", "detect"]);
}
