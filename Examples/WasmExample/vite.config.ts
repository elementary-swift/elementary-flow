import { defineConfig } from "vite";
import swiftWasm from "@elementary-swift/vite-plugin-swift-wasm";

export default defineConfig({
  resolve: {
    alias: {
      "ElementaryFlow": "../../css/elementary-flow.css",
    },
  },
  plugins: [
    swiftWasm({
      useEmbeddedSDK: true
    }),
  ],
});
