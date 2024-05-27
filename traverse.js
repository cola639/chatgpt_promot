const fs = require("fs")
const path = require("path")
const os = require("os")
const fileName = "content"

// 定义白名单文件名数组
const whiteList = ["allowedFile1.txt", "allowedFile2.txt"] // 根据需要添加文件名

// 递归遍历目录并处理文件
function traverseDirectory(dir, callback) {
  fs.readdir(dir, (err, files) => {
    if (err) {
      console.error("Cannot read directory:", err)
      return
    }

    files.forEach((file) => {
      const filePath = path.join(dir, file)
      fs.stat(filePath, (err, stats) => {
        if (err) {
          console.error("Cannot read file stats:", err)
          return
        }

        if (stats.isDirectory()) {
          traverseDirectory(filePath, callback)
        } else {
          callback(filePath)
        }
      })
    })
  })
}

// 处理文件内容并写入目标文件
function processFile(filePath, writeStream) {
  const fileName = path.basename(filePath)

  // 检查文件名是否在白名单中，如果在则跳过
  if (whiteList.includes(fileName)) {
    return
  }

  fs.readFile(filePath, "utf8", (err, data) => {
    if (err) {
      console.error("Cannot read file:", err)
      return
    }

    writeStream.write(`文件名 ${fileName}\n`)
    writeStream.write(`文件${fileName}内容\n\n`)
    writeStream.write(`${data}\n\n`)
    writeStream.write("....\n\n")
  })
}

// 主函数
function main() {
  const currentDirectory = process.cwd()
  const desktopPath = path.join(os.homedir(), "Desktop")
  const outputFilePath = path.join(desktopPath, `${fileName}.txt`)
  const writeStream = fs.createWriteStream(outputFilePath, { flags: "w", encoding: "utf8" })

  traverseDirectory(currentDirectory, (filePath) => {
    processFile(filePath, writeStream)
  })

  writeStream.on("finish", () => {
    console.log("文件遍历和内容写入完成")
  })

  writeStream.on("error", (err) => {
    console.error("写入文件时发生错误:", err)
  })
}

// 执行主函数
main()
