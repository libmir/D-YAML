
//          Copyright Ferdinand Majerech 2011.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module mir.yaml.test.representer;

@safe unittest
{
    import std.array : Appender, array;
    import std.meta : AliasSeq;
    import std.path : baseName, stripExtension;
    import std.utf : toUTF8;

    import mir.yaml : dumper, Loader, YamlAlgebraic;
    import mir.yaml.test.common : assertNodesEqual, run;
    import mir.yaml.test.constructor : expected;

    /**
    Representer unittest. Dumps nodes, then loads them again.

    Params:
        baseName = Nodes in mir.yaml.test.constructor.expected for roundtripping.
    */
    static void testRepresenterTypes(string baseName) @safe
    {
        assert((baseName in expected) !is null, "Unimplemented representer test: " ~ baseName);

        YamlAlgebraic[] expectedNodes = expected[baseName];
        auto emitStream = new Appender!string;
        auto dumper = dumper();
        dumper.dump(emitStream, expectedNodes);

        immutable output = emitStream.data;

        auto loader = Loader.fromString(emitStream.data.toUTF8, "TEST");
        const readNodes = loader.loadAll;

        assert(expectedNodes.length == readNodes.length);
        foreach (n; 0 .. expectedNodes.length)
        {
            assertNodesEqual(expectedNodes[n], readNodes[n]);
        }
    }
    foreach (key, _; expected)
    {
        testRepresenterTypes(key);
    }
}
