# Repository Guidelines

## 项目结构与模块组织
- `src/` 为核心逻辑，含 `src/server`（音频/剪贴板/网络服务）、`src/client.rs`（端到端连接）、`src/platform`（平台特定实现）。
- `libs/` 提供复用组件：`hbb_common`（协议、配置、文件传输工具）、`scrap`（屏幕捕获）、`enigo`（键鼠控制）、`clipboard`（跨平台剪贴板）、`virtual_display` 与 `remote_printer` 等平台能力。
- `flutter/` 存放桌面与移动端 Flutter UI；`res/` 资源；`docs/` 文档；`examples/` 示例与插件样板；`appimage`、`flatpak`、`fastlane` 包含发行脚本。
- 构建产物默认位于 `target/`，保持工作区整洁，避免将编译输出加入版本库。

## 构建、测试与开发命令
- Rust 桌面/后端：`cargo build` 或 `cargo build --release`，若需 Flutter 绑定启用 `cargo build --features flutter`；快速运行使用 `cargo run`。
- Flutter 客户端：在 `flutter/` 下执行 `flutter pub get` 后 `flutter run`；Web 端使用 `flutter build web`。
- Docker：`docker build -t rustdesk-builder .` 后按 README 中的 `docker run ...` 复用缓存构建。
- 依赖 vcpkg 与 Sciter/Flutter SDK，确保 `VCPKG_ROOT`、`PKG_CONFIG_PATH` 等环境变量正确，按平台提前安装编译工具链。

## 代码风格与命名约定
- Rust 使用默认 rustfmt；提交前运行 `cargo fmt && cargo clippy --all-targets --all-features -D warnings` 保持风格一致并清零警告。
- 命名：模块/函数用 snake_case，结构体/枚举用 PascalCase，常量用 UPPER_SNAKE；Dart/Flutter 遵循 dartfmt，类/Widget 用 PascalCase，文件名用 snake_case。
- 日志与错误信息保持英文，便于跨语言协作与排查。

## 测试指南
- 运行 `cargo test --all` 覆盖核心逻辑，特性相关用 `--features <feature>`；平台敏感代码需在对应系统验证。
- Flutter 单元/UI 测试使用 `flutter test`；涉及 UI 交互改动时补充截图或黄金图说明预期。
- 新功能应附最小可复现测试，避免依赖外部网络；测试文件命名 `*_test.rs` 或 `*_test.dart`。

## 提交与 Pull Request
- Commit 信息使用祈使句简短摘要，保持原子性；所有提交添加 DCO 签名 `git commit -s`。
- PR 需描述变更目的、实现要点、风险与验证方式；涉及 UI 或协议时附截图/录屏或接口示例。
- 与 issue 关联使用 `Fixes #123` 等关键字；保持分支与 master 同步并按需 rebase。

## 安全与配置提示
- 避免提交私钥、证书、API 密钥；敏感配置使用环境变量或本地 `.env`（勿提交）。
- 检查 `build.rs`、`entrypoint.sh` 等脚本的权限与路径，避免无意的 sudo/全局写操作；更新依赖前确认许可证兼容。
