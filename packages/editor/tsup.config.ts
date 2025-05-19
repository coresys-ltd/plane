import { defineConfig, Options } from "tsup";

export default defineConfig((options: Options) => ({
  entry: ["src/index.ts", "src/lib.ts"],
  format: ["cjs", "esm"],
  dts: false,
  clean: false,
  external: ["react"],
  injectStyle: true,
  ...options,
}));
