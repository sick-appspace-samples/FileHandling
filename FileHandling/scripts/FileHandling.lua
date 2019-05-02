--[[----------------------------------------------------------------------------

  Application Name:
  FileHandling
                                              
  Summary:
  Introduction to file handling

  Description:
  This script opens a file "TestData.txt" in the private and public file system
  and writes something into this file. This file is reopened later and the content
  is read and checked. Also a file is read from the "resources" component.

  How to run:
  To demo this script it must be loaded to the emulator or any device. The result is
  shown in the console and in the files in the AppData directory of this sample.

------------------------------------------------------------------------------]]
--Start of Global Scope---------------------------------------------------------

local prvFileName = 'private/TestData.txt' -- this path is just private for this app
local pubFileName = 'public/TestData.txt' -- this path is public and so the file could be read by other apps
local resFileName = 'resources/myresources.txt' -- this is a resource file which is part of the project
local text = 'Hello World'

--End of Global Scope-----------------------------------------------------------

--Declaration of the 'main' function as an entry point for the event loop
--@main()
local function main()
  -- Open the files for writing and write the content of text variable
  local prvFileWrite = File.open(prvFileName, 'wb')
  File.write(prvFileWrite, text)
  File.close(prvFileWrite)
  local pubFileWrite = File.open(pubFileName, 'wb')
  File.write(pubFileWrite, text)
  File.close(pubFileWrite)

  -- Open the private file for reading and read the length of the text variable
  local prvFile = File.open(prvFileName, 'rb')
  if (prvFile ~= nil) then
    local result = File.read(prvFile, #text)
    File.close(prvFile)
    if result and result:find(text) then
      print('Content of private file matches')
    else
      print('Content of private file does not match')
    end
  end
  -- Open the public file for reading and read the length of the text variable
  local pubFile = File.open(pubFileName, 'rb')
  if (prvFile ~= nil) then
    local result = File.read(pubFile, #text)
    File.close(pubFile)
    if result and result:find(text) then
      print('Content of public file matches')
    else
      print('Content of public file does not match')
    end
  end
  -- Read the content of the resource file
  local resFile = File.open(resFileName, 'rb')
  if (resFile ~= nil) then
    local result = File.read(resFile)
    File.close(resFile)
    print('Content of resource file:')
    print(result)
  else
    print('Resource file not found')
  end
  print('App finished.')
end
--The following registration is part of the global scope which runs once after startup
--Registration of the 'main' function to the 'Engine.OnStarted' event
Script.register('Engine.OnStarted', main)

--End of Function and Event Scope-----------------------------------------------
