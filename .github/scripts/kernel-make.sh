#!/usr/bin/env bash
# Shared kernel make invocation for CI.
# These must be make command-line arguments: the kernel Makefile overrides
# CC/HOSTCC/CXX/HOSTCXX from the environment when LLVM=1 is set, which would
# bypass ccache.
set -euo pipefail

MAKE_ARGS=(
  -j8
  ARCH=arm64
  SUBARCH=arm64
  CC="ccache clang"
  HOSTCC="ccache clang"
  CXX="ccache clang++"
  HOSTCXX="ccache clang++"
  CROSS_COMPILE=aarch64-linux-gnu-
  CLANG_TRIPLE=aarch64-linux-gnu-
  LLVM=1
  LLVM_IAS=1
  O=out
)

exec make "${MAKE_ARGS[@]}" "$@"
