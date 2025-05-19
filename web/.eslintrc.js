/** @type {import("eslint").Linter.Config} */
const path = require("path");

module.exports = {
  root: true,
  extends: ["@plane/eslint-config/next.js"],
  parser: "@typescript-eslint/parser",
  parserOptions: {
    project: path.resolve(__dirname, "./tsconfig.json"),
    tsconfigRootDir: __dirname,
  },
  rules: {
    "@typescript-eslint/no-empty-function": "warn",
    "@typescript-eslint/no-explicit-any": "warn",
    "@typescript-eslint/no-non-null-assertion": "warn",
    "@typescript-eslint/no-unused-vars": "warn",
    "@typescript-eslint/no-unused-expressions": "warn"
  },
};
