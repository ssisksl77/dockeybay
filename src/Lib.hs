module Lib
    ( readAndWriteFiles
    ) where

import System.Directory
import Control.Monad
import Data.List
import Data.List.Split
import GHC.IO.Encoding


readAndWriteFiles :: IO ()
readAndWriteFiles = do
  setLocaleEncoding utf8

  from_path_file <- readData "from_path"
  to_path_file <- readData "to_path"
  let from_files = (lines from_path_file)
  let to_files = (lines to_path_file)
  -- mapM_ putStrLn  to_files
  mapM_ (createDirectoryIfMissing True) (map removeFileName to_files)
  -- sequence_ $ zipWith copyFile (lines from_path_file) (lines to_path_file)s
  zipWithM_ copyFile from_files to_files


readData :: String -> IO String
readData a = do
  content <- readFile $ a ++ "." ++ "txt"
  return content

removeFileName :: String -> String
removeFileName filePathName = intercalate "\\" $ init $ splitOn "\\" filePathName
