import sys
import os
import hashlib


def chunkReader(fObj, chunkSize=1024):
    while True:
        chunk = fObj.read(chunkSize)
        if not chunk:
            return
        yield chunk


def getHash(filename, firstChunkOnly=False, hash=hashlib.sha1):
    hashObj = hash()
    fileObject = open(filename, "rb")

    if firstChunkOnly:
        hashObj.update(fileObject.read(1024))
    else:
        for chunk in chunkReader(fileObject):
            hashObjx.update(chunk)
    hashed = hashObj.digest()
    fileObject.close()
    return hashed


def checkForDuplicates(paths, hash=hashlib.sha1):
    hashesBySize = {}
    hashesOn1k = {}
    hashesFull = {}

    for path in paths:
        for dirPath, dirNames, filenames in os.walk(path):
            for filename in filenames:
                fullPath = os.path.join(dirPath, filename)
                try:
                    fullPath = os.path.realpath(fullPath)
                    fileSize = os.path.getsize(fullPath)
                except (OSError,):  # not accessible (permission)
                    continue

                duplicate = hashesBySize.get(fileSize)

                if duplicate:
                    hashesBySize[fileSize].append(fullPath)
                else:
                    hashesBySize[fileSize] = []
                    hashesBySize[fileSize].append(fullPath)

    for __, files in hashesBySize.items():
        if len(files) < 2:
            continue

        for filename in files:
            try:
                fullHash = getHash(filename, firstChunkOnly=True)
            except (OSError,):
                continue

            duplicate = hashesFull.get(fullHash)
            if duplicate:
                print("Duplicates are %s and %s" % (filename, duplicate))
            else:
                hashesFull[fullHash] = filename


if sys.argv[1:]:
    checkForDuplicates(sys.argv[1:])
else:
    print("Please pass the paths to check as parameters to the script")
