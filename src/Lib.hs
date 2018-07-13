module Lib
    ( someFunc, readData, readAndWriteFiles
    ) where

--import qualified System.Directory as D
import System.Directory
import Control.Monad
import Data.List
import Data.List.Split
import GHC.IO.Encoding
-- import System.Win32.Console

someFunc :: IO ()
someFunc = putStrLn "someFunc!!"

-- :load src/Lib.hs
readData :: String -> IO String
readData a = do
  content <- readFile $ a ++ "." ++ "txt"
  return content


readAndWriteFiles :: IO ()
readAndWriteFiles = do
  setLocaleEncoding utf8
  --setConsoleOutputCP 65001

  from_path_file <- readData "from_path"
  to_path_file <- readData "to_path"
  let from_files = (lines from_path_file)
  let to_files = (lines to_path_file)

  -- mapM_ putStrLn  to_files
  -- createDirectoryIfMissing True "C:\\Users\\yuhnam.ITEMBAY\\Desktop\\temp\\dockey_test\\BatchTLSTest2.class"
  mapM_ (createDirectoryIfMissing True) (map removeFileName to_files)

  -- sequence_ $ zipWith copyFile (lines from_path_file) (lines to_path_file)
  zipWithM_ copyFile from_files to_files



removeFileName :: String -> String
removeFileName filePathName = intercalate "\\" $ init $ splitOn "\\" filePathName
-- Prelude Data.List Data.List.Split> intercalate "\\" $ init $ splitOn "\\" a
