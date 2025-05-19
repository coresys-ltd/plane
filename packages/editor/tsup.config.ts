// packages/editor/tsup.config.ts
import { defineConfig } from 'tsup'

export default defineConfig({
  entry: ['src/index.ts', 'src/lib.ts'],
  format: ['esm', 'cjs'],
  target: 'es6',
  dts: false, // <-- disable declaration files
  external: ['react'],
  minify: true,
})
