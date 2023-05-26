import sha256 from "https://cdn.jsdelivr.net/npm/sha256@0.2.0/+esm";

export default function test() {
  return "hello world : " + sha256("hello world");
}
