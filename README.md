# project-path-print

该项目源于朋友问我是否有打印项目结构的脚本或者工具，我想这个问题好像很多程序员在写技术文档的时候经常要遇到，我就打算写一个脚本来解决这个痛点问题。

## 执行

```shell
sh ./mkdir.sh /your/project/path
e.g.
sh ./mkdir.sh /project/demo
```

## 结果示例

```shell
|--- apps
|---|--- ext
|---|---|--- profile-diff-batch
|---|--- plugins
|---|---|--- hbase-observers
|---|--- toolkit
|---|---|--- export
|---|---|--- phoenix-to-es
|---|---|--- prepare-example
|--- docs
|--- examples
|---|--- connection-es-example
|---|--- streaming-performance-example
|--- sources
|---|--- basics
|---|---|--- basic-hbase-es-observer
|---|---|--- common
|---|---|--- common-component
|---|---|--- common-ignite
|---|---|--- common-spark
|---|---|--- common-test
|---|---|--- common-vertx
|---|---|--- parent
|---|---|--- parent-spark
|---|--- components
|---|---|--- gateway
|---|---|--- storage
|---|---|---|--- storage-ods
|---|---|--- timer
|---|--- terminals
|---|---|--- collect-sdk
```

## 支持列表

支持的语言项目

- [x] Maven (Java/Scala)
- [x] `package.json` (前端)
- [x] `.gitignore`
- [x] `.gitkeep`
- [ ] Gradle

## 实现原理

通过寻找目录标记文件类型或者文件进行定位，目前支持 `pom.xml/package.json/.gitignore/.gitkeep`。

### 开发

自行定制或者支持新的文件类型，只需要修改示例位置的判断条件即可：

```shell
if [ $filename == 'pom.xml' -o $filename == 'package.json' -o $filename == '.gitkeep' -o $filename == '.gitignore' ]
```

## License

Apache Licensed. 具体查看 `License`

