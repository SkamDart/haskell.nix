{ system
  , compiler
  , flags
  , pkgs
  , hsPkgs
  , pkgconfPkgs
  , errorHandler
  , config
  , ... }:
  ({
    flags = {};
    package = {
      specVersion = "1.10";
      identifier = { name = "unix"; version = "2.7.3"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "libraries@haskell.org";
      author = "";
      homepage = "https://github.com/haskell/unix";
      url = "";
      synopsis = "POSIX functionality";
      description = "This package gives you access to the set of operating system\nservices standardised by\n<http://pubs.opengroup.org/onlinepubs/9699919799/ POSIX.1-2008>\n(or the IEEE Portable Operating System Interface for Computing\nEnvironments - IEEE Std. 1003.1).\n\nThe package is not supported under Windows.";
      buildType = "Configure";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ] ++ (pkgs.lib).optional (system.isWindows) (hsPkgs."unbuildable" or (errorHandler.buildDepError "unbuildable"));
        buildable = if system.isWindows then false else true;
        };
      tests = {
        "unix-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            ];
          buildable = true;
          };
        "FdReadBuf001" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            ];
          buildable = true;
          };
        "ForkProcess01" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            ];
          buildable = true;
          };
        "Signals002" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            ];
          buildable = true;
          };
        "Signals004" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            ];
          buildable = true;
          };
        "Posix004" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            ];
          buildable = true;
          };
        "Posix009" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            ];
          buildable = true;
          };
        "Posix014" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            ];
          buildable = true;
          };
        "T8108" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            ];
          buildable = true;
          };
        "ResourceLimit" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            ];
          buildable = true;
          };
        "Terminal" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            ];
          buildable = true;
          };
        "PutEnv001" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            ];
          buildable = true;
          };
        "Semaphore001" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            ];
          buildable = true;
          };
        };
      };
    } // {
    src = (pkgs.lib).mkDefault (pkgs.fetchurl {
      url = "http://hackage.haskell.org/package/unix-2.7.3.tar.gz";
      sha256 = "4625c2916545678e20715c4a043e002a4511fc301b4791cc8e7b33c317c42f30";
      });
    }) // {
    package-description-override = "name:           unix\nversion:        2.7.3\n-- NOTE: Don't forget to update ./changelog.md\nlicense:        BSD3\nlicense-file:   LICENSE\nmaintainer:     libraries@haskell.org\nhomepage:       https://github.com/haskell/unix\nbug-reports:    https://github.com/haskell/unix/issues\nsynopsis:       POSIX functionality\ncategory:       System\nbuild-type:     Configure\ncabal-version:  >= 1.10\ntested-with:    GHC>=7.4.1\ndescription:\n    This package gives you access to the set of operating system\n    services standardised by\n    <http://pubs.opengroup.org/onlinepubs/9699919799/ POSIX.1-2008>\n    (or the IEEE Portable Operating System Interface for Computing\n    Environments - IEEE Std. 1003.1).\n    .\n    The package is not supported under Windows.\n\nextra-source-files:\n    changelog.md\n    config.guess\n    config.sub\n    configure\n    configure.ac\n    include/HsUnix.h\n    include/HsUnixConfig.h.in\n    install-sh\n    unix.buildinfo.in\n\nextra-tmp-files:\n    autom4te.cache\n    config.log\n    config.status\n    include/HsUnixConfig.h\n    unix.buildinfo\n\nsource-repository head\n    type:     git\n    location: https://github.com/haskell/unix.git\n\nlibrary\n    default-language: Haskell2010\n    other-extensions:\n        CApiFFI\n        CPP\n        DeriveDataTypeable\n        InterruptibleFFI\n        NondecreasingIndentation\n        RankNTypes\n        RecordWildCards\n        Safe\n        Trustworthy\n\n    if os(windows)\n        -- This package currently supports neither Cygwin nor MinGW,\n        -- therefore os(windows) is effectively not supported.\n        build-depends: unbuildable<0\n        buildable: False\n\n    build-depends:\n        base        >= 4.10    && < 4.18,\n        bytestring  >= 0.9.2   && < 0.12,\n        time        >= 1.2     && < 1.13\n\n    exposed-modules:\n        System.Posix\n        System.Posix.ByteString\n\n        System.Posix.Error\n        System.Posix.Resource\n        System.Posix.Time\n        System.Posix.Unistd\n        System.Posix.User\n        System.Posix.Signals\n        System.Posix.Signals.Exts\n        System.Posix.Semaphore\n        System.Posix.SharedMem\n\n        System.Posix.ByteString.FilePath\n\n        System.Posix.Directory\n        System.Posix.Directory.ByteString\n\n        System.Posix.DynamicLinker.Module\n        System.Posix.DynamicLinker.Module.ByteString\n        System.Posix.DynamicLinker.Prim\n        System.Posix.DynamicLinker.ByteString\n        System.Posix.DynamicLinker\n\n        System.Posix.Files\n        System.Posix.Files.ByteString\n\n        System.Posix.IO\n        System.Posix.IO.ByteString\n\n        System.Posix.Env\n        System.Posix.Env.ByteString\n\n        System.Posix.Fcntl\n\n        System.Posix.Process\n        System.Posix.Process.Internals\n        System.Posix.Process.ByteString\n\n        System.Posix.Temp\n        System.Posix.Temp.ByteString\n\n        System.Posix.Terminal\n        System.Posix.Terminal.ByteString\n\n    other-modules:\n        System.Posix.Directory.Common\n        System.Posix.DynamicLinker.Common\n        System.Posix.Files.Common\n        System.Posix.IO.Common\n        System.Posix.Process.Common\n        System.Posix.Terminal.Common\n\n    ghc-options: -Wall\n\n    include-dirs: include\n    includes:\n        HsUnix.h\n        execvpe.h\n    install-includes:\n        HsUnix.h\n        execvpe.h\n    c-sources:\n        cbits/HsUnix.c\n        cbits/execvpe.c\n\ntest-suite unix-tests\n    hs-source-dirs: tests\n    main-is: Test.hs\n    other-modules:\n        FileStatus\n        FileStatusByteString\n        Signals001\n    type: exitcode-stdio-1.0\n    default-language: Haskell2010\n    build-depends: base, tasty, tasty-hunit, unix\n    ghc-options: -Wall -with-rtsopts=-V0\n\ntest-suite FdReadBuf001\n    hs-source-dirs: tests\n    main-is: FdReadBuf001.hs\n    type: exitcode-stdio-1.0\n    default-language: Haskell2010\n    build-depends: base, unix\n    ghc-options: -Wall -threaded\n\ntest-suite ForkProcess01\n    hs-source-dirs: tests\n    main-is: ForkProcess01.hs\n    type: exitcode-stdio-1.0\n    default-language: Haskell2010\n    build-depends: base, unix\n    ghc-options: -Wall\n\ntest-suite Signals002\n    hs-source-dirs: tests\n    main-is: Signals002.hs\n    type: exitcode-stdio-1.0\n    default-language: Haskell2010\n    build-depends: base, unix\n    ghc-options: -Wall\n\ntest-suite Signals004\n    hs-source-dirs: tests\n    main-is: Signals004.hs\n    type: exitcode-stdio-1.0\n    default-language: Haskell2010\n    build-depends: base, unix\n    ghc-options: -Wall\n\ntest-suite Posix004\n    hs-source-dirs: tests\n    main-is: Posix004.hs\n    type: exitcode-stdio-1.0\n    default-language: Haskell2010\n    build-depends: base, unix\n    ghc-options: -Wall\n\ntest-suite Posix009\n    hs-source-dirs: tests\n    main-is: Posix009.hs\n    type: exitcode-stdio-1.0\n    default-language: Haskell2010\n    build-depends: base, unix\n    ghc-options: -Wall -with-rtsopts=-V0\n\ntest-suite Posix014\n    hs-source-dirs: tests\n    main-is: Posix014.hs\n    type: exitcode-stdio-1.0\n    default-language: Haskell2010\n    build-depends: base, unix\n    ghc-options: -Wall\n\ntest-suite T8108\n    hs-source-dirs: tests\n    main-is: T8108.hs\n    type: exitcode-stdio-1.0\n    default-language: Haskell2010\n    build-depends: base, unix\n    ghc-options: -Wall\n\ntest-suite ResourceLimit\n    hs-source-dirs: tests\n    main-is: ResourceLimit.hs\n    type: exitcode-stdio-1.0\n    default-language: Haskell2010\n    build-depends: base, unix, tasty-hunit\n    ghc-options: -Wall\n\ntest-suite Terminal\n    hs-source-dirs: tests\n    main-is: Terminal.hs\n    type: exitcode-stdio-1.0\n    default-language: Haskell2010\n    build-depends: base, unix, tasty-hunit\n    ghc-options: -Wall\n\ntest-suite PutEnv001\n    hs-source-dirs: tests\n    main-is: PutEnv001.hs\n    type: exitcode-stdio-1.0\n    default-language: Haskell2010\n    build-depends: base, unix, tasty, tasty-hunit\n    ghc-options: -Wall -with-rtsopts=-V0 -O0\n\ntest-suite Semaphore001\n    hs-source-dirs: tests\n    main-is: Semaphore001.hs\n    type: exitcode-stdio-1.0\n    default-language: Haskell2010\n    build-depends: base, unix\n    ghc-options: -Wall\n";
    }