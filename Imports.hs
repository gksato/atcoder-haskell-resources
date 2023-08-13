{-# OPTIONS_GHC -Wno-unused-imports #-}
module Main where


-- Cabal-3.10.1.0
import qualified Distribution.Backpack.Configure
import qualified Distribution.Backpack.ComponentsGraph
import qualified Distribution.Backpack.ConfiguredComponent
import qualified Distribution.Backpack.DescribeUnitId
import qualified Distribution.Backpack.FullUnitId
import qualified Distribution.Backpack.LinkedComponent
import qualified Distribution.Backpack.ModSubst
import qualified Distribution.Backpack.ModuleShape
import qualified Distribution.Backpack.PreModuleShape
import qualified Distribution.Utils.IOData
import qualified Distribution.Utils.LogProgress
import qualified Distribution.Utils.MapAccum
import qualified Distribution.Compat.CreatePipe
import qualified Distribution.Compat.Directory
import qualified Distribution.Compat.Environment
import qualified Distribution.Compat.FilePath
import qualified Distribution.Compat.Internal.TempFile
import qualified Distribution.Compat.ResponseFile
import qualified Distribution.Compat.Prelude.Internal
import qualified Distribution.Compat.Process
import qualified Distribution.Compat.Stack
import qualified Distribution.Compat.Time
import qualified Distribution.Make
import qualified Distribution.PackageDescription.Check
import qualified Distribution.ReadE
import qualified Distribution.Simple
import qualified Distribution.Simple.Bench
import qualified Distribution.Simple.Build
import qualified Distribution.Simple.Build.Macros
import qualified Distribution.Simple.Build.PackageInfoModule
import qualified Distribution.Simple.Build.PathsModule
import qualified Distribution.Simple.BuildPaths
import qualified Distribution.Simple.BuildTarget
import qualified Distribution.Simple.BuildToolDepends
import qualified Distribution.Simple.CCompiler
import qualified Distribution.Simple.Command
import qualified Distribution.Simple.Compiler
import qualified Distribution.Simple.Configure
import qualified Distribution.Simple.Flag
import qualified Distribution.Simple.GHC
import qualified Distribution.Simple.GHCJS
import qualified Distribution.Simple.Haddock
import qualified Distribution.Simple.Glob
import qualified Distribution.Simple.HaskellSuite
import qualified Distribution.Simple.Hpc
import qualified Distribution.Simple.Install
import qualified Distribution.Simple.InstallDirs
import qualified Distribution.Simple.InstallDirs.Internal
import qualified Distribution.Simple.LocalBuildInfo
import qualified Distribution.Simple.PackageDescription
import qualified Distribution.Simple.PackageIndex
import qualified Distribution.Simple.PreProcess
import qualified Distribution.Simple.PreProcess.Unlit
import qualified Distribution.Simple.Program
import qualified Distribution.Simple.Program.Ar
import qualified Distribution.Simple.Program.Builtin
import qualified Distribution.Simple.Program.Db
import qualified Distribution.Simple.Program.Find
import qualified Distribution.Simple.Program.GHC
import qualified Distribution.Simple.Program.HcPkg
import qualified Distribution.Simple.Program.Hpc
import qualified Distribution.Simple.Program.Internal
import qualified Distribution.Simple.Program.Ld
import qualified Distribution.Simple.Program.ResponseFile
import qualified Distribution.Simple.Program.Run
import qualified Distribution.Simple.Program.Script
import qualified Distribution.Simple.Program.Strip
import qualified Distribution.Simple.Program.Types
import qualified Distribution.Simple.Register
import qualified Distribution.Simple.Setup
import qualified Distribution.Simple.ShowBuildInfo
import qualified Distribution.Simple.SrcDist
import qualified Distribution.Simple.Test
import qualified Distribution.Simple.Test.ExeV10
import qualified Distribution.Simple.Test.LibV09
import qualified Distribution.Simple.Test.Log
import qualified Distribution.Simple.UHC
import qualified Distribution.Simple.UserHooks
import qualified Distribution.Simple.Utils
import qualified Distribution.TestSuite
import qualified Distribution.Types.AnnotatedId
import qualified Distribution.Types.ComponentInclude
import qualified Distribution.Types.DumpBuildInfo
import qualified Distribution.Types.PackageName.Magic
import qualified Distribution.Types.ComponentLocalBuildInfo
import qualified Distribution.Types.LocalBuildInfo
import qualified Distribution.Types.TargetInfo
import qualified Distribution.Types.GivenComponent
import qualified Distribution.Utils.Json
import qualified Distribution.Utils.NubList
import qualified Distribution.Utils.Progress
import qualified Distribution.Verbosity
import qualified Distribution.Verbosity.Internal

-- Cabal-syntax-3.10.1.0
import qualified Distribution.Backpack
import qualified Distribution.CabalSpecVersion
import qualified Distribution.Compat.Binary
import qualified Distribution.Compat.CharParsing
import qualified Distribution.Compat.DList
import qualified Distribution.Compat.Exception
import qualified Distribution.Compat.Graph
import qualified Distribution.Compat.Lens
import qualified Distribution.Compat.MonadFail
import qualified Distribution.Compat.Newtype
import qualified Distribution.Compat.NonEmptySet
import qualified Distribution.Compat.Parsing
import qualified Distribution.Compat.Prelude
import qualified Distribution.Compat.Semigroup
import qualified Distribution.Compat.Typeable
import qualified Distribution.Compiler
import qualified Distribution.FieldGrammar
import qualified Distribution.FieldGrammar.Class
import qualified Distribution.FieldGrammar.FieldDescrs
import qualified Distribution.FieldGrammar.Newtypes
import qualified Distribution.FieldGrammar.Parsec
import qualified Distribution.FieldGrammar.Pretty
import qualified Distribution.Fields
import qualified Distribution.Fields.ConfVar
import qualified Distribution.Fields.Field
import qualified Distribution.Fields.Lexer
import qualified Distribution.Fields.LexerMonad
import qualified Distribution.Fields.ParseResult
import qualified Distribution.Fields.Parser
import qualified Distribution.Fields.Pretty
import qualified Distribution.InstalledPackageInfo
import qualified Distribution.License
import qualified Distribution.ModuleName
import qualified Distribution.Package
import qualified Distribution.PackageDescription
import qualified Distribution.PackageDescription.Configuration
import qualified Distribution.PackageDescription.FieldGrammar
import qualified Distribution.PackageDescription.Parsec
import qualified Distribution.PackageDescription.PrettyPrint
import qualified Distribution.PackageDescription.Quirks
import qualified Distribution.PackageDescription.Utils
import qualified Distribution.Parsec
import qualified Distribution.Parsec.Error
import qualified Distribution.Parsec.FieldLineStream
import qualified Distribution.Parsec.Position
import qualified Distribution.Parsec.Warning
import qualified Distribution.Pretty
import qualified Distribution.SPDX
import qualified Distribution.SPDX.License
import qualified Distribution.SPDX.LicenseExceptionId
import qualified Distribution.SPDX.LicenseExpression
import qualified Distribution.SPDX.LicenseId
import qualified Distribution.SPDX.LicenseListVersion
import qualified Distribution.SPDX.LicenseReference
import qualified Distribution.System
import qualified Distribution.Text
import qualified Distribution.Types.AbiDependency
import qualified Distribution.Types.AbiHash
import qualified Distribution.Types.Benchmark
import qualified Distribution.Types.Benchmark.Lens
import qualified Distribution.Types.BenchmarkInterface
import qualified Distribution.Types.BenchmarkType
import qualified Distribution.Types.BuildInfo
import qualified Distribution.Types.BuildInfo.Lens
import qualified Distribution.Types.BuildType
import qualified Distribution.Types.Component
import qualified Distribution.Types.ComponentId
import qualified Distribution.Types.ComponentName
import qualified Distribution.Types.ComponentRequestedSpec
import qualified Distribution.Types.CondTree
import qualified Distribution.Types.Condition
import qualified Distribution.Types.ConfVar
import qualified Distribution.Types.Dependency
import qualified Distribution.Types.DependencyMap
import qualified Distribution.Types.ExeDependency
import qualified Distribution.Types.Executable
import qualified Distribution.Types.Executable.Lens
import qualified Distribution.Types.ExecutableScope
import qualified Distribution.Types.ExposedModule
import qualified Distribution.Types.Flag
import qualified Distribution.Types.ForeignLib
import qualified Distribution.Types.ForeignLib.Lens
import qualified Distribution.Types.ForeignLibOption
import qualified Distribution.Types.ForeignLibType
import qualified Distribution.Types.GenericPackageDescription
import qualified Distribution.Types.GenericPackageDescription.Lens
import qualified Distribution.Types.HookedBuildInfo
import qualified Distribution.Types.IncludeRenaming
import qualified Distribution.Types.InstalledPackageInfo
import qualified Distribution.Types.InstalledPackageInfo.Lens
import qualified Distribution.Types.InstalledPackageInfo.FieldGrammar
import qualified Distribution.Types.LegacyExeDependency
import qualified Distribution.Types.Lens
import qualified Distribution.Types.Library
import qualified Distribution.Types.Library.Lens
import qualified Distribution.Types.LibraryName
import qualified Distribution.Types.LibraryVisibility
import qualified Distribution.Types.Mixin
import qualified Distribution.Types.Module
import qualified Distribution.Types.ModuleReexport
import qualified Distribution.Types.ModuleRenaming
import qualified Distribution.Types.MungedPackageId
import qualified Distribution.Types.MungedPackageName
import qualified Distribution.Types.PackageDescription
import qualified Distribution.Types.PackageDescription.Lens
import qualified Distribution.Types.PackageId
import qualified Distribution.Types.PackageId.Lens
import qualified Distribution.Types.PackageName
import qualified Distribution.Types.PackageVersionConstraint
import qualified Distribution.Types.PkgconfigDependency
import qualified Distribution.Types.PkgconfigName
import qualified Distribution.Types.PkgconfigVersion
import qualified Distribution.Types.PkgconfigVersionRange
import qualified Distribution.Types.SetupBuildInfo
import qualified Distribution.Types.SetupBuildInfo.Lens
import qualified Distribution.Types.SourceRepo
import qualified Distribution.Types.SourceRepo.Lens
import qualified Distribution.Types.TestSuite
import qualified Distribution.Types.TestSuite.Lens
import qualified Distribution.Types.TestSuiteInterface
import qualified Distribution.Types.TestType
import qualified Distribution.Types.UnitId
import qualified Distribution.Types.UnqualComponentName
import qualified Distribution.Types.Version
import qualified Distribution.Types.VersionInterval
import qualified Distribution.Types.VersionInterval.Legacy
import qualified Distribution.Types.VersionRange
import qualified Distribution.Types.VersionRange.Internal
import qualified Distribution.Utils.Base62
import qualified Distribution.Utils.Generic
import qualified Distribution.Utils.MD5
import qualified Distribution.Utils.Path
import qualified Distribution.Utils.ShortText
import qualified Distribution.Utils.String
import qualified Distribution.Utils.Structured
import qualified Distribution.Version
import qualified Language.Haskell.Extension

-- QuickCheck-2.14.3
import qualified Test.QuickCheck
import qualified Test.QuickCheck.Arbitrary
import qualified Test.QuickCheck.Gen
import qualified Test.QuickCheck.Gen.Unsafe
import qualified Test.QuickCheck.Monadic
import qualified Test.QuickCheck.Modifiers
import qualified Test.QuickCheck.Property
import qualified Test.QuickCheck.Test
import qualified Test.QuickCheck.Text
import qualified Test.QuickCheck.Poly
import qualified Test.QuickCheck.State
import qualified Test.QuickCheck.Random
import qualified Test.QuickCheck.Exception
import qualified Test.QuickCheck.Features
import qualified Test.QuickCheck.Function
import qualified Test.QuickCheck.All

-- adjunctions-4.4.2
import qualified Control.Comonad.Representable.Store
import qualified Control.Comonad.Trans.Adjoint
import qualified Control.Monad.Representable.Reader
import qualified Control.Monad.Representable.State
import qualified Control.Monad.Trans.Adjoint
import qualified Control.Monad.Trans.Contravariant.Adjoint
import qualified Control.Monad.Trans.Conts
import qualified Data.Functor.Adjunction
import qualified Data.Functor.Contravariant.Adjunction
import qualified Data.Functor.Contravariant.Rep
import qualified Data.Functor.Rep

-- array-0.5.4.0
import qualified Data.Array
import qualified Data.Array.Base
import qualified Data.Array.IArray
import qualified Data.Array.IO
import qualified Data.Array.IO.Safe
import qualified Data.Array.IO.Internals
import qualified Data.Array.MArray
import qualified Data.Array.MArray.Safe
import qualified Data.Array.ST
import qualified Data.Array.ST.Safe
import qualified Data.Array.Storable
import qualified Data.Array.Storable.Safe
import qualified Data.Array.Storable.Internals
import qualified Data.Array.Unboxed
import qualified Data.Array.Unsafe

-- attoparsec-0.14.4
import qualified Data.Attoparsec
import qualified Data.Attoparsec.ByteString
import qualified Data.Attoparsec.ByteString.Char8
import qualified Data.Attoparsec.ByteString.Lazy
import qualified Data.Attoparsec.Char8
import qualified Data.Attoparsec.Combinator
import qualified Data.Attoparsec.Internal
import qualified Data.Attoparsec.Internal.Types
import qualified Data.Attoparsec.Lazy
import qualified Data.Attoparsec.Number
import qualified Data.Attoparsec.Text
import qualified Data.Attoparsec.Text.Lazy
import qualified Data.Attoparsec.Types
import qualified Data.Attoparsec.Zepto

-- base-4.17.1.0
import qualified Control.Applicative
import qualified Control.Arrow
import qualified Control.Category
import qualified Control.Concurrent
import qualified Control.Concurrent.Chan
import qualified Control.Concurrent.MVar
import qualified Control.Concurrent.QSem
import qualified Control.Concurrent.QSemN
import qualified Control.Exception
import qualified Control.Exception.Base
import qualified Control.Monad
import qualified Control.Monad.Fail
import qualified Control.Monad.Fix
import qualified Control.Monad.Instances
import qualified Control.Monad.IO.Class
import qualified Control.Monad.ST
import qualified Control.Monad.ST.Lazy
import qualified Control.Monad.ST.Lazy.Safe
import qualified Control.Monad.ST.Lazy.Unsafe
import qualified Control.Monad.ST.Safe
import qualified Control.Monad.ST.Strict
import qualified Control.Monad.ST.Unsafe
import qualified Control.Monad.Zip
import qualified Data.Array.Byte
import qualified Data.Bifoldable
import qualified Data.Bifunctor
import qualified Data.Bitraversable
import qualified Data.Bits
import qualified Data.Bool
import qualified Data.Char
import qualified Data.Coerce
import qualified Data.Complex
import qualified Data.Data
import qualified Data.Dynamic
import qualified Data.Either
import qualified Data.Eq
import qualified Data.Fixed
import qualified Data.Foldable
import qualified Data.Function
import qualified Data.Functor
import qualified Data.Functor.Classes
import qualified Data.Functor.Contravariant
import qualified Data.Functor.Compose
import qualified Data.Functor.Const
import qualified Data.Functor.Identity
import qualified Data.Functor.Product
import qualified Data.Functor.Sum
import qualified Data.IORef
import qualified Data.Int
import qualified Data.Ix
import qualified Data.Kind
import qualified Data.List
import qualified Data.List.NonEmpty
import qualified Data.Maybe
import qualified Data.Monoid
import qualified Data.Ord
import qualified Data.Proxy
import qualified Data.Ratio
import qualified Data.Semigroup
import qualified Data.STRef
import qualified Data.STRef.Lazy
import qualified Data.STRef.Strict
import qualified Data.String
import qualified Data.Traversable
import qualified Data.Tuple
import qualified Data.Type.Bool
import qualified Data.Type.Coercion
import qualified Data.Type.Equality
import qualified Data.Type.Ord
import qualified Data.Typeable
import qualified Data.Unique
import qualified Data.Version
import qualified Data.Void
import qualified Data.Word
import qualified Debug.Trace
import qualified Foreign
import qualified Foreign.C
import qualified Foreign.C.Error
import qualified Foreign.C.String
import qualified Foreign.C.Types
import qualified Foreign.Concurrent
import qualified Foreign.ForeignPtr
import qualified Foreign.ForeignPtr.Safe
import qualified Foreign.ForeignPtr.Unsafe
import qualified Foreign.Marshal
import qualified Foreign.Marshal.Alloc
import qualified Foreign.Marshal.Array
import qualified Foreign.Marshal.Error
import qualified Foreign.Marshal.Pool
import qualified Foreign.Marshal.Safe
import qualified Foreign.Marshal.Unsafe
import qualified Foreign.Marshal.Utils
import qualified Foreign.Ptr
import qualified Foreign.Safe
import qualified Foreign.StablePtr
import qualified Foreign.Storable
import qualified GHC.Arr
import qualified GHC.ArrayArray
import qualified GHC.Base
import qualified GHC.Bits
import qualified GHC.ByteOrder
import qualified GHC.Char
import qualified GHC.Clock
import qualified GHC.Conc
import qualified GHC.Conc.IO
import qualified GHC.Conc.Signal
import qualified GHC.Conc.Sync
import qualified GHC.ConsoleHandler
import qualified GHC.Constants
import qualified GHC.Desugar
import qualified GHC.Enum
import qualified GHC.Environment
import qualified GHC.Err
import qualified GHC.Event.TimeOut
import qualified GHC.Exception
import qualified GHC.Exception.Type
import qualified GHC.ExecutionStack
import qualified GHC.ExecutionStack.Internal
import qualified GHC.Exts
import qualified GHC.Fingerprint
import qualified GHC.Fingerprint.Type
import qualified GHC.Float
import qualified GHC.Float.ConversionUtils
import qualified GHC.Float.RealFracMethods
import qualified GHC.Foreign
import qualified GHC.ForeignPtr
import qualified GHC.GHCi
import qualified GHC.GHCi.Helpers
import qualified GHC.Generics
import qualified GHC.IO
import qualified GHC.IO.Buffer
import qualified GHC.IO.BufferedIO
import qualified GHC.IO.Device
import qualified GHC.IO.Encoding
import qualified GHC.IO.Encoding.CodePage
import qualified GHC.IO.Encoding.Failure
import qualified GHC.IO.Encoding.Iconv
import qualified GHC.IO.Encoding.Latin1
import qualified GHC.IO.Encoding.Types
import qualified GHC.IO.Encoding.UTF16
import qualified GHC.IO.Encoding.UTF32
import qualified GHC.IO.Encoding.UTF8
import qualified GHC.IO.Exception
import qualified GHC.IO.FD
import qualified GHC.IO.Handle
import qualified GHC.IO.Handle.FD
import qualified GHC.IO.Handle.Internals
import qualified GHC.IO.Handle.Lock
import qualified GHC.IO.Handle.Text
import qualified GHC.IO.Handle.Types
import qualified GHC.IO.IOMode
import qualified GHC.IO.Unsafe
import qualified GHC.IO.StdHandles
import qualified GHC.IO.SubSystem
import qualified GHC.IOArray
import qualified GHC.IORef
import qualified GHC.Int
import qualified GHC.Integer
import qualified GHC.Integer.Logarithms
import qualified GHC.IsList
import qualified GHC.Ix
import qualified GHC.List
import qualified GHC.Maybe
import qualified GHC.MVar
import qualified GHC.Natural
import qualified GHC.Num
import qualified GHC.OldList
import qualified GHC.OverloadedLabels
import qualified GHC.Pack
import qualified GHC.Profiling
import qualified GHC.Ptr
import qualified GHC.Read
import qualified GHC.Real
import qualified GHC.Records
import qualified GHC.ResponseFile
import qualified GHC.RTS.Flags
import qualified GHC.ST
import qualified GHC.Stack.CloneStack
import qualified GHC.StaticPtr
import qualified GHC.STRef
import qualified GHC.Show
import qualified GHC.Stable
import qualified GHC.StableName
import qualified GHC.Stack
import qualified GHC.Stack.CCS
import qualified GHC.Stack.Types
import qualified GHC.Stats
import qualified GHC.Storable
import qualified GHC.TopHandler
import qualified GHC.TypeError
import qualified GHC.TypeLits
import qualified GHC.TypeLits.Internal
import qualified GHC.TypeNats
import qualified GHC.TypeNats.Internal
import qualified GHC.Unicode
import qualified GHC.Weak
import qualified GHC.Word
import qualified Numeric
import qualified Numeric.Natural
import qualified Prelude
import qualified System.CPUTime
import qualified System.Console.GetOpt
import qualified System.Environment
import qualified System.Environment.Blank
import qualified System.Exit
import qualified System.IO
import qualified System.IO.Error
import qualified System.IO.Unsafe
import qualified System.Info
import qualified System.Mem
import qualified System.Mem.StableName
import qualified System.Mem.Weak
import qualified System.Posix.Internals
import qualified System.Posix.Types
import qualified System.Timeout
import qualified Text.ParserCombinators.ReadP
import qualified Text.ParserCombinators.ReadPrec
import qualified Text.Printf
import qualified Text.Read
import qualified Text.Read.Lex
import qualified Text.Show
import qualified Text.Show.Functions
import qualified Type.Reflection
import qualified Type.Reflection.Unsafe
import qualified Unsafe.Coerce
import qualified GHC.IOPort
import qualified GHC.Event

-- bifunctors-5.6.1
import qualified Data.Biapplicative
import qualified Data.Bifunctor.Biap
import qualified Data.Bifunctor.Biff
import qualified Data.Bifunctor.Clown
import qualified Data.Bifunctor.Fix
import qualified Data.Bifunctor.Flip
import qualified Data.Bifunctor.Functor
import qualified Data.Bifunctor.Join
import qualified Data.Bifunctor.Joker
import qualified Data.Bifunctor.Product
import qualified Data.Bifunctor.Sum
import qualified Data.Bifunctor.Tannen
import qualified Data.Bifunctor.TH
import qualified Data.Bifunctor.Wrapped

-- binary-0.8.9.1
import qualified Data.Binary
import qualified Data.Binary.Put
import qualified Data.Binary.Get
import qualified Data.Binary.Get.Internal
import qualified Data.Binary.Builder

-- bitvec-1.1.4.0
import qualified Data.Bit
import qualified Data.Bit.ThreadSafe

-- bytestring-0.11.4.0
import qualified Data.ByteString
import qualified Data.ByteString.Char8
import qualified Data.ByteString.Unsafe
import qualified Data.ByteString.Internal
import qualified Data.ByteString.Lazy
import qualified Data.ByteString.Lazy.Char8
import qualified Data.ByteString.Lazy.Internal
import qualified Data.ByteString.Short
import qualified Data.ByteString.Short.Internal
import qualified Data.ByteString.Builder
import qualified Data.ByteString.Builder.Extra
import qualified Data.ByteString.Builder.Prim
import qualified Data.ByteString.Builder.RealFloat
import qualified Data.ByteString.Builder.Internal
import qualified Data.ByteString.Builder.Prim.Internal

-- comonad-5.0.8
import qualified Control.Comonad
import qualified Control.Comonad.Env
import qualified Control.Comonad.Env.Class
import qualified Control.Comonad.Hoist.Class
import qualified Control.Comonad.Identity
import qualified Control.Comonad.Store
import qualified Control.Comonad.Store.Class
import qualified Control.Comonad.Traced
import qualified Control.Comonad.Traced.Class
import qualified Control.Comonad.Trans.Class
import qualified Control.Comonad.Trans.Env
import qualified Control.Comonad.Trans.Identity
import qualified Control.Comonad.Trans.Store
import qualified Control.Comonad.Trans.Traced
import qualified Data.Functor.Composition

-- containers-0.6.7
import qualified Data.Containers.ListUtils
import qualified Data.IntMap
import qualified Data.IntMap.Lazy
import qualified Data.IntMap.Strict
import qualified Data.IntMap.Strict.Internal
import qualified Data.IntMap.Internal
import qualified Data.IntMap.Internal.Debug
import qualified Data.IntMap.Merge.Lazy
import qualified Data.IntMap.Merge.Strict
import qualified Data.IntSet.Internal
import qualified Data.IntSet
import qualified Data.Map
import qualified Data.Map.Lazy
import qualified Data.Map.Merge.Lazy
import qualified Data.Map.Strict.Internal
import qualified Data.Map.Strict
import qualified Data.Map.Merge.Strict
import qualified Data.Map.Internal
import qualified Data.Map.Internal.Debug
import qualified Data.Set.Internal
import qualified Data.Set
import qualified Data.Graph
import qualified Data.Sequence
import qualified Data.Sequence.Internal
import qualified Data.Sequence.Internal.Sorting
import qualified Data.Tree
import qualified Utils.Containers.Internal.BitUtil
import qualified Utils.Containers.Internal.BitQueue
import qualified Utils.Containers.Internal.StrictPair

-- contravariant-1.5.5
import qualified Data.Functor.Contravariant.Compose
import qualified Data.Functor.Contravariant.Divisible
import qualified Data.Functor.Contravariant.Generic

-- deepseq-1.4.8.0
import qualified Control.DeepSeq

-- directory-1.3.7.1
import qualified System.Directory
import qualified System.Directory.Internal
import qualified System.Directory.Internal.Prelude

-- distributive-0.6.2.1
import qualified Data.Distributive
import qualified Data.Distributive.Generic

-- exceptions-0.10.7
import qualified Control.Monad.Catch
import qualified Control.Monad.Catch.Pure

-- extra-1.7.14
import qualified Extra
import qualified Control.Concurrent.Extra
import qualified Control.Exception.Extra
import qualified Control.Monad.Extra
import qualified Data.Foldable.Extra
import qualified Data.Either.Extra
import qualified Data.IORef.Extra
import qualified Data.List.Extra
import qualified Data.List.NonEmpty.Extra
import qualified Data.Monoid.Extra
import qualified Data.Tuple.Extra
import qualified Data.Typeable.Extra
import qualified Data.Version.Extra
import qualified Numeric.Extra
import qualified System.Directory.Extra
import qualified System.Environment.Extra
import qualified System.Info.Extra
import qualified System.IO.Extra
import qualified System.Process.Extra
import qualified System.Time.Extra
import qualified Text.Read.Extra

-- fgl-5.8.1.1
import qualified Data.Graph.Inductive.Internal.Heap
import qualified Data.Graph.Inductive.Internal.Queue
import qualified Data.Graph.Inductive.Internal.RootPath
import qualified Data.Graph.Inductive.Internal.Thread
import qualified Data.Graph.Inductive.Basic
import qualified Data.Graph.Inductive.Example
import qualified Data.Graph.Inductive.Graph
import qualified Data.Graph.Inductive.Monad
import qualified Data.Graph.Inductive.NodeMap
import qualified Data.Graph.Inductive.PatriciaTree
import qualified Data.Graph.Inductive.Query
import qualified Data.Graph.Inductive.Tree
import qualified Data.Graph.Inductive.Monad.IOArray
import qualified Data.Graph.Inductive.Monad.STArray
import qualified Data.Graph.Inductive.Query.ArtPoint
import qualified Data.Graph.Inductive.Query.BCC
import qualified Data.Graph.Inductive.Query.BFS
import qualified Data.Graph.Inductive.Query.DFS
import qualified Data.Graph.Inductive.Query.Dominators
import qualified Data.Graph.Inductive.Query.GVD
import qualified Data.Graph.Inductive.Query.Indep
import qualified Data.Graph.Inductive.Query.MST
import qualified Data.Graph.Inductive.Query.MaxFlow
import qualified Data.Graph.Inductive.Query.MaxFlow2
import qualified Data.Graph.Inductive.Query.Monad
import qualified Data.Graph.Inductive.Query.SP
import qualified Data.Graph.Inductive.Query.TransClos
import qualified Data.Graph.Inductive

-- filepath-1.4.2.2
import qualified System.FilePath
import qualified System.FilePath.Posix
import qualified System.FilePath.Windows

-- free-5.2
import qualified Control.Applicative.Free
import qualified Control.Applicative.Free.Fast
import qualified Control.Applicative.Free.Final
import qualified Control.Applicative.Trans.Free
import qualified Control.Alternative.Free
import qualified Control.Alternative.Free.Final
import qualified Control.Comonad.Cofree
import qualified Control.Comonad.Cofree.Class
import qualified Control.Comonad.Trans.Cofree
import qualified Control.Comonad.Trans.Coiter
import qualified Control.Monad.Free
import qualified Control.Monad.Free.Ap
import qualified Control.Monad.Free.Church
import qualified Control.Monad.Free.Class
import qualified Control.Monad.Free.TH
import qualified Control.Monad.Trans.Free
import qualified Control.Monad.Trans.Free.Ap
import qualified Control.Monad.Trans.Free.Church
import qualified Control.Monad.Trans.Iter

-- ghc-bignum-1.3
import qualified GHC.Num.Primitives
import qualified GHC.Num.WordArray
import qualified GHC.Num.BigNat
import qualified GHC.Num.Backend
import qualified GHC.Num.Backend.Selected
import qualified GHC.Num.Backend.Native
import qualified GHC.Num.Natural
import qualified GHC.Num.Integer

-- ghc-prim-0.9.0
import qualified GHC.CString
import qualified GHC.Classes
import qualified GHC.Debug
import qualified GHC.Magic
import qualified GHC.Magic.Dict
import qualified GHC.Prim.Ext
import qualified GHC.Prim.Panic
import qualified GHC.Prim.Exception
import qualified GHC.Prim.PtrEq
import qualified GHC.PrimopWrappers
import qualified GHC.Tuple
import qualified GHC.Types

-- hashable-1.4.2.0
import qualified Data.Hashable
import qualified Data.Hashable.Generic
import qualified Data.Hashable.Lifted

-- heaps-0.4
import qualified Data.Heap

-- indexed-traversable-0.1.2.1
import qualified Data.Foldable.WithIndex
import qualified Data.Functor.WithIndex
import qualified Data.Traversable.WithIndex

-- indexed-traversable-instances-0.1.1.2
import qualified Data.Functor.WithIndex.Instances

-- integer-gmp-1.1
import qualified GHC.Integer.GMP.Internals

-- integer-logarithms-1.0.3.1
import qualified Math.NumberTheory.Logarithms
import qualified Math.NumberTheory.Powers.Integer
import qualified Math.NumberTheory.Powers.Natural
import qualified GHC.Integer.Logarithms.Compat

-- kan-extensions-5.2.5
import qualified Control.Comonad.Density
import qualified Control.Monad.Co
import qualified Control.Monad.Codensity
import qualified Data.Functor.Contravariant.Day
import qualified Data.Functor.Contravariant.Yoneda
import qualified Data.Functor.Contravariant.Coyoneda
import qualified Data.Functor.Day
import qualified Data.Functor.Day.Curried
import qualified Data.Functor.Invariant.Day
import qualified Data.Functor.Kan.Lan
import qualified Data.Functor.Kan.Ran
import qualified Data.Functor.Yoneda
import qualified Data.Functor.Coyoneda

-- lens-5.2.2
import qualified Control.Lens
import qualified Control.Exception.Lens
import qualified Control.Lens.At
import qualified Control.Lens.Combinators
import qualified Control.Lens.Cons
import qualified Control.Lens.Each
import qualified Control.Lens.Empty
import qualified Control.Lens.Equality
import qualified Control.Lens.Extras
import qualified Control.Lens.Fold
import qualified Control.Lens.Getter
import qualified Control.Lens.Indexed
import qualified Control.Lens.Internal
import qualified Control.Lens.Internal.Bazaar
import qualified Control.Lens.Internal.ByteString
import qualified Control.Lens.Internal.Context
import qualified Control.Lens.Internal.CTypes
import qualified Control.Lens.Internal.Deque
import qualified Control.Lens.Internal.Exception
import qualified Control.Lens.Internal.FieldTH
import qualified Control.Lens.Internal.PrismTH
import qualified Control.Lens.Internal.Fold
import qualified Control.Lens.Internal.Getter
import qualified Control.Lens.Internal.Indexed
import qualified Control.Lens.Internal.Instances
import qualified Control.Lens.Internal.Iso
import qualified Control.Lens.Internal.Level
import qualified Control.Lens.Internal.List
import qualified Control.Lens.Internal.Magma
import qualified Control.Lens.Internal.Prism
import qualified Control.Lens.Internal.Profunctor
import qualified Control.Lens.Internal.Review
import qualified Control.Lens.Internal.Setter
import qualified Control.Lens.Internal.TH
import qualified Control.Lens.Internal.Zoom
import qualified Control.Lens.Iso
import qualified Control.Lens.Lens
import qualified Control.Lens.Level
import qualified Control.Lens.Operators
import qualified Control.Lens.Plated
import qualified Control.Lens.Prism
import qualified Control.Lens.Profunctor
import qualified Control.Lens.Reified
import qualified Control.Lens.Review
import qualified Control.Lens.Setter
import qualified Control.Lens.TH
import qualified Control.Lens.Traversal
import qualified Control.Lens.Tuple
import qualified Control.Lens.Type
import qualified Control.Lens.Unsound
import qualified Control.Lens.Wrapped
import qualified Control.Lens.Zoom
import qualified Control.Monad.Error.Lens
import qualified Control.Parallel.Strategies.Lens
import qualified Control.Seq.Lens
import qualified Data.Array.Lens
import qualified Data.Bits.Lens
import qualified Data.ByteString.Lens
import qualified Data.ByteString.Strict.Lens
import qualified Data.ByteString.Lazy.Lens
import qualified Data.Complex.Lens
import qualified Data.Data.Lens
import qualified Data.Dynamic.Lens
import qualified Data.HashSet.Lens
import qualified Data.IntSet.Lens
import qualified Data.List.Lens
import qualified Data.Map.Lens
import qualified Data.Sequence.Lens
import qualified Data.Set.Lens
import qualified Data.Text.Lens
import qualified Data.Text.Strict.Lens
import qualified Data.Text.Lazy.Lens
import qualified Data.Tree.Lens
import qualified Data.Typeable.Lens
import qualified Data.Vector.Lens
import qualified Data.Vector.Generic.Lens
import qualified GHC.Generics.Lens
import qualified System.Exit.Lens
import qualified System.FilePath.Lens
import qualified System.IO.Error.Lens
import qualified Language.Haskell.TH.Lens
import qualified Numeric.Lens
import qualified Numeric.Natural.Lens

-- linear-base-0.3.1
import qualified Control.Monad.IO.Class.Linear
import qualified Control.Functor.Linear
import qualified Control.Functor.Linear.Internal.Class
import qualified Control.Functor.Linear.Internal.Instances
import qualified Control.Functor.Linear.Internal.Kan
import qualified Control.Functor.Linear.Internal.MonadTrans
import qualified Control.Functor.Linear.Internal.Reader
import qualified Control.Functor.Linear.Internal.State
import qualified Control.Optics.Linear
import qualified Control.Optics.Linear.Internal
import qualified Control.Optics.Linear.Iso
import qualified Control.Optics.Linear.Lens
import qualified Control.Optics.Linear.Prism
import qualified Control.Optics.Linear.Traversal
import qualified Data.Arity.Linear
import qualified Data.Arity.Linear.Internal
import qualified Data.Array.Destination
import qualified Data.Array.Destination.Internal
import qualified Data.Array.Mutable.Linear
import qualified Data.Array.Mutable.Linear.Internal
import qualified Data.Array.Mutable.Unlifted.Linear
import qualified Data.Array.Polarized
import qualified Data.Array.Polarized.Pull
import qualified Data.Array.Polarized.Pull.Internal
import qualified Data.Array.Polarized.Push
import qualified Data.Bifunctor.Linear
import qualified Data.Bifunctor.Linear.Internal.Bifunctor
import qualified Data.Bifunctor.Linear.Internal.SymmetricMonoidal
import qualified Data.Bool.Linear
import qualified Data.Either.Linear
import qualified Data.Functor.Linear
import qualified Data.Functor.Linear.Internal.Functor
import qualified Data.Functor.Linear.Internal.Applicative
import qualified Data.Functor.Linear.Internal.Traversable
import qualified Data.HashMap.Mutable.Linear
import qualified Data.HashMap.Mutable.Linear.Internal
import qualified Data.List.Linear
import qualified Data.Maybe.Linear
import qualified Data.Monoid.Linear
import qualified Data.Monoid.Linear.Internal.Monoid
import qualified Data.Monoid.Linear.Internal.Semigroup
import qualified Data.Num.Linear
import qualified Data.Ord.Linear
import qualified Data.Ord.Linear.Internal.Ord
import qualified Data.Ord.Linear.Internal.Eq
import qualified Data.Profunctor.Kleisli.Linear
import qualified Data.Profunctor.Linear
import qualified Data.Set.Mutable.Linear
import qualified Data.Set.Mutable.Linear.Internal
import qualified Data.Tuple.Linear
import qualified Data.Tuple.Linear.Compat
import qualified Data.Unrestricted.Linear
import qualified Data.Unrestricted.Linear.Internal.Consumable
import qualified Data.Unrestricted.Linear.Internal.Dupable
import qualified Data.Unrestricted.Linear.Internal.Movable
import qualified Data.Unrestricted.Linear.Internal.Instances
import qualified Data.Unrestricted.Linear.Internal.Ur
import qualified Data.Unrestricted.Linear.Internal.UrT
import qualified Data.Replicator.Linear
import qualified Data.Replicator.Linear.Internal
import qualified Data.Replicator.Linear.Internal.ReplicationStream
import qualified Data.Replicator.Linear.Internal.Instances
import qualified Data.V.Linear
import qualified Data.V.Linear.Internal
import qualified Data.V.Linear.Internal.Instances
import qualified Data.Vector.Mutable.Linear
import qualified Data.Vector.Mutable.Linear.Internal
import qualified Debug.Trace.Linear
import qualified Foreign.Marshal.Pure
import qualified Foreign.Marshal.Pure.Internal
import qualified Prelude.Linear
import qualified Prelude.Linear.Generically
import qualified Prelude.Linear.GenericUtil
import qualified Prelude.Linear.Internal
import qualified Prelude.Linear.Internal.Generically
import qualified Prelude.Linear.Internal.TypeEq
import qualified Prelude.Linear.Unsatisfiable
import qualified Streaming.Linear
import qualified Streaming.Linear.Internal.Consume
import qualified Streaming.Linear.Internal.Interop
import qualified Streaming.Linear.Internal.Many
import qualified Streaming.Linear.Internal.Process
import qualified Streaming.Linear.Internal.Produce
import qualified Streaming.Linear.Internal.Type
import qualified Streaming.Prelude.Linear
import qualified System.IO.Linear
import qualified System.IO.Resource.Linear
import qualified System.IO.Resource.Linear.Internal
import qualified Unsafe.Linear

-- list-t-1.0.5.6
import qualified ListT

-- massiv-1.0.4.0
import qualified Data.Massiv.Array
import qualified Data.Massiv.Array.Delayed
import qualified Data.Massiv.Array.Manifest
import qualified Data.Massiv.Array.Manifest.Vector
import qualified Data.Massiv.Array.Mutable
import qualified Data.Massiv.Array.Mutable.Algorithms
import qualified Data.Massiv.Array.Mutable.Atomic
import qualified Data.Massiv.Array.Numeric
import qualified Data.Massiv.Array.Numeric.Integral
import qualified Data.Massiv.Array.Stencil
import qualified Data.Massiv.Array.Unsafe
import qualified Data.Massiv.Core
import qualified Data.Massiv.Core.Index
import qualified Data.Massiv.Core.List
import qualified Data.Massiv.Core.Operations
import qualified Data.Massiv.Vector
import qualified Data.Massiv.Vector.Stream

-- megaparsec-9.4.1
import qualified Text.Megaparsec
import qualified Text.Megaparsec.Byte
import qualified Text.Megaparsec.Byte.Binary
import qualified Text.Megaparsec.Byte.Lexer
import qualified Text.Megaparsec.Char
import qualified Text.Megaparsec.Char.Lexer
import qualified Text.Megaparsec.Debug
import qualified Text.Megaparsec.Error
import qualified Text.Megaparsec.Error.Builder
import qualified Text.Megaparsec.Internal
import qualified Text.Megaparsec.Pos
import qualified Text.Megaparsec.Stream

-- mono-traversable-1.0.15.3
import qualified Data.Containers
import qualified Data.MonoTraversable
import qualified Data.MonoTraversable.Unprefixed
import qualified Data.NonNull
import qualified Data.Sequences

-- mtl-2.3.1
import qualified Control.Monad.Cont
import qualified Control.Monad.Cont.Class
import qualified Control.Monad.Error.Class
import qualified Control.Monad.Except
import qualified Control.Monad.Identity
import qualified Control.Monad.RWS
import qualified Control.Monad.RWS.Class
import qualified Control.Monad.RWS.CPS
import qualified Control.Monad.RWS.Lazy
import qualified Control.Monad.RWS.Strict
import qualified Control.Monad.Reader
import qualified Control.Monad.Reader.Class
import qualified Control.Monad.State
import qualified Control.Monad.State.Class
import qualified Control.Monad.State.Lazy
import qualified Control.Monad.State.Strict
import qualified Control.Monad.Trans
import qualified Control.Monad.Writer
import qualified Control.Monad.Writer.Class
import qualified Control.Monad.Writer.CPS
import qualified Control.Monad.Writer.Lazy
import qualified Control.Monad.Writer.Strict
import qualified Control.Monad.Accum
import qualified Control.Monad.Select

-- mutable-containers-0.3.4.1
import qualified Data.Mutable

-- mwc-random-0.15.0.2
import qualified System.Random.MWC
import qualified System.Random.MWC.Distributions
import qualified System.Random.MWC.CondensedTable
import qualified System.Random.MWC.SeedSource

-- parallel-3.2.2.0
import qualified Control.Seq
import qualified Control.Parallel
import qualified Control.Parallel.Strategies

-- parsec-3.1.16.1
import qualified Text.Parsec
import qualified Text.Parsec.String
import qualified Text.Parsec.ByteString
import qualified Text.Parsec.ByteString.Lazy
import qualified Text.Parsec.Text
import qualified Text.Parsec.Text.Lazy
import qualified Text.Parsec.Pos
import qualified Text.Parsec.Error
import qualified Text.Parsec.Prim
import qualified Text.Parsec.Char
import qualified Text.Parsec.Combinator
import qualified Text.Parsec.Token
import qualified Text.Parsec.Expr
import qualified Text.Parsec.Language
import qualified Text.Parsec.Perm
import qualified Text.ParserCombinators.Parsec
import qualified Text.ParserCombinators.Parsec.Char
import qualified Text.ParserCombinators.Parsec.Combinator
import qualified Text.ParserCombinators.Parsec.Error
import qualified Text.ParserCombinators.Parsec.Expr
import qualified Text.ParserCombinators.Parsec.Language
import qualified Text.ParserCombinators.Parsec.Perm
import qualified Text.ParserCombinators.Parsec.Pos
import qualified Text.ParserCombinators.Parsec.Prim
import qualified Text.ParserCombinators.Parsec.Token

-- parser-combinators-1.3.0
import qualified Control.Applicative.Combinators
import qualified Control.Applicative.Combinators.NonEmpty
import qualified Control.Applicative.Permutations
import qualified Control.Monad.Combinators
import qualified Control.Monad.Combinators.Expr
import qualified Control.Monad.Combinators.NonEmpty
import qualified Control.Monad.Permutations

-- pretty-1.1.3.6
import qualified Text.PrettyPrint
import qualified Text.PrettyPrint.HughesPJ
import qualified Text.PrettyPrint.HughesPJClass
import qualified Text.PrettyPrint.Annotated
import qualified Text.PrettyPrint.Annotated.HughesPJ
import qualified Text.PrettyPrint.Annotated.HughesPJClass

-- primitive-0.8.0.0
import qualified Control.Monad.Primitive
import qualified Data.Primitive
import qualified Data.Primitive.MachDeps
import qualified Data.Primitive.Types
import qualified Data.Primitive.Array
import qualified Data.Primitive.ByteArray
import qualified Data.Primitive.PrimArray
import qualified Data.Primitive.SmallArray
import qualified Data.Primitive.Ptr
import qualified Data.Primitive.MutVar
import qualified Data.Primitive.MVar
import qualified Data.Primitive.PrimVar

-- process-1.6.17.0
import qualified System.Cmd
import qualified System.Process
import qualified System.Process.Internals

-- profunctors-5.6.2
import qualified Data.Profunctor
import qualified Data.Profunctor.Adjunction
import qualified Data.Profunctor.Cayley
import qualified Data.Profunctor.Choice
import qualified Data.Profunctor.Closed
import qualified Data.Profunctor.Composition
import qualified Data.Profunctor.Mapping
import qualified Data.Profunctor.Monad
import qualified Data.Profunctor.Ran
import qualified Data.Profunctor.Rep
import qualified Data.Profunctor.Sieve
import qualified Data.Profunctor.Strong
import qualified Data.Profunctor.Traversing
import qualified Data.Profunctor.Types
import qualified Data.Profunctor.Unsafe
import qualified Data.Profunctor.Yoneda

-- psqueues-0.2.7.3
import qualified Data.HashPSQ
import qualified Data.IntPSQ
import qualified Data.OrdPSQ

-- random-1.2.1.1
import qualified System.Random
import qualified System.Random.Internal
import qualified System.Random.Stateful

-- reflection-2.1.7
import qualified Data.Reflection

-- regex-tdfa-1.3.2.1
import qualified Data.IntMap.CharMap2
import qualified Data.IntMap.EnumMap2
import qualified Data.IntSet.EnumSet2
import qualified Text.Regex.TDFA
import qualified Text.Regex.TDFA.ByteString
import qualified Text.Regex.TDFA.ByteString.Lazy
import qualified Text.Regex.TDFA.Common
import qualified Text.Regex.TDFA.CorePattern
import qualified Text.Regex.TDFA.IntArrTrieSet
import qualified Text.Regex.TDFA.NewDFA.Engine
import qualified Text.Regex.TDFA.NewDFA.Engine_FA
import qualified Text.Regex.TDFA.NewDFA.Engine_NC
import qualified Text.Regex.TDFA.NewDFA.Engine_NC_FA
import qualified Text.Regex.TDFA.NewDFA.Tester
import qualified Text.Regex.TDFA.NewDFA.Uncons
import qualified Text.Regex.TDFA.NewDFA.MakeTest
import qualified Text.Regex.TDFA.Pattern
import qualified Text.Regex.TDFA.ReadRegex
import qualified Text.Regex.TDFA.Sequence
import qualified Text.Regex.TDFA.String
import qualified Text.Regex.TDFA.TDFA
import qualified Text.Regex.TDFA.TNFA
import qualified Text.Regex.TDFA.Text
import qualified Text.Regex.TDFA.Text.Lazy

-- safe-exceptions-0.1.7.4
import qualified Control.Exception.Safe

-- scientific-0.3.7.0
import qualified Data.ByteString.Builder.Scientific
import qualified Data.Scientific
import qualified Data.Text.Lazy.Builder.Scientific

-- semialign-1.3
import qualified Data.Align
import qualified Data.Crosswalk
import qualified Data.Semialign
import qualified Data.Semialign.Indexed
import qualified Data.Zip

-- semigroupoids-6.0.0.1
import qualified Data.Bifunctor.Apply
import qualified Data.Functor.Alt
import qualified Data.Functor.Apply
import qualified Data.Functor.Bind
import qualified Data.Functor.Bind.Class
import qualified Data.Functor.Bind.Trans
import qualified Data.Functor.Contravariant.Conclude
import qualified Data.Functor.Contravariant.Decide
import qualified Data.Functor.Contravariant.Divise
import qualified Data.Functor.Extend
import qualified Data.Functor.Plus
import qualified Data.Groupoid
import qualified Data.Isomorphism
import qualified Data.Semigroup.Bifoldable
import qualified Data.Semigroup.Bitraversable
import qualified Data.Semigroup.Foldable
import qualified Data.Semigroup.Foldable.Class
import qualified Data.Semigroup.Traversable
import qualified Data.Semigroup.Traversable.Class
import qualified Data.Semigroupoid
import qualified Data.Semigroupoid.Categorical
import qualified Data.Semigroupoid.Dual
import qualified Data.Semigroupoid.Ob
import qualified Data.Semigroupoid.Static
import qualified Data.Traversable.Instances
import qualified Semigroupoids.Do

-- split-0.2.3.5
import qualified Data.List.Split
import qualified Data.List.Split.Internals

-- stm-2.5.1.0
import qualified Control.Concurrent.STM
import qualified Control.Concurrent.STM.TArray
import qualified Control.Concurrent.STM.TVar
import qualified Control.Concurrent.STM.TChan
import qualified Control.Concurrent.STM.TMVar
import qualified Control.Concurrent.STM.TQueue
import qualified Control.Concurrent.STM.TBQueue
import qualified Control.Concurrent.STM.TSem
import qualified Control.Monad.STM

-- strict-0.5
import qualified Data.Strict
import qualified Data.Strict.Classes
import qualified Data.Strict.These
import qualified Data.Strict.Tuple
import qualified Data.Strict.Maybe
import qualified Data.Strict.Either
import qualified System.IO.Strict

-- strict-lens-0.4.0.3
import qualified Data.Strict.Lens

-- tagged-0.8.7
import qualified Data.Tagged
import qualified Data.Proxy.TH

-- template-haskell-2.19.0.0
import qualified Language.Haskell.TH
import qualified Language.Haskell.TH.Lib
import qualified Language.Haskell.TH.Ppr
import qualified Language.Haskell.TH.PprLib
import qualified Language.Haskell.TH.Quote
import qualified Language.Haskell.TH.Syntax
import qualified Language.Haskell.TH.LanguageExtensions
import qualified Language.Haskell.TH.CodeDo
import qualified Language.Haskell.TH.Lib.Internal

-- text-2.0.2
import qualified Data.Text
import qualified Data.Text.Array
import qualified Data.Text.Encoding
import qualified Data.Text.Encoding.Error
import qualified Data.Text.Foreign
import qualified Data.Text.IO
import qualified Data.Text.Internal
import qualified Data.Text.Internal.Builder
import qualified Data.Text.Internal.Builder.Functions
import qualified Data.Text.Internal.Builder.Int.Digits
import qualified Data.Text.Internal.Builder.RealFloat.Functions
import qualified Data.Text.Internal.ByteStringCompat
import qualified Data.Text.Internal.PrimCompat
import qualified Data.Text.Internal.Encoding
import qualified Data.Text.Internal.Encoding.Fusion
import qualified Data.Text.Internal.Encoding.Fusion.Common
import qualified Data.Text.Internal.Encoding.Utf16
import qualified Data.Text.Internal.Encoding.Utf32
import qualified Data.Text.Internal.Encoding.Utf8
import qualified Data.Text.Internal.Fusion
import qualified Data.Text.Internal.Fusion.CaseMapping
import qualified Data.Text.Internal.Fusion.Common
import qualified Data.Text.Internal.Fusion.Size
import qualified Data.Text.Internal.Fusion.Types
import qualified Data.Text.Internal.IO
import qualified Data.Text.Internal.Lazy
import qualified Data.Text.Internal.Lazy.Encoding.Fusion
import qualified Data.Text.Internal.Lazy.Fusion
import qualified Data.Text.Internal.Lazy.Search
import qualified Data.Text.Internal.Private
import qualified Data.Text.Internal.Read
import qualified Data.Text.Internal.Search
import qualified Data.Text.Internal.StrictBuilder
import qualified Data.Text.Internal.Unsafe
import qualified Data.Text.Internal.Unsafe.Char
import qualified Data.Text.Lazy
import qualified Data.Text.Lazy.Builder
import qualified Data.Text.Lazy.Builder.Int
import qualified Data.Text.Lazy.Builder.RealFloat
import qualified Data.Text.Lazy.Encoding
import qualified Data.Text.Lazy.IO
import qualified Data.Text.Lazy.Internal
import qualified Data.Text.Lazy.Read
import qualified Data.Text.Read
import qualified Data.Text.Unsafe

-- tf-random-0.5
import qualified System.Random.TF
import qualified System.Random.TF.Gen
import qualified System.Random.TF.Init
import qualified System.Random.TF.Instances

-- these-1.2
import qualified Data.Functor.These
import qualified Data.These
import qualified Data.These.Combinators

-- these-lens-1.0.1.3
import qualified Data.These.Lens

-- time-1.12.2
import qualified Data.Time.Calendar
import qualified Data.Time.Calendar.MonthDay
import qualified Data.Time.Calendar.OrdinalDate
import qualified Data.Time.Calendar.WeekDate
import qualified Data.Time.Calendar.Julian
import qualified Data.Time.Calendar.Easter
import qualified Data.Time.Calendar.Month
import qualified Data.Time.Calendar.Quarter
import qualified Data.Time.Clock
import qualified Data.Time.Clock.System
import qualified Data.Time.Clock.POSIX
import qualified Data.Time.Clock.TAI
import qualified Data.Time.LocalTime
import qualified Data.Time.Format
import qualified Data.Time.Format.Internal
import qualified Data.Time.Format.ISO8601
import qualified Data.Time

-- transformers-0.6.1.0
import qualified Control.Applicative.Backwards
import qualified Control.Applicative.Lift
import qualified Control.Monad.Signatures
import qualified Control.Monad.Trans.Accum
import qualified Control.Monad.Trans.Class
import qualified Control.Monad.Trans.Cont
import qualified Control.Monad.Trans.Except
import qualified Control.Monad.Trans.Identity
import qualified Control.Monad.Trans.Maybe
import qualified Control.Monad.Trans.Reader
import qualified Control.Monad.Trans.RWS
import qualified Control.Monad.Trans.RWS.CPS
import qualified Control.Monad.Trans.RWS.Lazy
import qualified Control.Monad.Trans.RWS.Strict
import qualified Control.Monad.Trans.Select
import qualified Control.Monad.Trans.State
import qualified Control.Monad.Trans.State.Lazy
import qualified Control.Monad.Trans.State.Strict
import qualified Control.Monad.Trans.Writer
import qualified Control.Monad.Trans.Writer.CPS
import qualified Control.Monad.Trans.Writer.Lazy
import qualified Control.Monad.Trans.Writer.Strict
import qualified Data.Functor.Constant
import qualified Data.Functor.Reverse

-- trifecta-2.1.2
import qualified Text.Trifecta
import qualified Text.Trifecta.Combinators
import qualified Text.Trifecta.Delta
import qualified Text.Trifecta.Highlight
import qualified Text.Trifecta.Parser
import qualified Text.Trifecta.Rendering
import qualified Text.Trifecta.Result
import qualified Text.Trifecta.Rope
import qualified Text.Trifecta.Tutorial
import qualified Text.Trifecta.Util.IntervalMap
import qualified Text.Trifecta.Util.It

-- unboxing-vector-0.2.0.0
import qualified Data.Vector.Unboxing
import qualified Data.Vector.Unboxing.Mutable

-- unix-2.7.3
import qualified System.Posix
import qualified System.Posix.ByteString
import qualified System.Posix.Error
import qualified System.Posix.Resource
import qualified System.Posix.Time
import qualified System.Posix.Unistd
import qualified System.Posix.User
import qualified System.Posix.Signals
import qualified System.Posix.Signals.Exts
import qualified System.Posix.Semaphore
import qualified System.Posix.SharedMem
import qualified System.Posix.ByteString.FilePath
import qualified System.Posix.Directory
import qualified System.Posix.Directory.ByteString
import qualified System.Posix.DynamicLinker.Module
import qualified System.Posix.DynamicLinker.Module.ByteString
import qualified System.Posix.DynamicLinker.Prim
import qualified System.Posix.DynamicLinker.ByteString
import qualified System.Posix.DynamicLinker
import qualified System.Posix.Files
import qualified System.Posix.Files.ByteString
import qualified System.Posix.IO
import qualified System.Posix.IO.ByteString
import qualified System.Posix.Env
import qualified System.Posix.Env.ByteString
import qualified System.Posix.Fcntl
import qualified System.Posix.Process
import qualified System.Posix.Process.Internals
import qualified System.Posix.Process.ByteString
import qualified System.Posix.Temp
import qualified System.Posix.Temp.ByteString
import qualified System.Posix.Terminal
import qualified System.Posix.Terminal.ByteString

-- unordered-containers-0.2.19.1
import qualified Data.HashMap.Internal
import qualified Data.HashMap.Internal.Array
import qualified Data.HashMap.Internal.List
import qualified Data.HashMap.Internal.Strict
import qualified Data.HashMap.Lazy
import qualified Data.HashMap.Strict
import qualified Data.HashSet
import qualified Data.HashSet.Internal

-- utility-ht-0.0.17
import qualified Data.Bits.HT
import qualified Data.Bool.HT
import qualified Data.Eq.HT
import qualified Data.Function.HT
import qualified Data.Ix.Enum
import qualified Data.List.HT
import qualified Data.List.Key
import qualified Data.List.Match
import qualified Data.List.Reverse.StrictElement
import qualified Data.List.Reverse.StrictSpine
import qualified Data.Maybe.HT
import qualified Data.Either.HT
import qualified Data.Monoid.HT
import qualified Data.Ord.HT
import qualified Data.Record.HT
import qualified Data.String.HT
import qualified Data.Tuple.HT
import qualified Data.Tuple.Lazy
import qualified Data.Tuple.Strict
import qualified Control.Monad.HT
import qualified Control.Applicative.HT
import qualified Control.Functor.HT
import qualified Data.Strictness.HT
import qualified Text.Read.HT
import qualified Text.Show.HT

-- vector-0.13.0.0
import qualified Data.Vector.Internal.Check
import qualified Data.Vector.Fusion.Util
import qualified Data.Vector.Fusion.Stream.Monadic
import qualified Data.Vector.Fusion.Bundle.Size
import qualified Data.Vector.Fusion.Bundle.Monadic
import qualified Data.Vector.Fusion.Bundle
import qualified Data.Vector.Generic.Mutable.Base
import qualified Data.Vector.Generic.Mutable
import qualified Data.Vector.Generic.Base
import qualified Data.Vector.Generic.New
import qualified Data.Vector.Generic
import qualified Data.Vector.Primitive.Mutable
import qualified Data.Vector.Primitive
import qualified Data.Vector.Storable.Internal
import qualified Data.Vector.Storable.Mutable
import qualified Data.Vector.Storable
import qualified Data.Vector.Unboxed.Base
import qualified Data.Vector.Unboxed.Mutable
import qualified Data.Vector.Unboxed
import qualified Data.Vector.Mutable
import qualified Data.Vector

-- vector-algorithms-0.9.0.1
import qualified Data.Vector.Algorithms
import qualified Data.Vector.Algorithms.Optimal
import qualified Data.Vector.Algorithms.Insertion
import qualified Data.Vector.Algorithms.Intro
import qualified Data.Vector.Algorithms.Merge
import qualified Data.Vector.Algorithms.Radix
import qualified Data.Vector.Algorithms.Search
import qualified Data.Vector.Algorithms.Heap
import qualified Data.Vector.Algorithms.AmericanFlag
import qualified Data.Vector.Algorithms.Tim

-- vector-stream-0.1.0.0
import qualified Data.Stream.Monadic

-- vector-th-unbox-0.2.2
import qualified Data.Vector.Unboxed.Deriving

-- xhtml-3000.2.2.1
import qualified Text.XHtml
import qualified Text.XHtml.Frameset
import qualified Text.XHtml.Strict
import qualified Text.XHtml.Transitional
import qualified Text.XHtml.Debug
import qualified Text.XHtml.Table

-- ghc-boot-th-9.4.5
import qualified GHC.LanguageExtensions.Type
import qualified GHC.ForeignSrcLang.Type
import qualified GHC.Lexeme


main :: Prelude.IO ()
main = Prelude.return ()
