module Lib
    ( someFunc, readData, readAndWriteFiles
    ) where

--import qualified System.Directory as D
import System.Directory
import Control.Monad
import Data.List
import Data.List.Split
someFunc :: IO ()
someFunc = putStrLn "someFunc!!"

-- :load src/Lib.hs
readData :: String -> IO String
readData a = do
  content <- readFile $ a ++ "." ++ "txt"
  return content


readAndWriteFiles :: IO ()
readAndWriteFiles = do
  from_path_file <- readData "from_path"
  to_path_file <- readData "to_path"
  let from_files = (lines from_path_file)
  let to_files = (lines to_path_file)

  --createDirWalk to_files
  -- sequence_ $ zipWith copyFile (lines from_path_file) (lines to_path_file)

  zipWithM_ copyFile from_files to_files

-- createDirectoryIfMissing True "C:\\Users\\yuhnam.ITEMBAY\\Desktop\\temp\\dockey_test\\BatchTLSTest2.class"
createDirWalk :: [String] -> [IO ()]
createDirWalk paths = map createDirectoryRecur $ (map removeFileName) paths

createDirectoryRecur = createDirectoryIfMissing True

removeFileName :: String -> String
removeFileName filePathName = intercalate "\\" $ init $ splitOn "\\" filePathName
-- Prelude Data.List Data.List.Split> intercalate "\\" $ init $ splitOn "\\" a
